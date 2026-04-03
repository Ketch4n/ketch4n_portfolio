class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

class ChatState {
  final List<ChatMessage> messages;
  final bool isOpen;
  final bool isLoading;

  const ChatState({
    required this.messages,
    required this.isOpen,
    required this.isLoading,
  });

  factory ChatState.initial() {
    return ChatState(messages: [], isOpen: false, isLoading: false);
  }

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isOpen,
    bool? isLoading,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isOpen: isOpen ?? this.isOpen,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
