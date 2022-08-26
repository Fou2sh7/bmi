import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bool isMale;
  final int age;
  final int result;

  String get resultText {
    String resultPhrase = '';
    if (result >= 30) {
      resultPhrase = 'Obese';
    } else if (result > 25 && result < 30) {
      resultPhrase = 'OverWeight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultPhrase = 'Normal';
    } else {
      resultPhrase = 'Thin';
    }
    return resultPhrase;
  }

  const ResultScreen(
      {super.key,
      required this.isMale,
      required this.age,
      required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Result',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gender : ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Result : $result',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Healthiness : $resultText',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Age : $age',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
