
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/shared/components/constants.dart';

import '../shared/components/components.dart';
import '../shared/components/valid.dart';
import '../shared/network/remote/crud.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formstate = GlobalKey();
  final Crud _crud = Crud();
  bool isLoading = false;
  bool isShown=false;

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await _crud.postRequest(linkSignup, {
        "fname": fname.text,
        "lname":lname.text,
        "email": email.text,
        "password": password.text
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == "Success!!") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("login", (route) => false);

      } else {
        if(!context.mounted)return;
        AwesomeDialog(
context: context,
dialogType: DialogType.warning,
headerAnimationLoop: false,
animType: AnimType.topSlide,
showCloseIcon: true,
closeIcon: const Icon(Icons.close_fullscreen_outlined),
title: 'Warning',
desc:'${response['status']}',
btnCancelOnPress: () {},
onDismissCallback: (type) {
debugPrint('Dialog Dismiss from callback $type');
},
btnOkOnPress: () {},
).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading == true
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
                            return validInput(val!, 3, 20);
                          },
                          control: fname,
                          label: 'First Name',
                          icona: Icons.perm_identity_outlined,
                          type: TextInputType.text,
                        ),
                        const SizedBox(height: 15),
                        defaultTextField(
                          validate: (val) {
                            return validInput(val!, 3, 20);
                          },
                          control: lname,
                          label: 'Last Name',
                          icona: Icons.perm_identity_outlined,
                          type: TextInputType.text,
                        ),
                        const SizedBox(height: 15),
                        defaultTextField(
                          validate: (val) {
                            return validInputWithSiemens(val!, 3, 50);
                          },
                          control: email,
                          label: 'Email Address',
                          icona: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 15),
                        defaultButton(
                            function: () async {
                              await signUp();
                            },
                            text: 'Sign up'

                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          child:  Text("Login".toUpperCase(),
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil("login", (route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
