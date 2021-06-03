import 'package:doefii/mainhome.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  String email = '';
  String password = '';
  String error= '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             TopViewContiner(),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        cursorColor: Color(0xffBF372A),
                        validator: (val) => val!.contains("@") ? 'Enter Correct Email': null,
                        decoration: InputDecoration(
                          labelText: 'Enter Email',
                          prefixIcon:
                              Icon(Icons.mail_outline, size: 18, color:Color(0xffBF372A)), //add color
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffBF372A),
                            ),
                          ),
                          labelStyle: TextStyle(color: Color(0xff333333), fontFamily: 'Quicksand'),
                          focusColor: Color(0xff1EC39A),
                        ),
                        onChanged: (val){
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        cursorColor: Color(0xffBF372A),
                        obscureText: true,
                        validator: (val) => val!.isEmpty ? 'Enter Correct password': null,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon:
                              Icon(Icons.lock_outline, size: 18, color: Color(0xffBF372A),), //add color
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffBF372A),
                            ),
                          ),
                          labelStyle: TextStyle(color: Color(0xff333333), fontFamily: 'Quicksand'),
                          focusColor: Color(0xff1EC39A),
                        ),
                        onChanged: (val){
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffBF372A),
                        ),
                        child: FlatButton(
                          onPressed: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            });
                          },
                          child: Text(
                            'Log In',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  ),
              SizedBox(height: 12,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
              SizedBox(height: 30,),
              BottomSignUp(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopViewContiner extends StatelessWidget {
  const TopViewContiner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height /2.6,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffBF372A),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
      ),
      child: SafeArea(
         child: Padding(
           padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text(
                 'Easy\nMoney\nTransfer',
                 style: TextStyle(
                   fontFamily: 'Quicksand',
                   fontSize: 40,
                   fontWeight: FontWeight.w600,
                   color: Colors.white,

                 )
               ),
               
               SizedBox(height: 5,),
               Text(
                 'welcome to Doefii, here we give you an experience and a smooth transactions send to the USA, UK & Europe',
                 textAlign: TextAlign.left,
                 style: TextStyle(
                   fontFamily: 'Quicksand',
                   fontSize: 15,
                   fontWeight: FontWeight.w300,
                   color: Colors.white.withOpacity(0.6),

             )
           ),
             ],
           ),
         ),
      ),
    );
  }
}

class BottomSignUp extends StatelessWidget {
  const BottomSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 60
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Dont have an account /  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                    )
              ),
              TextSpan(
                  text: 'Click here',
                  style: TextStyle(
                  color: Color(0xffBF372A),
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                  )
              ),
            ]),
          )
        ],
      ),
    );
  }
}
