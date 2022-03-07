import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class Zoo extends StatefulWidget {
  @override
  _ZooState createState() => _ZooState();
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



class _ZooState extends State<Zoo> {
 

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
                ExactAssetImage("Image/Zoo1.jpg"),
                ExactAssetImage("Image/Zoo2.jpg"),
                ExactAssetImage("Image/Zoo3.jpg")
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
                title: Text('Zoo ',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                children: <Widget>[
                  Container(padding: EdgeInsets.all(10.0),child: Text('Kamla Nehru Prani Sangrahalaya or Indore Zoo is a zoological garden located in Navlakha, Indore is fully owned and managed by Indore Municipal Corporation. This is the largest zoological garden of the state and one of the oldest zoological parks of Madhya Pradesh spread over an area of 4000 sq m.Kamla Nehru prani sangrahlaya is one of the recognized zoo out of total 180 recognized zoos in India. The zoo has different varieties of animals and birds which have been brought from different parts of world. The zoo attempts to breed white tigers, royal Bengal tigers, Himalayan bear and white peacock have been successful. Indore zoo is also a center for reproduction, protection and exhibition of animals, plants and their habitats.',style: TextStyle(color: Colors.white),)),
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
                itemBuilder: (context, index)=> ok(context,snapshot.data.documents[10]),
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
                     final fakeurl ="https://www.google.com/maps/place/Kamla+Nehru+Prani+Sangrahalaya,+Indore/@22.7043486,75.8757083,17z/data=!3m1!4b1!4m5!3m4!1s0x3962fd2081d0e7d3:0x72ef2ddac1d07198!8m2!3d22.7043437!4d75.877897";
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