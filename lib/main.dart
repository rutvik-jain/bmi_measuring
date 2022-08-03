import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmi = 0;
  String message = '';

  void calculate() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        message = "Please enter valid values";
      });
      return;
    }

    setState(() {
      bmi = weight / (height * height);
      if (bmi < 18.5) {
        message = "You are underweight";
      } else if (bmi < 25) {
        message = 'You are healthy';
      } else if (bmi < 30) {
        message = 'You are overweight';
      } else {
        message = 'You are obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            height: 670,
            width: 500,
            color: Colors.black87,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('BMI Calculator',
                  style: TextStyle(fontSize: 24,color: Colors.cyan),),
                ),
                Row(
                  children: [
                   Flexible(
                     child: Padding(
                       padding: const EdgeInsets.only(top: 30,left: 60),
                       child: TextField(
                         keyboardType: TextInputType.number,
                         style: const TextStyle(fontSize: 40,color: Colors.cyan),
                         controller: heightController,
                         decoration: const InputDecoration(
                           border: InputBorder.none,
                           hintText: 'Height',
                           hintStyle: TextStyle(
                             fontSize: 40,
                             color: Colors.white,
                           ),
                         ),
                       ),
                     ),
                   ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30,left: 50),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 40,color: Colors.cyan),
                          controller: weightController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Weight',
                            hintStyle: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                      ),
                    ),
                    ),
                  ],
                ),
                TextButton(onPressed: calculate,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 40,bottom: 30),
                      child: Text('Calculate',
                        style: TextStyle(fontSize: 26,
                            fontWeight: FontWeight.bold,color: Colors.cyan),),
                    )),
                Text(
                  bmi == 0 ? '' : bmi.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 80,color: Colors.cyan),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.cyan,
                  ),
                ),
                Align(
                  heightFactor: 1.5,
                  // widthFactor: 11,
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: const BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                        color: Colors.cyan),),
                ),
                Align(
                  heightFactor: 1.5,
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                        color: Colors.cyan),),
                ),
                Align(
                  heightFactor: 1.5,
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                        color: Colors.cyan),),
                ),
                Align(
                  heightFactor: 1.5,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                        color: Colors.cyan),),
                ),
                Align(
                  heightFactor: 1.5,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                        color: Colors.cyan),),
                ),
                Align(
                  heightFactor: 1.5,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                        color: Colors.cyan),),
                )
              ],
            ),
          ),
        ),
      )
   );
  }
}
