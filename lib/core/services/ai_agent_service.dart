import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AIAgentService {
  static final String _anonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static final String _baseUrl =
      '${dotenv.env['SUPABASE_URL']}/functions/v1/ai-chat';

  final List<Map<String, String>> _conversationHistory = [];

  Future<String> sendMessage(String userMessage) async {
    _conversationHistory.add({'role': 'user', 'content': userMessage});

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_anonKey',
        },
        body: jsonEncode({'messages': _conversationHistory}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['choices'][0]['message']['content'];
        _conversationHistory.add({'role': 'assistant', 'content': reply});
        return reply.trim();
      } else {
        return 'Something went wrong (${response.statusCode})';
      }
    } catch (e) {
      return 'Connection error: $e';
    }
  }

  void clearHistory() => _conversationHistory.clear();
}
