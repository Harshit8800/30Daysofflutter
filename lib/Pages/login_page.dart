import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/password.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    final form = _formKey.currentState;
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.intermediateryRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  var mobno = 7042;
  var otpno = 2580;
  final mobileText = TextEditingController();
  final otpText = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPassword();
  }

  loadPassword() async {
    await Future.delayed(Duration(seconds: 2));
    final passwordJson = await rootBundle.loadString("assets/files/mob.json");
    final decodedpass = jsonDecode(passwordJson);
    final encodepass = jsonEncode(decodedpass);

    PasswordModel.passw = List.from(decodedpass)
        .map<LoginPassword>((pass) => LoginPassword.fromMap(pass))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: mobileText,
                        onSaved: (value) {
                          mobileText.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter Mobile No",
                            labelText: "Mobile No."),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Mobile No. can't be empty";
                          } else if (!RegExp(
                                  "^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}")
                              .hasMatch(value!)) {
                            return "Mobile No. Length should be 10";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        controller: otpText,
                        onSaved: (value) {
                          otpText.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter OTP", labelText: "OTP"),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Password can't be empty";
                          } else if (value!.length < 4) {
                            return "OTP Length should be atleast 4";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Material(
                        color: Color.fromARGB(255, 71, 162, 236),
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 8),
                        child: InkWell(
                          onTap: () {
                            //                          if(mobileText != '' && otpText != ''){
                            //     var validation = json.encode((element,index) => {  element.mobile == (mobileText) && element.otp == (otpText)});
                            //     if(validation.length > 0){
                            //         ('login Successful');
                            //     }else{
                            //         ('Neel wrong mobile or otp');
                            //     }
                            // }else {
                            //     ('wrong mobile or otp');
                            // }

                            moveToHome(context);
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            alignment: Alignment.center,
                            width: changedButton ? 50 : 150,
                            height: 50,
                            child: changedButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account ? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.loginRegistrationRoute);
                              },
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 98, 175, 238),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
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
