import 'dart:convert';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:flutter_application_1/screen/reg.dart';
import 'package:flutter_application_1/screen/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'api_provider.dart';
import 'package:flutter_application_1/screen/api_provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  ApiProvider apiProvider = ApiProvider();

  Future doLogin() async {
    if (_formkey.currentState!.validate()){
      try{
        var rs = await apiProvider.doLogin(_ctrlUsername.text, _ctrlPassword.text);
        if(rs.statusCode == 200){
          print(rs.body);
          var jsonRes = json.decode(rs.body);

          if (jsonRes['ok']){
            String token = jsonRes['token'];
            print(token);

            //SharedPreferences prefs = await SharedPreferences.getInstance();
            //await prefs.setString('token', token);
            
            //redirect
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Homescreen()));
   
          }else{
            print(jsonRes['error']);
          }
        } else{
          print('server error!');
        }
      } catch(error){
        print(error);
      }
      
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

  body: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.pink, Colors.purple],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Center(
                child: Image.asset(
                  'assets/images/heart.gif',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "Username",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(
                validator: (value){
                  if(value == null){
                    return 'please enter username';
                  }
                },
                controller: _ctrlUsername,
              ),
              SizedBox(height: 15,),
              Text(
                "Password",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(
                validator: (value){
                  if(value == null){
                    return 'please enter password';
                  }
                },
                obscureText: true,
                controller: _ctrlPassword,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => doLogin(),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return RegistrationForm();
                      }));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ),
);

  }
}