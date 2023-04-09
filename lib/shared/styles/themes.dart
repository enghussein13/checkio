import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/shared/styles/colors.dart';
class Themes{
  static ThemeData darkTheme= ThemeData(
textTheme: const TextTheme(
bodyText1: TextStyle(
color: Colors.white,
fontSize: 18.0,
fontWeight: FontWeight.w600
)
),
fontFamily: 'jannah',
primarySwatch:defaultColor ,
//scaffoldBackgroundColor:HexColor('333739'),
appBarTheme: AppBarTheme(
  //color: HexColor('333739'),
elevation: 0.0,
systemOverlayStyle: SystemUiOverlayStyle(
    //statusBarColor: HexColor('333739'),
statusBarIconBrightness: Brightness.light
),
titleTextStyle: TextStyle(
color: Colors.white,
fontSize: 20.0,
fontWeight: FontWeight.bold
),
iconTheme: IconThemeData(
color: Colors.white
)
),
floatingActionButtonTheme: const FloatingActionButtonThemeData(
backgroundColor: Colors.deepOrange
),
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
selectedItemColor: Colors.deepOrange,
unselectedItemColor: Colors.grey
)

);


static ThemeData lightTheme= ThemeData(
textTheme: TextTheme(
bodyText1: TextStyle(
color: Colors.black,
fontSize: 18.0,
fontWeight: FontWeight.w600
)
),
fontFamily: 'jannah',
primarySwatch:defaultColor,
scaffoldBackgroundColor: Colors.white,
appBarTheme: const AppBarTheme(
color: Colors.white,
elevation: 0.0,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.white,
statusBarIconBrightness: Brightness.dark
),
titleTextStyle: TextStyle(
color: Colors.black,
fontSize: 20.0,
fontWeight: FontWeight.bold

),
iconTheme: IconThemeData(
color: Colors.black
)
),
floatingActionButtonTheme: FloatingActionButtonThemeData(
backgroundColor: Colors.deepOrange
),
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
selectedItemColor: Colors.deepOrange,
)

);

static ThemeData customDarkThemeGetx=ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple
    ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepPurple,
    unselectedItemColor: Colors.grey
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,

  )
);

  static ThemeData customLightThemeGetx=ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple
    ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurple,
      )
  );

}