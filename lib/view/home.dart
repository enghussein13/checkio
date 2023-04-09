// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mynotes/controller/controller.dart';
// import 'package:mynotes/shared/components/components.dart';
// import 'package:mynotes/shared/network/local/shared_prefernce.dart';
// import 'package:path/path.dart';
//
// class HomeLayout extends StatelessWidget {
//    HomeLayout({Key? key}) : super(key: key);
// final MyNotesController controller=Get.put(MyNotesController());
// TextEditingController title =TextEditingController();
// TextEditingController content=TextEditingController();
// File ?file;
// String ?imageName;
//
//   @override
//   Widget build(BuildContext context) {
//     var key =GlobalKey<FormState>();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notes App'),
//         leading: IconButton(onPressed: (){},icon: const Icon(Icons.menu)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child:const Icon(Icons.add),
//         onPressed: (){
//           Get.bottomSheet(
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: key,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//
//                         TextFormField(
//                           controller: title,
//                           keyboardType: TextInputType.text,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Title must not be empty';
//                             }
//                             return null;
//                           },
//                           decoration: const InputDecoration(
//                             labelText: 'Note Title',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         TextFormField(
//                           controller: content,
//                           keyboardType: TextInputType.text,
//                          // obscureText: controller.isShown,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Content must not be empty';
//                             }
//                             return null;
//                           },
//                           decoration:   const InputDecoration(
//                             labelText: 'Note Content',
//                             border:  OutlineInputBorder(),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         defaultButton(function: ()async{
//                           XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery);
//                            file= File(photo!.path);
//                            imageName=basename(photo.path);
//                         }, text: 'Upload')
//                         ,defaultButton(
//                           function: ()async {
//                             if(key.currentState!.validate()){
//
//                               await controller.addNote(file: file,note: {
//                                 'title':title.text,
//                                 'content':content.text,
//                                 'id':CachHelper.getStr(key: 'id')
//                               });
//                               title.text='';
//                               content.text='';
//                               file=null;
//                             }
//
//                           },
//                           text:controller.isloading==true?'${const CircularProgressIndicator()}': 'Add',
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//           backgroundColor: Colors.blue
//           );
//         },
//       ),
//       body: GetBuilder<MyNotesController>(
//         didChangeDependencies: (GetBuilderState x)async{
//           await controller.viewNotes();
//         },
//         builder: (controller)=>Container(
//           padding: const EdgeInsets.all(10),
//           child: controller.notes==null?const Center(child: Text('No Notes Found')):ListView.separated(
//             itemBuilder: (BuildContext context, int index) { return cardNotes(ondismiss: (dir)async{
//               await controller.deleteNote(controller.notes![index]['notes_id']);
//             },ontap: (){}, lista:controller.notes,i: index); },
//             itemCount: controller.notes!.length,
//             separatorBuilder: (BuildContext context, int index) { return Container(); },
//           ),
//         )
//
//       ),
//
//     );
//   }
// }
