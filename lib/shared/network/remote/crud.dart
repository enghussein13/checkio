import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
class Crud{

  getRequest(String url)async{
    try {
      var response =await http.get(Uri.parse(url));
      if(response.statusCode ==200){
        var res = jsonDecode(response.body);
        return res;
      }else {
       // print(response.statusCode);
      }
    }catch(e){
      //print('ERROR IS ${e.toString()}');
    }
  }

  postRequest(String url,Map data)async{
    try {
      var response =await http.post(Uri.parse(url),body: data);
      if(response.statusCode ==200){
        //print(response.body);
        var res = jsonDecode(response.body);
        return res;

      }else {
        print('eeeeeeeeee${response.statusCode}');
      }
    }catch(e){
      print('ERROR Is ${e.toString()}');
    }
  }

  postRequestWithFile(String url,Map data,File? file)async{
    var request = http.MultipartRequest("POST",Uri.parse(url));
    var length= await file!.length();
    var stream =http.ByteStream(file.openRead());
    var multiPartFile = http.MultipartFile("file",stream,length,filename: basename(file.path));
    request.files.add(multiPartFile);
    data.forEach((key, value) {
      request.fields[key]=value;
    });
    var myrequest= await request.send();

    var response = await http.Response.fromStream(myrequest);
    if(response.statusCode==200){
      return response.body;
    }else{
      print(response.statusCode);
    }


  }




}