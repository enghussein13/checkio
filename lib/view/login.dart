import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/home_screen.dart';
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/network/remote/crud.dart';
import '../main.dart';
import '../shared/components/components.dart';
import '../shared/components/valid.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShown=false;

  Crud crud = Crud();

  bool isLoading = false;

  login() async {
    if (formstate.currentState!.validate()) {
      try{
        isLoading = true;
        setState(() {});
        var response = await crud.postRequest(
            linkLogin,
            {"email": email.text, "password": password.text});
        isLoading = false;
        setState(() {});
        if (response['status'] == "Success!!") {
          sharedPref.setString("id", response['data']['id'].toString());
          sharedPref.setString("fname", response['data']['fname']);
          sharedPref.setString("lname", response['data']['lname']);
          sharedPref.setString("email", response['data']['email']);
          if (!context.mounted) return;
          Navigator.of(context).pushReplacementNamed("home");
          // navigateAndFinish(context,GeolocatorScreen());
        } else {
          if (!context.mounted) return;
          defaultDialog(context: context, msg: 'Wrong Email or Password', title: 'Warning', type:DialogType.warning);
        }
      }catch(e){
        print('Errooooooo${e.toString()}');
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
            children: [
                Form(
                  key: formstate,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "images/logo.png",
                          width: 300,
                          height: 200,
                        ),
                      ),
                      defaultTextField(
                        validate: (val) {
                          return validInputWithSiemens(val!, 3, 50);
                        },
                        control: email,
                        label: 'Email Address',
                        icona: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      defaultTextField(
                        validate: (val) {
                          return validInput(val!, 3, 50);
                        },
                        control: password,
                        label: 'Password',
                        icona: Icons.lock_outline,
                        type: TextInputType.text,
                          pwVisible:isShown==false?true:false,
                          suffix: isShown==false ?Icons.visibility_outlined:Icons.visibility_off_outlined,
                          suffixPressed: (){
                            setState(() {
                              isShown=!isShown;
                            });
                          }
                      ),
                      const SizedBox(height: 20),
                      defaultButton(function:() async {
                        await login();
                      } , text: 'Login'),
                      const SizedBox(height: 20),
                      InkWell(
                        child: const Text("Sign Up",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).pushNamed("signup");
                        },
                      )
                    ],
                  ),
                ),
            ],
          ),
              ),
        ));
  }
}
