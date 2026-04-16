import 'package:flutter/material.dart';

class ChatPopTransition extends StatefulWidget {
  final bool isOpen;
  final Widget child;

  const ChatPopTransition({
    super.key,
    required this.isOpen,
    required this.child,
  });

  @override
  State<ChatPopTransition> createState() => _ChatPopTransitionState();
}

class _ChatPopTransitionState extends State<ChatPopTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    if (widget.isOpen) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant ChatPopTransition oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen != oldWidget.isOpen) {
      widget.isOpen ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      alignment: Alignment.bottomRight,
      child: widget.child,
    );
  }
}
