import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

// We'll use the default flutter HapticFeedback for simplicity and compatibility
// However, this could be easily modified to use a third-party package like flutter_haptic

enum HapticFeedbackType {
  light, // For small interactions
  medium, // For medium interactions
  heavy, // For significant interactions
  success, // For successful operations
  warning, // For warning alerts
  error, // For error alerts
  selection, // For selection events
  rigid, // For rigid feedback
  soft, // For soft feedback
}

@lazySingleton
class HapticFeedbackHelper {
  bool _isInitialized = false;
  bool _canVibrate = false;

  Future<void> initialize() async {
    try {
      // Check if device can vibrate
      // In a real implementation with the Haptics package, this would be:
      // _canVibrate = await Haptics.canVibrate();

      // For now, we'll assume it can
      _canVibrate = true;
      _isInitialized = true;
      debugPrint('Haptic feedback initialized, can vibrate: $_canVibrate');
    } catch (e) {
      debugPrint('Failed to initialize haptic feedback: $e');
      _isInitialized = false;
      _canVibrate = false;
    }
  }

  Future<void> feedback(HapticFeedbackType type) async {
    if (!_isInitialized || !_canVibrate) {
      return;
    }

    try {
      switch (type) {
        case HapticFeedbackType.light:
          await HapticFeedback.lightImpact();
          break;
        case HapticFeedbackType.medium:
          await HapticFeedback.mediumImpact();
          break;
        case HapticFeedbackType.heavy:
          await HapticFeedback.heavyImpact();
          break;
        case HapticFeedbackType.success:
          // In the actual Haptics package, this would be:
          // await Haptics.vibrate(HapticsType.success);
          // For now, we'll use a pattern of vibrations with the built-in API
          await HapticFeedback.lightImpact();
          await Future.delayed(const Duration(milliseconds: 100));
          await HapticFeedback.mediumImpact();
          break;
        case HapticFeedbackType.warning:
          // await Haptics.vibrate(HapticsType.warning);
          await HapticFeedback.mediumImpact();
          await Future.delayed(const Duration(milliseconds: 100));
          await HapticFeedback.mediumImpact();
          break;
        case HapticFeedbackType.error:
          // await Haptics.vibrate(HapticsType.error);
          await HapticFeedback.heavyImpact();
          await Future.delayed(const Duration(milliseconds: 100));
          await HapticFeedback.heavyImpact();
          break;
        case HapticFeedbackType.selection:
          await HapticFeedback.selectionClick();
          break;
        case HapticFeedbackType.rigid:
          // await Haptics.vibrate(HapticsType.rigid);
          await HapticFeedback.mediumImpact();
          break;
        case HapticFeedbackType.soft:
          // await Haptics.vibrate(HapticsType.soft);
          await HapticFeedback.lightImpact();
          break;
      }
    } catch (e) {
      // Silently ignore errors to prevent app crashes when haptic feedback is unavailable
      debugPrint('Haptic feedback error: $e');
    }
  }
}
