import 'dart:ui';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter login demo';
    return MaterialApp(
      title: appTitle,
      builder: (context,widget)=> widget!,
      initialRoute: '/',
      home: MyCustomFormLogin(appTitle),
    );
  }
}
// Create a Form widget.
class MyCustomFormLogin extends StatefulWidget {
  final String appTitle;

  MyCustomFormLogin(this.appTitle);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomFormLogin> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formLogin = GlobalKey<FormState>();
  String textTest = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void _setDataLogin(){
    String _dataNane = _nameController.text;
    String _passNane = _passwordController.text;
    textTest = _dataNane+' - '+_passNane;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: Form(
        key: _formLogin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter pass';
                  }
                  return null;
                },
              ),
            ),
            Container(
                height: 95,
                width: 383,
                padding: const EdgeInsets.only(left: 10.0, top: 35.0),
                child: TextButton(
                  child: Text('Login'),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(5),
                    ),
                    padding:EdgeInsets.fromLTRB(10, 10 , 10 , 10),
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    if (_formLogin.currentState!.validate()) {
                      _setDataLogin();
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(textTest)));
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login")));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SecondScreen(textTest)),

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen(textTest)),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}