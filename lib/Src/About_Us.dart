import 'package:exploreindore/Src/Login.dart';
import 'package:exploreindore/Widgets/Drawer.dart';
import 'package:flutter/material.dart';


class About_Us extends StatefulWidget {
  @override
  _About_UsState createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          backgroundColor: Color.fromRGBO(57, 62, 70, 1.0),
          drawer: Info(),
          appBar: AppBar(  
          elevation: 5.0, 
          backgroundColor: Color.fromRGBO(13, 16, 19, 1.0),     
          title: Text('Explore Indore'),
          centerTitle: true,
          actions: <Widget>[
               Stack(
                children: <Widget>[
                IconButton(
                icon: ClipOval(child: Image.network(googleSignIn.currentUser.photoUrl,fit: BoxFit.cover,)),
                onPressed:(){}
              ),
                Opacity(
                    opacity: 0.0,
                    child: PopupMenuButton(
                    elevation: 20.0,  
                    itemBuilder: (BuildContext context){
                      return [
                        PopupMenuItem(child: ListTile(onTap: (){_googleSignout();},title: Text('Sign Out'),trailing: Icon(Icons.power_settings_new),),)
                      ];
                    },
                  ),
                )
                ],
              )
          ],
          ),
          body: ListView(
            children: <Widget>[
             Container(padding: EdgeInsets.all(20.0),child: Center(child: Text('About Us',style: TextStyle(fontSize: 30.0,color: Colors.white),))),
              Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0))),padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text('Devlopers',style: TextStyle(fontSize: 22.0,color: Colors.black),),
                  Padding(padding: EdgeInsets.all(10.0),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 100,width: 100,child: ClipOval(child: Image.asset('Image/Nick.jpg'),)),
                          Text('Nikhil',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(height: 100,width: 100,child: ClipOval(child: Image.asset('Image/Momo.jpg'),)),
                          Text('Mohammad',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(height: 100,width: 100,child: ClipOval(child: Image.asset('Image/Patil.jpg'),)),
                          Text('Mohit',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                        ],
                      )
                    ],
                  )
                ],
              )),
               Divider(height: 20.0,color: Colors.black,),
              Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0))),padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text('Our team has created this app with the help of Flutter and Dart And for the database we used Google Firebase.We have gained experience of developing and maintaing sucessful Application. Developing our application provided us with a lot of exposure and learning how to make software product Succesful. ',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                ],
              )),
            ],
          )
          )
    );
  }

    void _googleSignout(){
  setState(() {Navigator.push(context,MaterialPageRoute(builder: (context) => Login()), );});
  googleSignIn.signOut();
  }
}