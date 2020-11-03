import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bmiModel.isNormal ? Icon(
                  Icons.mood,
                  size: 200,
                  color: Colors.green,
                ) : Icon(
                  Icons.mood_bad,
                  size: 200,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Your BMI is ${bmiModel.bmi.round()}',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '${bmiModel.comments}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),

                bmiModel.isNormal ? Text(
                  'Your BMI is normal',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ) : Text(
                  'Sadly, your BMI is not normal',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20,),

                Container(
                  child: FlatButton.icon(
                    onPressed: () {

                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                    label: Text('CALCULATE AGAIN'),
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
