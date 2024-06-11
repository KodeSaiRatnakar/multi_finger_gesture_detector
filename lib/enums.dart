enum GestureType {
  kTap,

  ///Two Figers Drag
  kTwoFingerDrag,
  kTwoFingerTopVerticalDrag,
  kTwoFingerBottomVerticalDrag,
  kTwoFingerLeftHorizontalDrag,
  kTwoFingerRightHorizontalDrag,

  /// Three Fingers Drag
  kThreeFingerDrag,
  kThreeFingerTopVerticalDrag,
  kThreeFingerBottomVerticalDrag,
  kThreeFingerLeftHorizontalDrag,
  kThreeFingerRightHorizontalDrag,

  /// Four Fingers Drag
  kFourFingerDrag,
  kFourFingerTopVerticalDrag,
  kFourFingerBottomVerticalDrag,
  kFourFingerLeftHorizontalDrag,
  kFourFingerRightHorizontalDrag,

  /// None to be used when no gesture is detected
  kNone,
}

extension GestureTypeExtension on GestureType {
  bool get isTwoFingerDrag {
    return this == GestureType.kTwoFingerDrag ||
        this == GestureType.kTwoFingerTopVerticalDrag ||
        this == GestureType.kTwoFingerBottomVerticalDrag ||
        this == GestureType.kTwoFingerLeftHorizontalDrag ||
        this == GestureType.kTwoFingerRightHorizontalDrag;
  }

  bool get isThreeFingerDrag {
    return this == GestureType.kThreeFingerDrag ||
        this == GestureType.kThreeFingerTopVerticalDrag ||
        this == GestureType.kThreeFingerBottomVerticalDrag ||
        this == GestureType.kThreeFingerLeftHorizontalDrag ||
        this == GestureType.kThreeFingerRightHorizontalDrag;
  }

  bool get isFourFingeDrag {
    return this == GestureType.kFourFingerDrag ||
        this == GestureType.kFourFingerTopVerticalDrag ||
        this == GestureType.kFourFingerBottomVerticalDrag ||
        this == GestureType.kFourFingerLeftHorizontalDrag ||
        this == GestureType.kFourFingerRightHorizontalDrag;
  }
}
