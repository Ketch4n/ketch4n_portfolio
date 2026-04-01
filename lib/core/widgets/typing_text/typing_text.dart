import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/blinking_cursor.dart';
import 'package:ketch4n/core/widgets/typing_text/typing_text_vm.dart';

class TypingTextWidget extends StatefulWidget {
  final TypingTextVM viewModel; // Inject the ViewModel
  final TextStyle? style;
  final bool showCursor;

  const TypingTextWidget({
    super.key,
    required this.viewModel,
    this.style,
    this.showCursor = true,
  });

  @override
  State<TypingTextWidget> createState() => _TypingTextWidgetState();
}

class _TypingTextWidgetState extends State<TypingTextWidget> {
  @override
  void initState() {
    super.initState();
    // The View triggers the intent, but the VM handles the execution
    widget.viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = widget.style ?? DefaultTextStyle.of(context).style;
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return RichText(
          text: TextSpan(
            style: baseStyle,
            children: [
              // 1. The typed text from the ViewModel
              TextSpan(text: widget.viewModel.displayValue),

              // 2. The cursor (restored)
              if (widget.showCursor)
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: BlinkingCursorAnimation(), // Ensure this class exists
                ),
            ],
          ),
        );
      },
    );
  }
}
