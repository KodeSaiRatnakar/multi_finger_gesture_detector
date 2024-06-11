The MultiFingerGestureDetector widget is a custom widget that detects different types of gestures with multiple fingers. It takes three callbacks as parameters: onGestureStart, onGestureUpdate, and onGestureEnd. These callbacks are invoked when the corresponding gesture events occur.

## **Available GestureTypes**

* Tap
* TwoFingerDrag
* TwoFingerTopVerticalDrag
* TwoFingerBottomVerticalDrag
* TwoFingerLeftHorizontalDrag
* TwoFingerRightHorizontalDrag
* ThreeFingerDrag
* ThreeFingerTopVerticalDrag
* ThreeFingerBottomVerticalDrag
* ThreeFingerLeftHorizontalDrag
* ThreeFingerRightHorizontalDrag
* FourFingerDrag
* FourFingerTopVerticalDrag
* FourFingerBottomVerticalDrag
* FourFingerLeftHorizontalDrag
* FourFingerRightHorizontalDrag

## **Usage**

```dart
MultiFingerGestureDetector(
  onGestureStart: (gestureType, offset) {
          debugPrint('On Gesture Start');
          debugPrint(gestureType.name);
          debugPrint('offset: x=${offset.dx} y=${offset.dy}');
          debugPrint('-------------------------');
        },
        onGestureUpdate: (gestureType, offset) {
          debugPrint('On Gesture Update');
          debugPrint(gestureType.name);
          debugPrint('offset: x=${offset.dx} y=${offset.dy}');
          debugPrint('-------------------------');
        },
        onGestureEnd: (gestureType, offset) {
          debugPrint('On Gesture End');
          debugPrint(gestureType.name);
          debugPrint('offset: x=${offset.dx} y=${offset.dy}');
          debugPrint('-------------------------');
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: ColoredBox(
            color: Colors.blue.shade200,
          ),
        ),
)
``` 