import 'package:flutter/material.dart';

import '../models/toast_type.dart';
import 'toast_overlay.dart';

class GenieToast {
  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
  }) {
    ToastOverlay.show(
      context,
      message: message,
      type: type,
    );
  }
}