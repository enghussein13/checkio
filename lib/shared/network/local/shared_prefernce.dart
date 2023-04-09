// import 'package:shared_preferences/shared_preferences.dart';
//
// class CachHelper {
//   static SharedPreferences? sharedPreferences;
//
//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   static Future<bool> putBool({
//     required String key,
//     required bool value}) async {
//     return await sharedPreferences!.setBool(key, value);
//   }
//
//   static getBool({
//      required String key}) {
//     return sharedPreferences!.getBool(key);
//   }
//
//   static getStr({required String key}){
//     return sharedPreferences?.getString(key);
//   }
//
//   static setStr({required String key,required String value})async{
//     return await sharedPreferences?.setString(key, value);
//   }
//
//
//
//
//
//
//
//
// }
