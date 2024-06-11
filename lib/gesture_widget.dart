import 'package:flutter/material.dart';
import 'enums.dart';

class MultiFingerGestureDetector extends StatefulWidget {
  const MultiFingerGestureDetector({
    super.key,
    required this.onGestureStart,
    required this.onGestureUpdate,
    required this.onGestureEnd,
    this.onTap,
    required this.child,
  });

  /// Only these types of gesture will be detected on onGestureStart
  /// GestureType.kTwoFingerDrag
  /// GestureType.kThreeFingerDrag
  /// GestureType.kFourFingerDrag
  final void Function(GestureType gestureType, Offset offset) onGestureStart;

  /// Only these types of gesture will be detected on onGestureUpdate
  /// GestureType.kTwoFingerDrag
  /// GestureType.kThreeFingerDrag
  /// GestureType.kFourFingerDrag
  final void Function(GestureType gestureType, Offset offset) onGestureUpdate;

  /// All Gestures will be detected on onGestureEnd
  final void Function(GestureType gestureType, Offset offset) onGestureEnd;
  final void Function()? onTap;
  final Widget child;
  @override
  State<MultiFingerGestureDetector> createState() =>
      _MultiFingerGestureDetectorState();
}

class _MultiFingerGestureDetectorState
    extends State<MultiFingerGestureDetector> {
  int pointerCount = 0;

  ///Drag Details
  double initialX = 0;
  double initialY = 0;
  List<double> dragedXCoordinates = [];
  List<double> dragedYCoordinates = [];

  void assignDefault() {
    initialX = 0;
    initialY = 0;
    dragedXCoordinates = [];
    dragedYCoordinates = [];
    pointerCount = 0;
  }

  GestureType gestureTypeFromPointerCount({required int pointersCount}) {
    return switch (pointersCount) {
      2 => GestureType.kTwoFingerDrag,
      3 => GestureType.kThreeFingerDrag,
      4 => GestureType.kFourFingerDrag,
      _ => GestureType.kNone,
    };
  }

  ({int fxAvg, int fyAvg}) dragedCoordinateAverage() {
    return (
      fxAvg: average(dragedXCoordinates),
      fyAvg: average(dragedYCoordinates)
    );
  }

  GestureType onMultiFingerDrag({required int fxAvg, required int fyAvg}) {
    final xDiff = fxAvg - initialX;
    final isRightHorizontallyDrag = xDiff > 0;

    final yDiff = fyAvg - initialY;
    final isBottomVerticallyDrag = yDiff > 0;

    final isHorizontalDrag = xDiff.abs() > yDiff.abs();

    if (isHorizontalDrag) {
      if (isRightHorizontallyDrag) {
        return switch (pointerCount) {
          2 => GestureType.kTwoFingerRightHorizontalDrag,
          3 => GestureType.kThreeFingerRightHorizontalDrag,
          4 => GestureType.kFourFingerRightHorizontalDrag,
          _ => GestureType.kNone,
        };
      } else {
        return switch (pointerCount) {
          2 => GestureType.kTwoFingerLeftHorizontalDrag,
          3 => GestureType.kThreeFingerLeftHorizontalDrag,
          4 => GestureType.kFourFingerLeftHorizontalDrag,
          _ => GestureType.kNone,
        };
      }
    } else {
      if (isBottomVerticallyDrag) {
        return switch (pointerCount) {
          2 => GestureType.kTwoFingerBottomVerticalDrag,
          3 => GestureType.kThreeFingerBottomVerticalDrag,
          4 => GestureType.kFourFingerBottomVerticalDrag,
          _ => GestureType.kNone,
        };
      } else {
        return switch (pointerCount) {
          2 => GestureType.kTwoFingerTopVerticalDrag,
          3 => GestureType.kThreeFingerTopVerticalDrag,
          4 => GestureType.kFourFingerTopVerticalDrag,
          _ => GestureType.kNone,
        };
      }
    }
  }

  int average(List<double> list) {
    num sum = 0;
    for (final i in list) {
      sum += i;
    }
    if (list.isEmpty) return 0;
    return sum ~/ list.length;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onScaleStart: (details) {
        pointerCount = details.pointerCount;
        initialX = details.focalPoint.dx;
        initialY = details.focalPoint.dy;
        if (details.pointerCount == 1) {
          return;
        }

        widget.onGestureStart(
          gestureTypeFromPointerCount(pointersCount: details.pointerCount),
          details.focalPoint,
        );
      },
      onScaleUpdate: (details) {
        dragedXCoordinates = [...dragedXCoordinates, details.focalPoint.dx];
        dragedYCoordinates = [...dragedYCoordinates, details.focalPoint.dy];

        widget.onGestureUpdate(
          gestureTypeFromPointerCount(pointersCount: details.pointerCount),
          details.focalPoint,
        );
      },
      onScaleEnd: (details) {
        final avg = dragedCoordinateAverage();
        final detectedGesture = onMultiFingerDrag(
          fxAvg: avg.fxAvg,
          fyAvg: avg.fyAvg,
        );
        if (detectedGesture != GestureType.kNone) {
          widget.onGestureEnd(
            detectedGesture,
            Offset(
              avg.fxAvg.toDouble(),
              avg.fyAvg.toDouble(),
            ),
          );
        }

        assignDefault();
      },
      child: widget.child,
    );
  }
}
