import 'package:flutter/material.dart';

import '../models/toast_type.dart';
import '../widgets/toast_widget.dart';

class ToastOverlay {
  static void show(
    BuildContext context, {
    required String message,
    required ToastType type,
  }) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) {
        return Positioned(
          top: 1,
          right: 1,
          left: 1,
          child: ToastWidget(
            message: message,
            type: type,
            onDismissed: () {
              entry.remove();
            },
          ),
        );
      },
    );

    overlay.insert(entry);
  }
}