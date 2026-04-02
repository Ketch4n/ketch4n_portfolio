import 'dart:convert';
import 'package:http/http.dart' as http;

class AIAgentService {
  static const String _baseUrl =
      'https://<project-id>.functions.supabase.co/ai-chat';

  final List<Map<String, String>> _conversationHistory = [];

  Future<String> sendMessage(String userMessage) async {
    _conversationHistory.add({'role': 'user', 'content': userMessage});

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'messages': _conversationHistory}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final reply = data['choices'][0]['message']['content'];

        _conversationHistory.add({'role': 'assistant', 'content': reply});

        return reply.trim();
      } else {
        return 'Something went wrong.';
      }
    } catch (e) {
      return 'Connection error.';
    }
  }

  void clearHistory() => _conversationHistory.clear();
}
