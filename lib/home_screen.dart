import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:untitled1/auth_services.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/network/remote/crud.dart';
import 'package:untitled1/view/checkio_history_screen.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocalAuthentication auth = LocalAuthentication();
   int? checkedIn;
   bool isLoading=false;
   bool day =true;
   XFile ?image;
   // List<Placemark> placemarks=[] ;
   Crud crud=Crud();

  // Future checkMyLocation()async{
  // try{
  //   setState(() {
  //     isLoading=true;
  //   });
  //   placemarks=await placemarkFromCoordinates(AuthServices.cl!.latitude, AuthServices.cl!.longitude);
  //   setState(() {
  //     isLoading=false;
  //   });
  // }catch(error){
  //   defaultDialog(context: context, msg: 'Network Error', title: 'Error', type: DialogType.error);
  // }
  // }


  Future checkOut()async{
    await crud.postRequest(day==true?linkEditNotes:linkEditNightNotes,{
      'checkOut':'${DateTime.now()}',
      'empId':'${sharedPref.get('id')}',
    });
  }

  Future<bool>checkBiometrics()async{
    return await auth.authenticate(localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
            biometricOnly: true
        ));
  }

  Future<Map> checkIn()async{
    try{
      return await crud.postRequest(linkAddNotes,{
        'empId':'${sharedPref.get('id')}',
        'checkIn':'${DateTime.now()}',
        'checkOut':'${DateTime.now()}'
      });
    }catch(error){
      defaultDialog(context: context, msg: error.toString(), title: 'Error', type: DialogType.error);
      return {};
    }
  }





  @override
  void initState() {
    // checkMyLocation();
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person,size: 50,),),
              accountName: Text('Welcome ${sharedPref.getString("lname")!.toUpperCase()}, ${sharedPref.getString("fname")!.toUpperCase()}'),
              accountEmail:Text('${sharedPref.getString("email")}') ),
           ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home_outlined),
            onTap: (){},
          ),
          ListTile(
            title: const Text('Check IO History'),
            leading: const Icon(Icons.archive_outlined),
            onTap: (){
              Navigator.of(context).pop();
              navigateTo(context, const CheckIOHistoryScreen());

            },
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout_outlined),
            onTap: () {
    sharedPref.clear();
    Navigator.of(context)
        .pushNamedAndRemoveUntil("login", (route) => false);
    },
          ),

        ],),
      ),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
          tooltip: 'Reset Your Location'
              ,onPressed: ()async{
            ImagePicker picker=ImagePicker();
            image =await picker.pickImage(source: ImageSource.camera);
            print(image!.name);
            print(image!.path);
            print(image!.openRead());
            print(image);





          },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: isLoading==true?const Center(child: CircularProgressIndicator()):Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // isLoading?const Text(''):Text('${placemarks[0].name}'
            //   ,style: const TextStyle(
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            // ),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Night',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),),
                  Switch(value:day, onChanged: (value){
                    setState(() {
                      day=value;
                    });
                  //  print(day);
                  }),
                  Text('Day',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),

                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: ()async{
                setState(() {
                  isLoading=true;
                });

                AuthServices.cl= await AuthServices.getLatAndLong();
                AuthServices.distanceInMeters = Geolocator.distanceBetween(29.91086123797174,31.752514515955873, AuthServices.cl!.latitude, AuthServices.cl!.longitude);
      if(AuthServices.distanceInMeters! <=400){
        checkBiometrics().then((value) {
          if(value==true){

            checkIn().then((value){
              if(value['status']=="Success!!"){
                defaultDialog(context: context,
                    msg: 'You have successfully Checked In',
                    title: "Success",
                    type: DialogType.success);

                setState(() {
                  isLoading=false;
                });
              }else{

                defaultDialog(context: context,
                    msg: 'Duplicated Check In',
                    title: "Warning",
                    type: DialogType.warning);
                setState(() {
                  isLoading=false;
                });
              }
            });
            checkedIn=1;
          }else{
            defaultDialog(context: context,
                msg: 'You have failed to Check In.Wrong authentication',
                title: "Warning",
                type: DialogType.warning);
          }
        });
      }else{
        defaultDialog(context: context,
            msg: 'You have failed to Check IN.You are away from Site',
            title: "Warning",
            type: DialogType.warning);
        setState(() {
          isLoading=false;
        });

      }

              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('images/in.png',),
                radius: 70,
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: (){

                  if(AuthServices.distanceInMeters! <=400){
                    setState(() {
                      isLoading=true;
                    });
                    checkOut().then((value) {
                      // print(value);
                      return defaultDialog(context: context,
                        msg: 'You have successfully Checked Out',
                        title: "Success",
                        type: DialogType.success);});
                    setState(() {
                      isLoading=false;
                    });
                  }else{

                    defaultDialog(context: context,
                        msg: 'You\'ve failed to Check Out.You are away from Site',
                        title: "Warning",
                        type: DialogType.warning);
                  }

              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('images/out.png',),
                radius: 70,
              ),
            )

              ],
            ),
      )
      );

  }
}
