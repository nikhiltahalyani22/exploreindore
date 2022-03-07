import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:exploreindore/Widgets/Listtile.dart';
import 'Login.dart';
import 'package:exploreindore/Widgets/Drawer.dart';
import 'package:flutter/material.dart';

String url =googleSignIn.currentUser.photoUrl;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
   Places(),
   Outskirt(),
   Adventure(),
   History(),
   Food()
 ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          backgroundColor:Colors.white, //Color.fromRGBO(57, 62, 70, 1.0),
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
                icon: ClipOval(child:  Image.network(googleSignIn.currentUser.photoUrl,fit: BoxFit.cover,)),
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
          body: _children[_currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
                  initialIndex: 0,
                  color: Color.fromRGBO(13, 15, 19, 1.0),
                  backgroundColor:Color.fromRGBO(	57, 62, 70, 1.0),
                  //buttonBackgroundColor: Colors.white,
                  items: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.layers,color: Colors.white,),
                        Text(' Home  ',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.landscape,color: Colors.white,),
                        Text('Outskirt ',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.rowing,color: Colors.white,),
                        Text('Adventure ',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.location_city,color: Colors.white,),
                        Text('Historical ',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.fastfood,color: Colors.white,),
                        Text('Food',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ],
                  onTap: (index){
                    setState(() {
                   _currentIndex = index;
                    });
                  },
      ),
      
              
      ),
    );
  }

  void _googleSignout(){
  setState(() {Navigator.push(context,MaterialPageRoute(builder: (context) => Login()), );});
  googleSignIn.signOut();
  }
}


