// lib/widgets/ai_chat_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/ai_chat/ai_chat_provider.dart';
import 'package:ketch4n/core/animations/chat_pop.dart';
import 'package:ketch4n/core/animations/typing_indicator.dart';
import 'ai_chat_entity.dart';

class AiChatWidget extends ConsumerStatefulWidget {
  const AiChatWidget({super.key});

  @override
  ConsumerState<AiChatWidget> createState() => _AiChatWidgetState();
}

class _AiChatWidgetState extends ConsumerState<AiChatWidget> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleChat() {
    ref.read(chatProvider.notifier).toggleChat();
  }

  Future<void> _sendMessage() async {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;

    _inputController.clear();

    await ref.read(chatProvider.notifier).sendMessage(text);

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        /// Chat Panel
        if (chatState.isOpen)
          ChatPopTransition(
            isOpen: chatState.isOpen,
            child: _buildChatPanel(chatState),
          ),

        /// FAB Button
        Padding(
          padding: const EdgeInsets.all(24),
          child: FloatingActionButton.extended(
            onPressed: _toggleChat,
            icon: Icon(
              chatState.isOpen ? Icons.close : Icons.chat_bubble_outline,
            ),
            label: Text(chatState.isOpen ? 'Close' : 'Ask Agent'),
          ),
        ),
      ],
    );
  }

  /// =========================
  /// CHAT PANEL
  /// =========================
  Widget _buildChatPanel(ChatState state) {
    return Container(
      width: 370,
      height: 520,
      margin: const EdgeInsets.only(bottom: 90, right: 24),
      decoration: BoxDecoration(
        color: ColorConstants.previewColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildMessageList(state)),

          /// 🔥 NEW Typing Indicator (Wave Dots)
          if (state.isLoading) const TypingIndicator(),

          _buildInputBar(),
        ],
      ),
    );
  }

  /// =========================
  /// HEADER
  /// =========================
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(AppConstants.profileImg),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ketchan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                'Ask me anything!',
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white70, size: 18),
            tooltip: 'Clear chat',
            onPressed: () {
              ref.read(chatProvider.notifier).clearChat();
            },
          ),
        ],
      ),
    );
  }

  /// =========================
  /// MESSAGE LIST
  /// =========================
  Widget _buildMessageList(ChatState state) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(12),
      itemCount: state.messages.length,
      itemBuilder: (_, i) => _buildBubble(state.messages[i]),
    );
  }

  /// =========================
  /// CHAT BUBBLE
  /// =========================
  Widget _buildBubble(ChatMessage msg) {
    final isUser = msg.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : const Color(0xFFF1F0FF),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
        ),
        child: Text(
          msg.text,
          style: TextStyle(
            color: isUser ? Colors.white : const Color(0xFF2D2D2D),
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }

  /// =========================
  /// INPUT BAR
  /// =========================
  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputController,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: 'Ask about skills, projects...',
                hintStyle: const TextStyle(fontSize: 13),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: _sendMessage,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
