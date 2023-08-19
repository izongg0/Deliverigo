import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatefulWidget {
  final double twoDistance;
  final double calories;
  final bool ischecked;
  Result(
      {required this.twoDistance,
      required this.calories,
      required this.ischecked});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Packaging order Complete!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), 
                      spreadRadius: 5, 
                      blurRadius: 7, 
                      offset: Offset(0, 3), 
                    ),
                  ],
                  color: Color(0xffF7ECFF),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 150,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(26, 10, 0, 0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Health and diet',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '- ${(widget.twoDistance * 0.04 * 2).toStringAsFixed(0)} Kcal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 10,
                        top: 15,
                        child: Image.asset(
                          'assets/heart.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), 
                      spreadRadius: 5, 
                      blurRadius: 7, 
                      offset: Offset(0, 3), 
                    ),
                  ],
                  color: Color(0xffE0FFE5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 150,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(26, 10, 0, 0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'A sparing delivery fee',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '+ 4000 won',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 15,
                        right: 10,
                        child: Image.asset(
                          'assets/pig.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), 
                      spreadRadius: 5, 
                      blurRadius: 7, 
                      offset: Offset(0, 3), 
                    ),
                  ],
                  color: Color(0xffDCF2FF),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 150,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(26, 10, 0, 0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'A reduction in carbon emissions',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                              widget.ischecked
                                  ? '- ${(widget.twoDistance * 0.103 + 103).toStringAsFixed(0)}g'
                                  : '- ${(widget.twoDistance * 0.103).toStringAsFixed(0)}g',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ))
                        ],
                      ),
                      Positioned(
                        right: 10,
                        top: 15,
                        child: Image.asset(
                          'assets/tree.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
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
