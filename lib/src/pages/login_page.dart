import 'package:contact_application/src/bloc/authentication/authentication_cubit.dart';
import 'package:contact_application/src/pages/home_page.dart';
import 'package:contact_application/src/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoaded) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const HomePage()));
          Fluttertoast.showToast(msg: "Login Success");
        } else if (state is AuthenticationError) {
          Fluttertoast.showToast(msg: "Login Error");
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationInitial) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Co-App",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 44,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Login to your App",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail, color: Colors.pink)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.pink,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: RawMaterialButton(
                        fillColor: Colors.pink,
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          BlocProvider.of<AuthenticationCubit>(context)
                              .loginWithEmailPassword(email, password);
                        },
                        child: const Text("Login ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not a member ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text("Sign up now"))
                      ],
                    )
                  ],
                );
              } else if (state is AuthenticationLoading) {
                return const CircularProgressIndicator();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
