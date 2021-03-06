import 'package:flutter/material.dart';
import 'package:flutter_app_test/BMI_class.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 60.0;

  double _bmi = 0;

  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  size: 200,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'BMI Calculator',
                  style: TextStyle(
                      color: Colors.red[300],
                      fontSize: 34,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'We care about your health',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Height (cm)',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Container(
                    child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: '$_heightOfUser',
                )),
                Text(
                  '$_heightOfUser cm',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 10,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Weight (kg)',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Container(
                    child: Slider(
                  min: 45.0,
                  max: 150.0,
                  onChanged: (weight) {
                    setState(() {
                      _weightOfUser = weight;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: '$_weightOfUser',
                )),
                Text(
                  '$_weightOfUser kg',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 10,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: FlatButton.icon(
                        onPressed: () {
                          setState(() {
                            _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));
                            if (_bmi >= 18.5 && _bmi <= 25) {
                              _bmiModel = BMIModel(bmi: _bmi, isNormal: true, comments: 'You are fit!');
                            }else if (_bmi < 18.5) {
                              _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: 'You are underweight!');
                            }else if (_bmi > 25 && _bmi <= 30) {
                              _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: 'You are overweight!');
                            }else {
                              _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: 'You are obese!');
                            }
                          });
                        },
                        icon: Icon(Icons.favorite, color: Colors.white,),
                        label: Text('CALCULATE'),
                      textColor: Colors.white,
                    ),
                color: Colors.pink,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
