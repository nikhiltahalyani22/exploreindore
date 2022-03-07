import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class BK extends StatefulWidget {
  @override
  _BKState createState() => _BKState();
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



class _BKState extends State<BK> {
 

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
                ExactAssetImage("Image/BK1.jpg"),
                ExactAssetImage("Image/BK2.jpg"),
                ExactAssetImage("Image/BK3.jpg")
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
                title: Text('Bamniya Kund ',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                children: <Widget>[
                  Container(padding: EdgeInsets.all(10.0),child: Text('The beauty of Indore can be explained by simply saying that it is the kind of serenity that never leaves your memories. With quite a lot of gems spread across the length and breadth of the region, you can easily fall in love with this place. And one such awe-inspiring attraction is that of Bamniya Kund Waterfall.',style: TextStyle(color: Colors.white),)), 
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
                itemBuilder: (context, index)=> ok(context,snapshot.data.documents[0]),
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
                     final fakeurl ="https://www.google.com/maps/place/Lal+Bagh+Palace/@22.7000594,75.8449055,17z/data=!3m1!4b1!4m5!3m4!1s0x3962fdaca5739ae1:0x4d96f8bd2eb77a91!8m2!3d22.7000545!4d75.8470942";
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