import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junction_init_1/Result.dart';

// widget.calories 로 칼로리 불러와짐
// widget.twoDistance 로 거리 불러와짐

class Calculate extends StatefulWidget {
  final double twoDistance;
  final double calories;
  final bool ischecked;
  Calculate(
      {required this.twoDistance,
      required this.calories,
      required this.ischecked});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFFFFFF),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff847878),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Center(
            child: Image.asset(
              'assets/reallogo.png',
              width: 140,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Color(0xff847878)),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              //ddddddfafdfaadfdasfdafd

              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0, 25, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xffF4F4F5),
                        width: 0,
                      )),
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Burned Calories',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Image.asset('assets/workman-removebg-preview.png'),
                            SizedBox(
                              width: 120,
                            ),
                            Column(
                              children: [
                                Text(
                                  "${(widget.twoDistance * 0.04 * 2).toStringAsFixed(0)} kcal",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 32,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                endIndent: 50,
              ),
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0, 25, 0),
                child: Container(
                  height: 270,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xffF4F4F5),
                        width: 0,
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You can eat food',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '= Food Calories - Calories to be burned by worikng distance',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff1D253C),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                  'assets/burger_preview_rev_1.png',
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              width: 70,
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${(widget.calories).toStringAsFixed(0)} kcal",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_right_alt,
                                          size: 40,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${(widget.calories - widget.twoDistance * 0.04 * 2).toStringAsFixed(0)} kcal',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 32,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              ),

              SizedBox(
                height: 40,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFAC4B),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(
                                  twoDistance: widget.twoDistance,
                                  calories: widget.calories,
                                  ischecked: widget.ischecked,
                                ),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
