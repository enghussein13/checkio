
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/styles/colors.dart';


Widget defaultButton({
  Color background=defaultColor,
  double width=double.infinity,
  required var function ,
  required String text,
})=> Container(
  width: width,
  decoration: BoxDecoration(
    color:background,
    borderRadius: BorderRadius.circular(10)

  ),
  child:   MaterialButton(
  onPressed: function,
  child:Center(child: Text(text.toUpperCase(),
  style: const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  color: Colors.white
  ),
  ),
  ),
  ),
);

//--------------------------------------------------

Widget defaultTextField({
  String? Function(String?)? validate,
  required TextEditingController control,
  var onFieldSubmit ,
  var onFieldChange ,
    IconData? suffix,
   var suffixPressed ,
  required String label,
  required IconData icona,
   required TextInputType type,
  bool pwVisible=false,
  var onTap,
})=>TextFormField(
  validator:validate ,
  controller:control ,
  obscureText: pwVisible,
  onFieldSubmitted:onFieldSubmit,
  onChanged:onFieldChange,
  onTap: onTap,
keyboardType:type,
decoration: InputDecoration(
labelText: label,
prefixIcon: Icon(icona),
suffixIcon: suffix != null?IconButton(icon: Icon(suffix), onPressed:suffixPressed):null,

border: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10))),
),
);


//------------------------------------------------------------


Widget defaultListItem(Map model,context)=>Dismissible(

    key: UniqueKey(),

  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child:   Row(



      children: [



        CircleAvatar(



          radius: 40.0,



          child: Text('${model['time']}'),



        ),



        const SizedBox(width: 20.0,),



        Expanded(

          child: Column(



            mainAxisSize: MainAxisSize.min,



            children: [



              Text('${model['title']}',



                style: const TextStyle(



                    fontSize: 20.0,



                    fontWeight: FontWeight.bold



                ),),



              Text('${model['data']}',



                style: const TextStyle(



                    color: Colors.grey



                ),),



            ],



          ),

        ),

        IconButton(onPressed: (){

          //AppCubit.get(context).updateDatabase(status: 'done', id:model['id'],);

        }, icon: const Icon(Icons.check_box),color: Colors.green,),

        IconButton(onPressed: (){

          //AppCubit.get(context).updateDatabase(status: 'archived', id:model['id'],);

        }, icon: const Icon(Icons.archive),color: Colors.black54,),



      ],



    ),

  ),
    //key: Key(model['id'].toString()),
  onDismissed: (direction){
    //AppCubit.get(context).deleteDatabase(id:model['id']);

  },
);


//-------------Navigator.push--------------

void navigateTo( context, widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>widget
    )
);


//-------------Navigator.push and replacement--------------

void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
        builder: (context)=>widget
    ),
        (Route<dynamic> route){
      return false;
    }

);







//------------------------------------------------------------





//-----------------API LESSONS----------------------------------


//-------------------Devider----
Widget divider()=>Container(
  width: double.infinity,
  height: 3.0,
  color: Colors.grey,
);

//-------------------BottomSheetWidget----


Widget cardNotes({
  required void Function()? ontap,
  required  var ondismiss,
  required List? lista,
  required int i
})=>Dismissible(
  onDismissed: ondismiss,
  key: UniqueKey(),
  child:   InkWell(
    onTap: ontap,
    child: Card(
      child: Row(
        children: [
          Expanded(flex:1,
              child: Image.network('$linkImageRoot/${lista![i]['notes_image']}',width: 100,height: 100,fit:BoxFit.fill,)),
          Expanded(
              flex: 2,
              child:  ListTile(
                title: Text('${lista[i]['notes_title']}'),
                subtitle: Text('${lista[i]['notes_content']}'),
              ))
        ],
      ),
    ),
  ),
);



// ---------------Awesome Dialog ---------------------------------


Future defaultDialog({required BuildContext context,required String msg,required String title, required DialogType type})=>AwesomeDialog(
  context: context,
  headerAnimationLoop: false,
  dialogType: type,
  showCloseIcon: true,
  title: title,
  desc:msg,
  btnOkOnPress: () {},
  btnOkColor: Colors.purple,
  btnOkIcon: Icons.check_circle,
  onDismissCallback: (type) {},
).show();

//
// Widget warning({})=>
// AwesomeDialog(
// context: context,
// dialogType: DialogType.warning,
// headerAnimationLoop: false,
// animType: AnimType.topSlide,
// showCloseIcon: true,
// closeIcon: const Icon(Icons.close_fullscreen_outlined),
// title: 'Warning',
// desc:
// 'Dialog description here..................................................',
// btnCancelOnPress: () {},
// onDismissCallback: (type) {
// debugPrint('Dialog Dismiss from callback $type');
// },
// btnOkOnPress: () {},
// ).show();
//
//
//
//
//
//
// AwesomeDialog(
// context: context,
// dialogType: DialogType.error,
// animType: AnimType.rightSlide,
// headerAnimationLoop: false,
// title: 'Error',
// desc:
// 'Dialog description here..................................................',
// btnOkOnPress: () {},
// btnOkIcon: Icons.cancel,
// btnOkColor: Colors.red,
// ).show();
//
//
//
//
//
//
//
//
//
//




