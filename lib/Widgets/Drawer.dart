import 'package:exploreindore/Src/About_Us.dart';
import 'package:exploreindore/Src/About_indore.dart';
import 'package:exploreindore/Src/Home_page.dart';
import 'package:exploreindore/Src/Login.dart';
import 'package:flutter/material.dart';


class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: ShapeDecoration(
              color: Color.fromRGBO(57, 62, 70, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),topRight: Radius.circular(20.0))
              )
            ),
            width: 300.0,
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: ShapeDecoration(
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0),bottomRight: Radius.circular(20.0))
                    )
                  ),
                  accountName: Text( googleSignIn.currentUser.displayName.toString()),
                  accountEmail: Text(googleSignIn.currentUser.email.toString()),
                  currentAccountPicture: ClipOval(child: Image.network(googleSignIn.currentUser.photoUrl,fit: BoxFit.cover,)),
                ),
                ListTile(
                  title: Text('Home',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.home),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage()), );
                  },
                ),
                Divider(height: 20.0,),
                ListTile(
                  title: Text('About Indore',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.skip_next),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => About_indore()), );
                  },
                ),
                Divider(height: 20.0,),
                ListTile(
                  title: Text('About Us',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.queue_play_next),
                  onTap: (){
                     Navigator.push(context,MaterialPageRoute(builder: (context) => About_Us()), );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}