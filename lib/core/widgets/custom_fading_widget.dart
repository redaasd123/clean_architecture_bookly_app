import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const CustomFadingWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero, // تأخير اختياري
  });

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    animation = Tween<double>(begin: 0.2, end: 0.8).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    // نبدأ الـ animation بعد التأخير المحدد
    Future.delayed(widget.delay, () {
      if (mounted) {
        animationController.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}

