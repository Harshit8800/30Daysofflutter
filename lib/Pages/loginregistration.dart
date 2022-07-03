import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formkey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final mobileEditingController = new TextEditingController();
  final otpEditingController = new TextEditingController();
  final confirmOtpEditingController = new TextEditingController();

  var buttonCheanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameEditingController,
                  onSaved: (value) {
                    firstNameEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Enter First Name", labelText: "First name"),
                ),
                TextFormField(
                  controller: secondNameEditingController,
                  onSaved: (value) {
                    secondNameEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Enter Second Name", labelText: "Second name"),
                ),
                TextFormField(
                  controller: mobileEditingController,
                  onSaved: (value) {
                    mobileEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      labelText: "Mobile Number"),
                ),
                TextFormField(
                  controller: otpEditingController,
                  onSaved: (value) {
                    otpEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: "Enter OTP", labelText: "OTP"),
                ),
                TextFormField(
                  controller: confirmOtpEditingController,
                  onSaved: (value) {
                    confirmOtpEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter OTP Again", labelText: "Confirm OTP"),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  color: Color.fromARGB(255, 71, 162, 236),
                  borderRadius: BorderRadius.circular(buttonCheanged ? 50 : 8),
                  child: InkWell(
                    onTap: () {},
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      alignment: Alignment.center,
                      width: buttonCheanged ? 50 : 150,
                      height: 50,
                      child: buttonCheanged
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "SignUp",
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
          ),
        ),
      ),
    );
  }
}
