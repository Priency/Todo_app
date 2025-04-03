import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

class Authform extends StatefulWidget{
  @override
  State<Authform> createState() => _AuthformState();
}

class _AuthformState extends State<Authform> {
  final _formkey = GlobalKey<FormState>();
  var _email ='';
  var _password='';
  var _username='';
  bool _islogin=true;
  startauthentication() async {
    final  isvalid =_formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if(isvalid){
      _formkey.currentState!.save();
      submitform(_email,_password,_username);
    }
  }
  submitform(String email,String password , String username) async{
    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    try{
      if(_islogin){
        authResult = await auth.signInWithEmailAndPassword(email: email, password: password);

      }
      else{
        authResult = await auth.createUserWithEmailAndPassword(email: email, password: password);
        String uid =authResult.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username':username,
          'email':email,
        });
      }
    }
    catch(error){
      print(error);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children:[
            Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator:(value){
                      if(value!.isEmpty || !value.contains('@')){
                        return 'Please enter a valid email address';

                      }
                      return null;//if valid address
                    },
                    onSaved: (value){
                      _email = value!;//value can be null,so ! convert to non null email
                    },
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter you email',
                      labelStyle: GoogleFonts.roboto(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  if(!_islogin)//if we are not logged in or our id is not created in that case we need to create username.
                  TextFormField(
                    validator:(value){
                      if(value!.isEmpty || value.length<7){
                        return 'Please enter a valid username';

                      }
                      return null;//if valid address
                    },
                    onSaved: (value){
                      _username = value!;//value can be null,so ! convert to non null email
                    },
                    key: ValueKey('username'),
                    decoration: InputDecoration(
                        labelText: 'username',
                        hintText: 'Enter you username',
                        labelStyle: GoogleFonts.roboto(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator:(value){
                      if(value!.isEmpty || value.length<7){
                        return 'Please enter a valid password';

                      }
                      return null;//if valid address
                    },
                    onSaved: (value){
                      _password = value!;//value can be null,so ! convert to non null email
                    },
                    key: ValueKey('password'),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter you Password',
                        labelStyle: GoogleFonts.roboto(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 60,
                      width: double.infinity,
                      color: Colors.blueAccent,
                      child: ElevatedButton(
                          onPressed:startauthentication,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),

                      ),
                      child: Text(_islogin ? 'Login' : 'sign Up',style: GoogleFonts.roboto(color: Colors.white,fontSize: 18),))),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextButton(
                        onPressed: (){
                          setState(() {
                            _islogin=!_islogin;
                          });
                        },
                        child: Text(_islogin? 'Create new account' : ' I alredy have an acoount',style: GoogleFonts.roboto(color: Colors.blue,fontSize: 18),)
                    ),
                  )
                ],
              ),
            ),
          ),

      ]
        ),
      ),
    );
  }
}