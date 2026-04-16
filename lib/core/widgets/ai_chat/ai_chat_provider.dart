import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:ketch4n/core/services/ai_agent_service.dart';
import 'package:ketch4n/core/widgets/ai_chat/ai_chat_entity.dart';
import 'package:ketch4n/core/widgets/ai_chat/ai_chat_notifier.dart';

final aiAgentProvider = Provider<AIAgentService>((ref) {
  return AIAgentService();
});

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  final ai = ref.read(aiAgentProvider);
  return ChatNotifier(ai);
});
