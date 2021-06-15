import 'dart:ffi';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
 
  SecondScreenState createState() => SecondScreenState();
 
}
 
class SecondScreenState extends State<SecondScreen>{ 
  
 
  var name = TextEditingController();
  var contactNumber = TextEditingController();
  var email = TextEditingController();
 
  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThirdScreen(
            nameHolder : name.text,
            emailHolder : email.text,
            numberHolder : contactNumber.text
        ))
      );
      
  }
  
  
 
  @override
 Widget build(BuildContext context) {
    return Scaffold(
     
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 150,),
 
             Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  controller: name,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Name Here'),
                  validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                )
              ),
 
              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  controller: email,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Email Here'),
              validator: (input) => input.isValidEmail() ? null : "Check your email",
                )
              ),
 
              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  controller: contactNumber,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Phone Number Here'),
                   validator: (text) {
                if (text.length>10 || text.length<10) {
                  return 'Phone number should contains 10 digits';
                }
                return null;
              },
                )
              ),
 
              RaisedButton(
                onPressed:(){ getItemAndNavigate(context);
                 ;},
                color: Color(0xffFF1744),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Click Here To Send All Entered Items To Third Screen/Page'),
              ),
             
          
        
 
            ],
          ),
        ));
         
  }
}
 
class ThirdScreen extends StatelessWidget {
 
  var  nameHolder ;
  var  emailHolder ;
  var  numberHolder ;
 
  ThirdScreen({
  Key key, @required this.nameHolder, 
  this.emailHolder, 
  this.numberHolder}) : super(key: key);
 
  goBack(BuildContext context){
    Navigator.pop(context);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Activity Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Center(child:
          Text('Name = ' + nameHolder,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),
 
        Center(child:
          Text('Email = ' + emailHolder,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),
 
        Center(child:
          Text('Phone Number = ' + numberHolder,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),
 
          RaisedButton(
            onPressed: ()=> goBack(context),
            
           // {nameHolder='',emailHolder='',numberHolder=''},
            color: Colors.lightBlue,
            textColor: Colors.white,
            child: Text('Delete/Edit'),
          )])
    );
  }
}
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}