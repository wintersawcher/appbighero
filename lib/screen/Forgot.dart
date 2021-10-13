import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


class Forgotpasswords extends StatefulWidget {
  const Forgotpasswords({Key? key}) : super(key: key);

  @override
  _ForgotpasswordsState createState() => _ForgotpasswordsState();
}

class _ForgotpasswordsState extends State<Forgotpasswords> {
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: SingleChildScrollView(
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
                          validator: EmailValidator(
                              errorText: "Vui lòng nhập email!"),
                          autovalidate: true,
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Screen2()),
                            );
                            /*SnackBar mySnackBar = SnackBar(content: Text('Email không tồn tại!'));
                            Scaffold.of(context).showSnackBar(mySnackBar);*/
                          },
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
    );
  }
}

//Màn hình 2 - Nhập OTP
class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController _OTP = TextEditingController();
  var _OTPErr = "Mã OTP có 6 ký tự!";
  var _OTPInvalid = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: SingleChildScrollView(
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
                    Center(
                      child: Text(
                          'Vui lòng check email để lấy thông tin\n mã khôi phục mật khẩu ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          controller: _OTP,
                          autovalidate: true,
                          keyboardType: TextInputType.number,
                          onChanged: (_OTP) {
                            setState(() {
                              if (_OTP.isEmpty) {
                                _OTPInvalid = true;
                              } else{
                                _OTPInvalid = false;
                              }
                            });
                            dieuKienOTP();
                          },
                          decoration: InputDecoration(
                            labelText: 'Nhập mã OTP',
                            errorText: _OTPInvalid ? _OTPErr : null,
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
                          onPressed: () {
                            setState(() {
                              if (_OTPInvalid ==false){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Screen3()),
                                );
                              }
                            });
                            /*SnackBar mySnackBar = SnackBar(content: Text('Mã OTP không chính xác!'));
                            Scaffold.of(context).showSnackBar(mySnackBar);*/

                          },
                          child: Text('Xác nhận',
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
    );
  }
  //xử lý điều kiện login
  void dieuKienOTP(){
    setState(() {
      if(_OTP.text.length<6 || _OTP.text.length>6){
        _OTPInvalid = true;
      }else  {
        _OTPInvalid = false;
      }
    });
  }
}


//Màn hình 3 - Đổi mật khẩu
class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  TextEditingController _passWord = TextEditingController();
  TextEditingController _rePassWord = TextEditingController();

  var _passWordErr = "Password không hợp lệ";
  var _rePassWordErr = "Password không hợp lệ";
  var _rePassWordErr1 = "2 password phải trùng nhau";
  var _rePassWordInvalid = true;
  var _passWordInvalid = true;

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: SingleChildScrollView(
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
                          controller: _passWord,
                          autovalidate: true,
                          decoration: InputDecoration(
                              labelText: 'Nhập mật khẩu mới',
                              border: OutlineInputBorder(),
                              errorText:
                              _passWordInvalid ? _passWordErr : null),
                          onChanged: (_passWord) {
                            setState(() {
                              if (_passWord.isEmpty) {
                                _passWordInvalid = false;
                              }
                            });
                            onSigInClick();
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
                          autovalidate: true,
                          decoration: InputDecoration(
                              labelText: 'Xác nhận mật khẩu mới',
                              border: OutlineInputBorder(),
                              errorText:
                              _rePassWordInvalid ? _rePassWordErr : null),
                          onChanged: (_rePassWord) {
                            setState(() {
                              if (_rePassWord.isEmpty) {
                                _rePassWordInvalid = false;
                              }
                            });
                            onSigInClick();
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
                          onPressed: () {
                            if(_passWordInvalid==false && _rePassWordInvalid==false){
                              SnackBar mySnackBar = SnackBar(content: Text('Đổi mật khẩu thành công!'));
                              Scaffold.of(context).showSnackBar(mySnackBar);
                            }
                            /*Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Screen3()),
                              );*/

                          },
                          child: Text('Đổi mật khẩu', style: TextStyle(fontSize: 16, color: Colors.white),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(120, 50, 0, 0),
                      child: Row(
                        children: [
                          Text('Đã có tài khoản? ', style: TextStyle(fontSize: 16)),
                          Text('Đăng nhập', style: TextStyle(fontSize: 16, color: Colors.blue),)
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
  void onSigInClick(){
    setState(() {
      if(_passWord.text.length<8 || _passWord.text.length>16){
        _passWordInvalid = true;
      }else  {
        _passWordInvalid = false;
      }
      if(_rePassWord.text.length<8 || _rePassWord.text.length>16){
        _rePassWordInvalid = true;
      }else  {
        _rePassWordInvalid = false;
      }
    });
  }
}
