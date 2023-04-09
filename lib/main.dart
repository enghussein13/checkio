
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/auth_services.dart';
import 'package:untitled1/test.dart';
import 'package:untitled1/view/login.dart';
import 'package:untitled1/view/signup.dart';
import 'package:untitled1/weather_api_screen.dart';
import 'attendance.dart';
import 'home_screen.dart';




late SharedPreferences sharedPref ;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance() ;
  await AuthServices.getPosition();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute:sharedPref.getString("id") == null ? "login" : "home",
    routes: {
    "login": (context) => Login(),
    "signup": (context) => SignUp(),
    "home":(context)=>const HomeScreen()
    },
     // home: MyDataTable(),
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),

    );
  }
}
