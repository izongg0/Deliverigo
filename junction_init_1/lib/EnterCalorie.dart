import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junction_init_1/Calculate.dart';

class EnterCalorie extends StatefulWidget {
  final double two_point_Distance;

  EnterCalorie({required this.two_point_Distance});

  @override
  State<EnterCalorie> createState() => _EnterCalorieState();
}

class _EnterCalorieState extends State<EnterCalorie> {
  bool isChecked = false;
  final TextEditingController getCalories = TextEditingController();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Image.asset('assets/fastfood.png'),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'Please enter the calories of the food',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(48.0),
                  child: TextField(
                    controller: getCalories,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixText: 'kcal ',
                      suffixStyle: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xffB4B4B7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text(
                  "Please check if you bring multiple containers",
                  style: TextStyle(fontSize: 14),
                ),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(
                height: 77,
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
                          try {
                            double enteredCalories =
                                double.parse(getCalories.text);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Calculate(
                                  twoDistance: widget.two_point_Distance,
                                  calories: enteredCalories,
                                  ischecked: isChecked,
                                ),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "Please enter a valid calorie value!")),
                            );
                          }
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
