import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';  
import 'package:carousel_pro/carousel_pro.dart';
import 'Home_page.dart';


final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn(); 

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Center(
          child:Stack(
            children: <Widget>[
               Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 10,
                child: SizedBox(
                child: 
                  Carousel(
                    images: [
                      //ExactAssetImage("Image/IndoreMontage.png"),
                      ExactAssetImage("Image/Rajwada.png"),
                      ExactAssetImage("Image/Sarafa.png"),
                      ExactAssetImage("Image/sheesh-mahal.png"),
                      ExactAssetImage("Image/2m.png"),
                      ],
                    moveIndicatorFromBottom: 0.0,
                    dotSize: 1.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.white,
                    indicatorBgPadding: 3.0,
                    dotBgColor: Colors.transparent.withOpacity(0.0),
                    //borderRadius: true,
                    autoplayDuration: Duration(seconds: 5),
                                        
                    //  autoplay: false,
                    //  animationCurve: Curves.elasticInOut,
                    //  boxFit: BoxFit.cover,
                    // animationCurve: ElasticOutCurve(20.0),   
                    )
                ),
            ),
          ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      highlightElevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      elevation: 20.0,
                      color: Colors.black87,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Google Sign in  ',style: TextStyle(color: Colors.white),),
                          Icon(Icons.account_circle,color: Colors.white,)
                        ],
                      ),
                      onPressed: ()=>_googleSignin(),
                    ),
                  ],
                ),
              ],
            ),
            ],
          ), 
         
        ),
      ),
    );
  }

  Future<FirebaseUser> _googleSignin() async {
    GoogleSignInAccount googleSignInAccount =await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

    FirebaseUser user =await auth.signInWithGoogle(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken
    );
    
    print("User is:${user.displayName} ");
    if(user.isEmailVerified == true)
    {
      Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage()), );
    }

    return user;
  }

}
