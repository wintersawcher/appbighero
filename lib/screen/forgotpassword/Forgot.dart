
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:quantrinoibo/screen/forgotpassword/screen2.dart';


class Forgotpasswords extends StatefulWidget {
  const Forgotpasswords({Key? key}) : super(key: key);

  @override
  _ForgotpasswordsState createState() => _ForgotpasswordsState();
}

class _ForgotpasswordsState extends State<Forgotpasswords> {
  TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  test(){
    if(_email.text.isEmpty){
      setState(() {
        isEnabled = false;
      });
    } else{
      setState(() {
        isEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Builder(
              builder: (context) => Container(
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Container(
                            width: 250,
                            height: 250,
                            child: Image.network(
                                'https://jobs.hybrid-technologies.vn/wp-content/uploads/2019/01/logo-540x281.jpg')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                            controller: _email,
                            onChanged: (text){
                              test();
                            },
                            validator: (value) {
                              if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                                return 'Email chưa đúng định dạnh';
                              }
                              return null;
                            },
                            autovalidate: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Nhập email đã đăng ký',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.blue;
                              }
                              return Colors.blue;
                            }),
                          ),
                          onPressed: isEnabled ? () {if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Screen2()),
                              );
                              /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data'),
                                  duration: Duration(seconds: 1)));*/
                            }}: null ,
                            child: Text('Nhận mã khôi phục',
                              style: TextStyle(fontSize: 16, color: Colors.white),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 50, 0, 0),
                        child: Row(
                          children: [
                            Text('Đã có tài khoản? ', style: TextStyle(fontSize: 16)),
                            Text('Đăng nhập',
                              style: TextStyle(fontSize: 16, color: Colors.blue),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 50, 0, 0),
                        child: Row(
                          children: [
                            Text('Chưa có tài khoản? ',
                                style: TextStyle(fontSize: 16)),
                            Text('Đăng ký',
                              style: TextStyle(fontSize: 16, color: Colors.blue),)
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            ),

        ),
      ),
      )
    );
  }
}