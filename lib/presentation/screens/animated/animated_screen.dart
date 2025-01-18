import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 150;
    height = random.nextInt(300) + 150;
    color = Colors.indigo;
    borderRadius = random.nextInt(100) + 250;
    color = Color.fromARGB(
      random.nextInt(255), 
      random.nextInt(255), 
      random.nextInt(255), 
      1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.bounceOut,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(borderRadius)),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
