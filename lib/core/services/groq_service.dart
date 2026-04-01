// lib/core/services/groq_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ketch4n/core/constants/resume_constant.dart';

class GroqService {
  static const String _apiKey = String.fromEnvironment('GROQ_API_KEY');
  static const String _baseUrl =
      'https://api.groq.com/openai/v1/chat/completions';

  static const String _systemPrompt =
      '''
You are KetchBot, a friendly AI assistant on Christian Mangao's personal portfolio website.
Your job is to help visitors learn about Christian — his skills, experience, projects, and background.

Guidelines:
- Answer ONLY questions about Christian based on the info below
- Speak warmly and professionally, as if you're a colleague who knows him well
- Keep answers short and conversational (2-4 sentences max unless asked for detail)
- If asked about availability or hiring — say Christian is open to opportunities and to reach him at mangao.christian.04@gmail.com
- If asked something unrelated, say: "I'm here to help you learn about Christian — feel free to ask about his skills or projects!"
- Never make up information not found below

--- PORTFOLIO INFO ---
${ResumeConstant.resumeData}
--- END ---
''';

  final List<Map<String, String>> _conversationHistory = [];

  Future<String> sendMessage(String userMessage) async {
    _conversationHistory.add({'role': 'user', 'content': userMessage});

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'llama-3.3-70b-versatile', // best free model on Groq
          'messages': [
            {'role': 'system', 'content': _systemPrompt},
            ..._conversationHistory,
          ],
          'max_tokens': 512,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['choices'][0]['message']['content'] as String;

        _conversationHistory.add({'role': 'assistant', 'content': reply});

        return reply.trim();
      } else {
        final error = jsonDecode(response.body);
        final msg = error['error']['message'] ?? 'Unknown error';
        return 'Sorry, something went wrong: $msg';
      }
    } catch (e) {
      return 'Connection error. Please try again.';
    }
  }

  void clearHistory() => _conversationHistory.clear();
}
