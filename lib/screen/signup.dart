
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }

}

enum GioiTinh { Nam, Nu }

List<TextEditingController> listController = List<TextEditingController>.generate(6, (index) => TextEditingController());

class MyCustomFormState extends State<MyCustomForm> {
  GioiTinh? _character;
  bool isEnabled = false;

  final _formKey = GlobalKey<FormState>();

  testing(){
    if(listController[0].text.isEmpty||listController[1].text.isEmpty||
        listController[2].text.isEmpty||listController[3].text.isEmpty||
        listController[4].text.isEmpty||listController[5].text.isEmpty||_character==null){
      setState(() {
        isEnabled = false;
      });
    } else {
      setState(() {
        isEnabled = true;
      });
    }
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image(
          height: 70,
          width: 70,
          image: NetworkImage('https://jobs.hybrid-technologies.vn/wp-content/uploads/2019/01/logo-540x281.jpg'),
        ),
        Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: (text) {
                    testing();
                  },
                  controller: listController[0],
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    labelText: 'Tên đăng nhập',
                  ),
                  validator: (value) {
                    if (value.toString().length<6||value.toString().contains(' ')) {
                      return 'username không được chứa khoảng trắng và  username tối thiểu là 6 ký tự';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  onChanged: (text) {
                    testing();
                  },
                  controller: listController[1],
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    labelText: 'Địa chỉ email',
                  ),
                  validator: (value) {
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                      return 'Địa chỉ hòm thư chưa đúng định dạnh';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  obscureText: true,
                  onChanged: (text) {
                    testing();
                  },
                  controller: listController[2],
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    labelText: 'Mật khẩu',
                  ),
                  validator: (value) {
                    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value!)) {
                      return 'Mật khẩu tối thiểu 8 ký tự, gồm 1 hoa, thường, số, ký tự ';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  obscureText: true,
                  onChanged: (text) {
                    testing();
                  },
                  controller: listController[3],
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    labelText: 'Xác nhận lại mật khẩu',
                  ),
                  validator: (value) {
                    if (listController[2].text.toString()!=value) {
                      return 'Mật khẩu xác nhận không khớp';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  onChanged: (text) {
                    testing();
                  },
                  controller: listController[4],
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    labelText: 'Họ và tên',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [Radio<GioiTinh>(
                        value: GioiTinh.Nam,
                        groupValue: _character,
                        onChanged: (GioiTinh? value) {
                          setState(() {
                            _character = value;
                          });
                          testing();
                        },
                      ),
                        Text('Nam'),],
                    ),
                    Row(
                      children: [Radio<GioiTinh>(
                        value: GioiTinh.Nu,
                        groupValue: _character,
                        onChanged: (GioiTinh? value) {
                          setState(() {
                            _character = value;
                          });
                          testing();
                        },
                      ),
                        Text('Nữ'),],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: listController[5],
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
                        border: OutlineInputBorder(),
                        labelText: 'Ngày tháng năm sinh',
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Please enter a date for your task";
                        return null;
                      },
                    ),
                  ),
                ),
                Divider(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40), ),
                  onPressed: isEnabled ? () {if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data'),
                        duration: Duration(seconds: 1)));
                  }}: null ,
                  child: const Text('Đăng ký'),
                ),
                Divider(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Đã có tài khoản? ',style: TextStyle(fontSize: 17),),
                    InkWell(
                      child: Text("Đăng nhập",style: TextStyle(color: Colors.blueAccent,fontSize: 17),),
                      onTap: () {print("value of your text");},
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        listController[5].text = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
  }
}



