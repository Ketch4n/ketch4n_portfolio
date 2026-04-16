import 'package:flutter_riverpod/legacy.dart';
import 'ai_chat_entity.dart';
import 'package:ketch4n/core/services/ai_agent_service.dart';
import 'package:ketch4n/core/constants/home_constants.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  final AIAgentService aiAgent;

  ChatNotifier(this.aiAgent) : super(ChatState.initial()) {
    _init();
  }

  void _init() {
    state = state.copyWith(
      messages: [ChatMessage(text: PortfolioConfig.holaAI, isUser: false)],
    );
  }

  void toggleChat() {
    state = state.copyWith(isOpen: !state.isOpen);
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty || state.isLoading) return;

    final updatedMessages = [
      ...state.messages,
      ChatMessage(text: text, isUser: true),
    ];

    state = state.copyWith(messages: updatedMessages, isLoading: true);

    final reply = await aiAgent.sendMessage(text);

    state = state.copyWith(
      messages: [
        ...updatedMessages,
        ChatMessage(text: reply, isUser: false),
      ],
      isLoading: false,
    );
  }

  void clearChat() {
    aiAgent.clearHistory();

    state = state.copyWith(
      messages: [
        ChatMessage(
          text: "Chat cleared! Ask me anything about this portfolio.",
          isUser: false,
        ),
      ],
    );
  }
}
