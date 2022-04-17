import 'package:contact_application/src/bloc/authentication/authentication_cubit.dart';
import 'package:contact_application/src/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:contact_application/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmpasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstName = TextFormField(
        validator: (value) {
          if (value == null) {
            return "* required";
          } else {
            return null;
          }
        },
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
        validator: (value) {
          if (value?.length != 10) {
            return " Enter Valid Phone Number ";
          } else if (value == null) {
            return "* Required";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Phone Number"),
        autofocus: false,
        controller: phoneEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value) {});

    final email = TextFormField(
        validator: MultiValidator([
          RequiredValidator(errorText: "* Required"),
          EmailValidator(errorText: "Enter valid email id"),
        ]),
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
    final password = TextFormField(
        controller: _pass,
        validator: (value) {
          if (value == null) {
            return 'Empty';
          }
        },
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Password",
            focusColor: Colors.pink),
        autofocus: false,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          passwordEditingController.text = value!;
        });
    final confirmpassword = TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null) {
          return 'Empty';
        }
        if (value != _pass.text) {
          return 'Not Match';
        }
      },
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
      },
    );
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoaded) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginPage()));
          Fluttertoast.showToast(msg: "Registration Success");
        } else if (state is AuthenticationError) {
          Fluttertoast.showToast(msg: "Registration Failed");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationInitial) {
              return Center(
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
                              const Center(
                                child: Text(
                                  "Register here ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.pink),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              firstName,
                              const SizedBox(
                                height: 15,
                              ),
                              lastName,
                              const SizedBox(
                                height: 15,
                              ),
                              number,
                              const SizedBox(
                                height: 15,
                              ),
                              email,
                              const SizedBox(
                                height: 15,
                              ),
                              password,
                              const SizedBox(
                                height: 15,
                              ),
                              confirmpassword,
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(36.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    String name =
                                        firstNameEditingController.text.trim();
                                    String email =
                                        emailEditingController.text.trim();
                                    String password = _pass.text.trim();
                                    BlocProvider.of<AuthenticationCubit>(
                                            context)
                                        .registerWithEmailPassword(
                                            name, email, password);

                                    if (_formkey.currentState!.validate()) {
                                      const snackbar = SnackBar(
                                          content: Text("Submitting form"));
                                    }
                                  },
                                  child: const Text("Save"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.pink,
                                    onPrimary: Colors.black,
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              );
            } else if (state is AuthenticationLoading) {
              return const CircularProgressIndicator();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
