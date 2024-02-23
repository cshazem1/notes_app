import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

AnimatedSnackBar buildAnimatedSnackBar(String text) {
  return AnimatedSnackBar.material(
    animationDuration: const Duration(milliseconds: 900),
    duration: const Duration(milliseconds: 1600),
    mobilePositionSettings:
    const MobilePositionSettings(topOnDissapear: 10),
    borderRadius: BorderRadius.circular(40),
    text,
    type: AnimatedSnackBarType.success,
    mobileSnackBarPosition: MobileSnackBarPosition
        .top, // Position of snack_bar on mobile devices
    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
    // Position of snack_bar on desktop devices
  );
}
