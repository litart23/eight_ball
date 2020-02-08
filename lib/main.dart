import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

return runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
home: Scaffold(
  backgroundColor:  Colors.grey[100],
  appBar: AppBar(
    title: Text(
      'Eight ball',
    style: TextStyle(
      color: Colors.grey[900],
          fontSize:25,
    ),
    ),
    backgroundColor:Colors.yellow[500] ,
  ),
  body: SafeArea(
    top: false,
    child: EightBall(),
  ),
),
));
}



class EightBall extends StatefulWidget  {
  @override
  _EightBallState createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {

  var word= ['Yes', 'No', 'Maybe' , 'Sure', 'Never'];
  var _animOpacityValue = 0.0;
  var value = 0.5;
  int element = 0;

  void changeWord(){

    var random= Random();
    element = random.nextInt(5);
       }
  @override

  Widget build(BuildContext context) {
    return Center(

      child: SizedBox(
        height: 200,
        width: 200,
        child: FloatingActionButton(

          onPressed: (){
            setState(() {
              _animOpacityValue=1.0; // work only for first on
              sleep(const Duration(seconds:1));
              changeWord();
              print('1');
            });
        },
                 child: CircleAvatar(
                backgroundColor: Colors.grey[900],
                radius: 100,
                child:
                  AnimatedOpacity(
                   duration: Duration(seconds:2),
                    opacity: _animOpacityValue,
                    child: Text(word[element],
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 30
                      ),
                    ),
                  ),
              ),
        ),
      ),

    );
  }
}

