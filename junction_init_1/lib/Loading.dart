import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(Loading());

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/a');
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/circle.png',
              width: 230,
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                'assets/reallogo.png',
                width: 330,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
