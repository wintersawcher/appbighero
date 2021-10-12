import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  bool isEnabled = false;
  bool _check = false;

  testing() {
    if (passwordController.text.length >= 8 && passwordController.text.length <= 16 &&
        nameController.text.length >= 8 && nameController.text.length <= 16 && _check) {
      setState(() {
        isEnabled = true;
      });
    } else {
      setState(() {
        isEnabled = false;
      });
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text('LOGIN')),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                testing();
                setState(() {

                });

              },
              validator: (value){
                if(value!.length < 8 && value.length >16 ){
                   return 'Nhap toi thieu 6 ki tu';
                }else{
                  return null;
                }
              },
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              obscureText: true,
              onChanged: (text) {
                testing();
              },
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          const Divider(),
          CheckboxListTile(
            title: const Text('Accept'),
            value: _check,
            onChanged: (bool? value) {
              setState(() {
                _check = value!;
              });
              testing();
            },
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: RaisedButton(
                color: isEnabled ? Colors.blue : Colors.green,
                onPressed: isEnabled
                    ? () {
                  const snackBar = SnackBar(
                    content: Text('Yay! Welcome to paradise!!'),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  );
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                    : null,
                child: const Text('Login')),
          ),
        ],
      ),
    );
  }
}

