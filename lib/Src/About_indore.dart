import 'package:exploreindore/Src/Login.dart';
import 'package:exploreindore/Widgets/Drawer.dart';
import 'package:flutter/material.dart';


class About_indore extends StatefulWidget {
  @override
  _About_indoreState createState() => _About_indoreState();
}

class _About_indoreState extends State<About_indore> {
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
            Column(
            children: <Widget>[
              Container(padding: EdgeInsets.all(20.0),child: Center(child: Text('About Indore',style: TextStyle(fontSize: 30.0,color: Colors.white),))),
              Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0))),padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text('Indore Tourism',style: TextStyle(fontSize: 22.0,color: Colors.black),),
                  Text('The charm of this city lies in its rich cultural heritage which has been preserved over centuries and makes the hints of urbanization and commerce, here a bit more colorful and magical.\nIndore has been one of the fore-runners in the development of the country in the era of modernization. With a population of over one million, Indore is the commercial capital of India. Indore has over the years established itself as the hub of trading and industrial practices in the state. But the charm of this city lies in its rich cultural heritage which has been preserved over centuries. Indore is the quintessential example of a soaring city with countless opportunities which has not lost touch with its history and heritage.',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                ],
              )),
              Divider(height: 20.0,color: Colors.black,),
              Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0))),padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text('Indore - A Mini Version Of Mumbai',style: TextStyle(fontSize: 22.0,color: Colors.black),),
                  Text('One of the most populated cities of Madhya Pradesh, Indore is a major commercial hub, growing exactly on the same lines, as does Indias major commercial capital, Mumbai. However, given the size of both the cities, Indore is aptly nicknamed Mini Mumbai. This city was once ruled by the Maratha scion of Holkars, among whom Devi Ahilya Bai Holkar has a special place in the history of India. Indore is also a major education hub, owing to the city being the seat of both IIT [Indian Institute of Technology] and IIM [Indian Institute of Management]. Very few people know that Indore is also the birth town of star cricketer Rahul Dravid, as well as Bollywood star Salman Khan, who had lived up to five years of his childhood here.',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                ],
              )),
              Divider(height: 20.0,color: Colors.black,),
              Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0))),padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text('History Of Indore',style: TextStyle(fontSize: 22.0,color: Colors.black),),
                  Text('Indore witnessed the conflict between the Mughals, Marathas and the British who wanted to gain domination of Central India. Located in the Malwa Region, the city of Indore was founded by Rao Nandlal Chaudhary. On his visit to the Indreshwar temple, he found the area to be sheltered and secured by natural boundaries on all sides. He established the city of Indrapur and built a fortress there. The name Indore is a change of Indrapur. When the Marathas became powerless after they lost the third battle of Panipat to Ahmad Shah Abdali, an Afghan invader, they had to sue for peace in order to resist the British. After this, the Holkars established their rule on Indore. The Holkar Dynasty was founded by one of the greatest warriors of his time, Maharaja Malhar Rao Holkar I. Even during the British Raj, Indore remained as the part of the Holkar Dynasty. During the Independence of India, it joined a few other Princely States and became a part of Madhya Bharat. Later, it became a part of Madhya Pradesh on November 1, 1956.',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                ],
              )),
              Divider(height: 20.0,color: Colors.black,),
              Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0))),padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text('Restaurants and Local Food in Indore',style: TextStyle(fontSize: 22.0,color: Colors.black),),
                  Text('The cuisine of Indore provides one, countless options for lip-smacking vegetarian dishes with a hint of a South-Indian influence on the food. Being a sparkling city and a unique hub of cultures in and around, this town provides one quite a variety. From the hustle-bustle of street food culture to an array of fine dining experiences, all choices here, are equally delicious. The cuisines that you will find here are Maratha, Rajasthani, Continental, Muslim and South-Indian, Bengali and Mughlai.\nIndore is famous for Indori Poha and Imarti. Adding to this list of essentials, you have Pani Puri, Vadas, Idlis, Dosas, Sabudana Khichdi, Bhel Puri, Poha, Chaat, Kachori, Samosas, Dal Bafla, Chole Bhature and a huge variety of traditional salty snacks called Namkeen. There are also a number of sweets to relish such as Jalebi, Malpua, Gulab Jamun, Rabri, Faluda Kulfi and more. Popular traditional beverages include Jal-Jeera and Lassi.',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                ],
              )),
            ],
          ),
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