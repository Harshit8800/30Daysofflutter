import 'package:flutter/material.dart';
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
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter Mobile No",
                            labelText: "Mobile No."),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Mobile No. can't be empty";
                          } else if (value!.length < 10) {
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
                          onTap: () => moveToHome(context),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
