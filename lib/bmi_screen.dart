import 'dart:math';

import 'package:bmi_app/result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool isMale = true;
  int age = 21;
  double height = 170.00;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Body Mass Index',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildType(context , 'male'),
                    SizedBox(
                      width: 25,
                    ),
                    buildType(context , 'female'),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',style: Theme.of(context).textTheme.headline2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('${height.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headline1,),
                          Text('cm',style: Theme.of(context).textTheme.bodyText1,),
                        ],
                      ),
                      Slider(
                          min: 90.0,
                          max: 250.0,
                          value: height,
                          onChanged: (heght){
                            setState(() {
                              height = heght;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Row(
                  children: [
                    buildCard(context, 'weight'),
                    SizedBox(width: 20,),
                    buildCard(context, 'age'),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){
                    double result = weight / pow(height / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(isMale: isMale, age: age, result: result.round())
                      ),
                    );
                  },
                  child: Text('Calculate',style: Theme.of(context).textTheme.headline2,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildType(BuildContext context , String type) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            isMale = type=='male' ? true : false;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: (type == 'male' && isMale == true) || (type == 'female' && isMale == false) ?Colors.teal : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(
                type=='male' ? Icons.male : Icons.female,
                size: 90,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context , String info) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              info == 'weight' ?'Weight' : 'Age',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              info == 'weight' ?'${weight}' : '${age}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              children: [
                FloatingActionButton(
                  heroTag: info == 'weight' ? 'weight add' : 'age add',
                  onPressed: (){
                    setState(() {
                      info == 'weight' ? weight++ : age++ ;
                    });
                  },
                  child: Icon(
                      Icons.add,
                  ),
                ),
                SizedBox(width: 10,),
                FloatingActionButton(
                  heroTag: info == 'weight' ? 'weight minus' : 'age minus',
                  onPressed: (){
                    setState(() {
                      info == 'weight' ? weight-- : age-- ;
                    });
                  },
                  child: Icon(Icons.remove),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
