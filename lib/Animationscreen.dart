import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'homescreen.dart';

class CountdownWidget extends StatelessWidget {
  final Duration duration;
  final TextStyle textStyle;
  final VoidCallback? onFinish;

  CountdownWidget({
    required this.duration,
    required this.textStyle,
    this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<int>(
          stream: Stream.periodic(Duration(seconds: 1), (i) => duration.inSeconds - i - 1)
              .take(duration.inSeconds),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final count = snapshot.data!;
              if (count == 0) {
                Future.delayed(Duration.zero, () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              'assets/animation_complete.json',
                            ),
                            Text('Successfully'),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                });
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        count.toString(),
                        style: textStyle,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'วินาที',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  if (count == 0 && onFinish != null)
                    Text(
                      'พร้อมเสิร์ฟ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                ],
              );
            } else {
              return Text(
                '35',
                style: textStyle,
              );
            }
          },
        ),
      ],
    );
  }
}

class Animationscreen extends StatefulWidget {
  final String selectedMenuName;
  Animationscreen({required this.selectedMenuName});

  @override
  _AnimationscreenState createState() => _AnimationscreenState();
}

class _AnimationscreenState extends State<Animationscreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    );

    _controller.forward().whenComplete(() {
      _goToListMenuScreen();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

void _goToListMenuScreen() async {
  await Future.delayed(Duration(seconds: 35), () {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/animation_lk421l36.json',
              controller: _controller,
            ),
          ),
          Positioned(
            right: 50,
            top: 70,
            child: CountdownWidget(
              duration: Duration(seconds: 40),
              textStyle: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'กำลังทำเมนู:${widget.selectedMenuName}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
