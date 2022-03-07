import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class spalsh_screen extends StatefulWidget {
  @override
  _spalsh_screenState createState() => _spalsh_screenState();
}

class _spalsh_screenState extends State<spalsh_screen> {

  startTime() async {
    var _duration = Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
   Navigator.of(context).pushReplacementNamed('/Login');
    //Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage()), );
   
  }
  
  @override
  void initState() {
    super.initState();
    startTime();  
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color.fromRGBO(13, 16, 19, 1.0),
        appBar: AppBar(
          elevation: 0.0,
          title: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            semanticsValue: '0.8',
          ),
          backgroundColor:  Color.fromRGBO(13, 16, 19, 1.0),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Explore Indore',style: TextStyle(fontSize: 40,color: Colors.white),),
               SizedBox(
                  height: 100,
                  width: 200,
                    child: FlareActor('Image/Loader.flr',alignment:Alignment.center,animation: 'SlideThem',color: Colors.black,),
                ),
            ],
          ),
        ),
      );
  }
}
