import 'package:exploreindore/Location/BK.dart';
import 'package:exploreindore/Location/CB.dart';
import 'package:exploreindore/Location/Chappan.dart';
import 'package:exploreindore/Location/Cresent.dart';
import 'package:exploreindore/Location/IMus.dart';
import 'package:exploreindore/Location/JamGate.dart';
import 'package:exploreindore/Location/LalBagh.dart';
import 'package:exploreindore/Location/MayankBlue.dart';
import 'package:exploreindore/Location/Sarafa.dart';
import 'package:exploreindore/Location/Zoo.dart';
import 'package:exploreindore/Location/rajwada.dart';
import 'package:flutter/material.dart';


class Places extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
       Image.asset('Image/1.jpg'),
       Rajwada(),
       Sarafa(),
       CB(),
       Cresent(),
       JamGate(),
       IMus(),
       BK(),
       LalBagh(),
       MayankBlue(),
       Chappan(),
       Zoo(),
      ],
    );
  }
}
/////////////////////////////////////////////////////////////Outskirt///////////////////////////////////////////////////////////////////////////
class Outskirt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
       CB(),
       JamGate(),
       BK(),
      ],
    );
  }
}
/////////////////////////////////////////////////////////////Adventure///////////////////////////////////////////////////////////////////////////
class Adventure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Cresent(),
        MayankBlue(),
        Zoo(),
      ],
    );
  }
}
/////////////////////////////////////////////////////////////Historial///////////////////////////////////////////////////////////////////////////
class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
       Rajwada(),
       LalBagh(),
       IMus(),
      ],
    );
  }
}
/////////////////////////////////////////////////////////////Food///////////////////////////////////////////////////////////////////////////
class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Sarafa(),
        Chappan(),
      ],
    );
  }
}

