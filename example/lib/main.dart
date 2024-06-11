import 'package:flutter/material.dart';
import 'package:multi_finger_gesture_detector/multi_finger_gesture_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiFingerGestureDetector(
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
      ),
    );
  }
}
