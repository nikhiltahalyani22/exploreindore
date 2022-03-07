import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class Rajwada extends StatefulWidget {
  @override
  _RajwadaState createState() => _RajwadaState();
}

bool liked = false;

 @override
 initstate(){
    _saveValues() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('liked', liked);
     } 
     getSharedPreferences() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      liked = prefs.getBool("liked");
      }
 }



class _RajwadaState extends State<Rajwada> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        dense: true,
        title: Container(
           decoration: ShapeDecoration(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(300.0),topRight:Radius.circular(300.0),bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0) )
            ),
            color: Color.fromRGBO(21, 82, 99, 1.0),
             shadows: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 10.0,
                  ),
                ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
              height: 200.0,
              width:  500.0,
              child: 
                Carousel(
                images: [
                ExactAssetImage("Image/Raj1.jpg"),
                ExactAssetImage("Image/Raj2.jpg"),
                ExactAssetImage("Image/Raj3.jpg")
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.white,
                indicatorBgPadding: 3.0,
                dotBgColor: Colors.transparent.withOpacity(0.3),
                borderRadius: false,
                autoplay:false
                 //  animationCurve: Curves.elasticInOut,
                 //  boxFit: BoxFit.cover,
                // animationCurve: ElasticOutCurve(20.0),   
                )
                ),
              ExpansionTile(
                title: Text('Rajwada',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                children: <Widget>[
                  Container(padding: EdgeInsets.all(10.0),child: Text('Rajwada, the immense pride of Indore, is situated at Old Indore, nestled in the midst of the streets of Khajuri Bajar. Rajwada is an architectural marvel and a living example of the grandeur of Holkars. It always fascinates the travelers, as well as locals of Indore and you will often find them flocking in and around the palace to take a look at it. ',style: TextStyle(color: Colors.white),)),
                  
                ],
              ),
              Row(
              children: <Widget>[
              Expanded(
              child: SizedBox(
              height: 55.0,
              child: StreamBuilder(
                stream:  Firestore.instance.collection('Location').snapshots(),
                builder: (context, snapshot){
                if(!snapshot.hasData) return CircularProgressIndicator();
                return 
                ListView.builder(
                physics: NeverScrollableScrollPhysics(),  
                itemExtent: 40.0, 
                itemCount : 1,
                itemBuilder: (context, index)=> ok(context,snapshot.data.documents[8]),
                );
                },
                ),
              ),
            ),
          ],
           )
            ],
          ),
        ),
      ),
    );
  }

  Widget ok (BuildContext context, DocumentSnapshot document){
    return  ListTile(
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(  
              icon: Icon(liked ?  Icons.favorite : Icons.favorite_border,
                    color: liked ? Colors.redAccent : Colors.grey,   
                    size: 32.0,   ),      
              onPressed: (){  
                setState(() {
                 liked =!liked; 
                });
              if(liked== true){
              Firestore.instance.runTransaction((transaction) async{
              DocumentSnapshot freshSnap =
              await transaction.get(document.reference);
              await transaction.update(freshSnap.reference, {
                'Likes':freshSnap['Likes'] + 1,}); });
              }
              else if (liked == false){
              Firestore.instance.runTransaction((transaction) async{
              DocumentSnapshot freshSnap =
              await transaction.get(document.reference);
              await transaction.update(freshSnap.reference, {
                'Likes':freshSnap['Likes'] - 1,}); });
              }

              },
        ),
        Text(document['Likes'].toString(),style: TextStyle(color: Colors.white),) 
            ],
          ),
        IconButton(
                  icon: Icon(Icons.explore,color: Colors.white,size: 32.0,),
                  color: Colors.deepPurple[100],
                  onPressed: ()async {
                     final fakeurl ="https://www.google.com/maps/place/Rajwada,+Indore,+Madhya+Pradesh+452004/@22.7175261,75.8524737,17z/data=!3m1!4b1!4m5!3m4!1s0x3962fda0a27f50f5:0xdd375ab4fdfb3f50!8m2!3d22.71771!4d75.8544848";
                     if (await canLaunch(fakeurl)){
                     launch(fakeurl);
                    }
                  },
                ),
        ],
        ), 
    ); 
  }
  

}