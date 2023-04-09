// import 'dart:io';
//
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:path/path.dart';
// import 'package:untitled1/shared/components/constants.dart';
//
// import '../shared/network/remote/crud.dart';
//
// class MyNotesController extends GetxController {
//   TextEditingController username=TextEditingController();
//   TextEditingController email=TextEditingController();
// TextEditingController password=TextEditingController();
// bool isloading=false;
// List ?notes;
//
//
//
//
//   //-------VISIBLE PASSWORD-----
//   bool isShwon=false;
//   void isVisible(){
//     isShwon=!isShwon;
//     update();
//   }
//
//   //------Sign Up function
//   Crud crud =Crud();
//
// signUp()async{
//   isloading =true;
//   update();
//   var response =await crud.postRequest(linkSignup, {
//     "username":username.text,
//     "email":email.text,
//     "password":password.text
//   });
//   if(response['status']=='Success!!'){
//     isloading=false;
//     update();
//     Get.snackbar(snackPosition:SnackPosition.BOTTOM ,'SUCCESS', 'Your account has been successed!!');
//   }else{
//     //print('SignUp failed');
//   }
//
// }
//
// login()async{
//     isloading =true;
//     update();
//     var response =await crud.postRequest(linkLogin, {
//       "email":email.text,
//       "password":password.text
//     });
//     if(response['status']=='Success!!'){
//       //print(response['data']['id'].toString());
//       //await CachHelper.setStr(key: 'id', value: response['data']['id'].toString());
//       //await CachHelper.setStr(key: 'email', value: response['data']['email']);
//       //await CachHelper.setStr(key: 'password', value: response['data']['password']);
//
//       isloading=false;
//       update();
//       Get.snackbar(snackPosition:SnackPosition.BOTTOM ,'SUCCESS', 'You have successfully login!!');
//       Get.offAllNamed('/home');
//
//     }else{
//
//       Get.snackbar(snackPosition:SnackPosition.BOTTOM ,'Warning','${response['status']}');
//       isloading=false;
//       update();
//     }
//
//
//   }
//
//   loginWithDio()async{
//    var response= await Crud().postRequest(linkLogin,{
//           "email":email.text,
//            "password":password.text
//          });
//    print('Data out is${response.data}');
// }
//
// viewNotes()async{
//   var response = await crud.postRequest(linkViewNotes,{
//     //'id':'${CachHelper.getStr(key: 'id')}'
//   });
//   if(response['status']=='Success!!'){
//     notes=response['data'];
//    // print(notes![0]['notes_id']);
//     update();
//
//
//   }
// }
// addNote({required Map note,required File? file})async{
//   if(file==null){
//     return Get.snackbar('WARNING', 'Please Upload Image');
//   }else{
//   isloading=true;
//   var response = await crud.postRequestWithFile(linkAddNotes,note,file);
//
//   await viewNotes();
//   isloading=false;
//   Get.back();
//
// }}
//
// deleteNote(String index)async{
//   try{
//     var response = await crud.postRequest(linkDeleteNotes,{
//       'id':index
//     } );
//     await viewNotes();
//     update();
//   }catch(e){
//     print(e.toString());
//   }
//
// }
//
//
//
//
// }
//
//
