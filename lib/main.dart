import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FormValidation",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";

  void _submit() {
    // you can write your own code according to whatever you want to submit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty && value.length < 7) {
                        return 'Invalid password!';
                      }
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    child: Text("submit"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                email.isEmpty ? Text("No data") : Text(email),
                SizedBox(
                  height: 10,
                ),
                password.isEmpty ? Text("No Data") : Text(password),
              ],
            )
          ],
        ),
      ),
    );
  }
}
