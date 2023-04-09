import 'dart:io';

//import 'package:dio/dio.dart';
//import 'package:mynotes/shared/components/constants.dart';


// -----------My Notes App Project------------
class DioHelper
{
 // static late Dio dio;

  // static Future<Response> getData({ required String url})async{
  //
  //   return await dio.get(url);
  //
  // }
  // static posty({required String url,required Map<String,dynamic> data})async{
  //   try{
  //     var response =await Dio().post(url,data: data);
  //     print(response);
  //   }catch(e){
  //     print('ERROR IS $e');
  //   }
  // }
  //
  //
  // static Future<Response> postData({required String url,
  //   required Map<String,dynamic> data,})async{
  //   return await dio.post(url,data: data);
  // }

//--------------------------------------------------------
//   static postRequest(String url,Map data)async{
//
//   var res= await Dio().post(url,data: {
//     'email':'mohamed@gmil.com',
//     'pass':'11223344'
//   }).then((value) => print('value is ${value}'));
//
//
//   }
//
//   static postRequestWithImage({required File? loc,required String? image})async{
//     var formData = FormData.fromMap({
//       'title': 'testFrom Dio',
//       'content': 'Dio package test request',
//       'id':'1',
//       'file': await MultipartFile.fromFile(loc!.path, filename: image),
//     });
//     var response = await Dio().post(linkAddNotes, data: formData);
//     print(response.data);
//   }
}
