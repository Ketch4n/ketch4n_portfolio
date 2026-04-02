import 'dart:convert';
import 'package:http/http.dart' as http;

class AIAgentService {
  static String get _anonKey =>
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9odXBlZnRhaXVubXBpbWFuamF5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUwNzc3NjEsImV4cCI6MjA5MDY1Mzc2MX0.pwaFQHinf9iSWZuTr1yDNq9Axw_3v0Bfqrfja-jaeMw';

  static String get _baseUrl =>
      'https://ohupeftaiunmpimanjay.supabase.co/functions/v1/ai-chat';

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

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Safe navigation: Check if choices exists and is not empty
        if (data['choices'] != null && (data['choices'] as List).isNotEmpty) {
          final reply = data['choices'][0]['message']?['content'];

          if (reply != null) {
            _conversationHistory.add({'role': 'assistant', 'content': reply});
            return reply.trim();
          }
        }
        return 'Error: Unexpected response format from AI.';
      } else {
        // If status is not 200, the error message might be in data['error']
        final errorMessage = data['error'] ?? 'Status ${response.statusCode}';
        return 'Server Error: $errorMessage';
      }
    } catch (e) {
      return 'Connection error: $e';
    }
  }

  void clearHistory() => _conversationHistory.clear();
}
