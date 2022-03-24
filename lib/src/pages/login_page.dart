import 'package:contact_application/src/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Co-App",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 44,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Center(
            child: Text("Login to your App",
              style: TextStyle(
                color:Colors.black12,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.mail,color:Colors.pink)
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            obscureText:true ,
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.vpn_key,color: Colors.pink,)

            ),
          ),

          SizedBox(height: 15,),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Colors.pink,
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical:20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)
              ),
              onPressed: (){},
              child: Text("Login ",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,)),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
              Text("Not a member ?"),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              }, child: Text("Sign up now"))
            ],
          )
        ],
      ),
    );
  }
}
