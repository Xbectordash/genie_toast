import 'dart:async';

import 'package:flutter/material.dart';

import '../models/toast_type.dart';
import 'dust_effect.dart';

class ToastWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final VoidCallback onDismissed;

  const ToastWidget({
    super.key,
    required this.message,
    required this.type,
    required this.onDismissed,
  });

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    Timer(const Duration(seconds: 2), () async {
      await _controller.forward();

      widget.onDismissed();
    });
  }

  Color get backgroundColor {
    switch (widget.type) {
      case ToastType.success:
        return Colors.pink;

      case ToastType.error:
        return Colors.red;

      case ToastType.info:
        return Colors.blue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DustEffect(
      animation: _controller,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            widget.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}