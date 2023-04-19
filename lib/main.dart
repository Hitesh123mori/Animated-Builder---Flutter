import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 5), vsync: this)..repeat();

  void dispose()
  {
    _controller.dispose() ;
        super.dispose() ;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Builder"),
        ),
        body: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 300 ,
                  child: Container(color: Colors.green,
                  width: 23,height: 420,),
                ),
              ),
              builder: (BuildContext context , Widget ? child) {
                return Transform.rotate(
                  angle: _controller.value * 50 * math.pi,
                  child: child,
                );
              },
            ),
            ElevatedButton(onPressed: (){dispose() ;}, child: Text("Stop")) ,
          ],
        ),
      ),
    );
  }
}
