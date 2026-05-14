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
          left: 20,
          right: 20,
          bottom: 100,
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