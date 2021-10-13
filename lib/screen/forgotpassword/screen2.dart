import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:quantrinoibo/screen/forgotpassword/screen3.dart';

//Màn hình 2 - Nhập OTP
class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController _OTP = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _OTPErr = "Mã OTP có 6 ký tự!";
  var _OTPInvalid = false;
  bool isEnabled = false;

  test(){
    if(_OTP.text.length ==6){
      setState(() {
        isEnabled = true;
      });
    } else{
      setState(() {
        isEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            autovalidate: false,
                            keyboardType: TextInputType.number,
                            onChanged: (_OTP) {
                              test();
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
                                MaterialPageRoute(builder: (context) => Screen3()),
                              );
                              /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data'),
                                  duration: Duration(seconds: 1)));*/
                            }}: null ,
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