import 'package:flutter/material.dart';

//Màn hình 3 - Đổi mật khẩu
class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  TextEditingController _passWord = TextEditingController();
  TextEditingController _rePassWord = TextEditingController();
  final _formKey = GlobalKey<FormState>();




  bool isEnabled = false;

  testPass(){
    if(_passWord.text.length <8
        && _passWord.text.length >16
        && _rePassWord.text.length >16
        && _passWord.text.length <8 ){
      setState(() {
        isEnabled = true;
      });
    } else{
      setState(() {
        isEnabled = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
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
                          Text(
                              'Nhập thông tin mật khẩu mới',
                              style: TextStyle(fontSize: 16)
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: SizedBox(
                              width: 350,
                              height: 50,
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$').hasMatch(value!)) {
                                    return 'Từ 8 - 16 ký tự, gồm chữ hoa, thường, số';
                                  }
                                  return null;
                                },
                                controller: _passWord,
                                autovalidate: false,
                                decoration: InputDecoration(
                                    labelText: 'Nhập mật khẩu mới',
                                    border: OutlineInputBorder(),),

                                onChanged: (_passWord) {
                                  testPass();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: SizedBox(
                              width: 350,
                              height: 50,
                              child: TextFormField(
                                obscureText: true,
                                controller: _rePassWord,
                                validator: (value) {
                                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$').hasMatch(value!)) {
                                    return 'Từ 8 - 16 ký tự, gồm chữ hoa, thường, số';
                                  }
                                  return null;
                                },
                                autovalidate: false,
                                decoration: InputDecoration(
                                    labelText: 'Xác nhận mật khẩu mới',
                                    border: OutlineInputBorder()),
                                onChanged: (_rePassWord) {
                                  testPass();
                                },
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
                                  if(_passWord.text.compareTo(_rePassWord.text) != 0){
                                    SnackBar mySnackBar = SnackBar(content: Text('Hai mật khẩu không trùng khớp!'));
                                    Scaffold.of(context).showSnackBar(mySnackBar);
                                  }
                                    SnackBar mySnackBar = SnackBar(content: Text('Đổi mật khẩu thành công!'));
                                    Scaffold.of(context).showSnackBar(mySnackBar);
                                  /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data'),
                                  duration: Duration(seconds: 1)));*/
                                }}: null ,
                                child: Text('Đổi mật khẩu',
                                  style: TextStyle(fontSize: 16, color: Colors.white),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(120, 50, 0, 0),
                            child: Row(
                              children: [
                                Text('Đã có tài khoản? ',
                                    style: TextStyle(fontSize: 16)),
                                Text('Đăng nhập',
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
          ),
        );
  }
}
