
import 'package:contact_application/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  var confpswd;
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final phoneEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final groupNameEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    final firstName = TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "First Name",
        ),
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          firstNameEditingController.text = value!;
        });
    final lastName = TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Last Name"),
        autofocus: false,
        controller: lastNameEditingController,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          lastNameEditingController.text = value!;
        });
    final number = TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Phone Number"),
        autofocus: false,
        controller: phoneEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value) {
          if (lastNameEditingController != null) {}
        });

    final email = TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Email"),
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          emailEditingController.text = value!;
        });
    String value;
    final password = TextFormField(
              obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Password",
            focusColor: Colors.pink),
        autofocus: false,
        controller: passwordEditingController,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          passwordEditingController.text = value!;
        });
    final confirmpassword = TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Confirm Password ",
            focusColor: Colors.pink),
        autofocus: false,
        controller: confirmpasswordEditingController,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          confirmpasswordEditingController.text = value!;
        });
    return Scaffold(
      appBar: AppBar(
        actions: [ IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

          },
          icon: Icon(Icons.arrow_back),
        ),

        ],

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Register here ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.pink),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      firstName,
                      SizedBox(
                        height: 15,
                      ),
                      lastName,
                      SizedBox(
                        height: 15,
                      ),
                      number,
                      SizedBox(
                        height: 15,
                      ),
                      email,
                      SizedBox(
                        height: 15,
                      ),
                      password,
                      SizedBox(
                        height: 15,
                      ),
                      confirmpassword,
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Save"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pink,
                                    onPrimary: Colors.black,
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),

                                ),
                        ),
                        ),

                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
