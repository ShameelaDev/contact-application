import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
    );
  }
}
