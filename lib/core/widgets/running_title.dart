import 'package:flutter/material.dart';

class ScrollingTitle extends StatefulWidget {
  final String text;
  const ScrollingTitle({super.key, required this.text});

  @override
  State<ScrollingTitle> createState() => _ScrollingTitleState();
}

class _ScrollingTitleState extends State<ScrollingTitle> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Start animation after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
  }

  void _scroll() async {
    while (_scrollController.hasClients) {
      await Future.delayed(const Duration(seconds: 2));
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 3),
          curve: Curves.linear,
        );
      }
      await Future.delayed(const Duration(seconds: 1));
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          0.0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
