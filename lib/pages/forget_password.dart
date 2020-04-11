// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:chucp/common/httpRequest.dart';
import 'package:chucp/common/net/result_data.dart';
class ForgetPassword extends StatefulWidget {
  // static final String sName = "ForgetPassword";
  @override
  State<StatefulWidget> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("imgs/loginbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 133.5,
            child: Container(
              color: Colors.black45,
              width: 335.0,
              height: 439.0,
              child: Column(
                children: <Widget>[
                  Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text('设置新密码',  style: TextStyle(fontSize: 31.0, color: Colors.white))
                  ),
                  buildForm(_formKey),
                ],
              ),
            ),
          )
        ],
      ),
    ) 
    ),
    );
    
    
    
  }
}

Widget buildForm(_formKey) {
  final TextEditingController _email = TextEditingController();

  _onPressed() async{
    if ((_formKey.currentState as FormState).validate()) {
      String baseUrl = "https://euvidu0s.lc-cn-n1-shared.com/";
      HttpRequest.setBaseUrl(baseUrl);
      Map<String, String> param  = {"email": _email.text};
      try {
        ResultData response = HttpRequest.post('1.1/requestPasswordReset', param);
        if (response.code == 0) {
          print(response.data);
        } else {
          print(response.data);
        }
      } catch (e) {
        print("exception: $e");
      }


    }
  }
  return Form(
      autovalidate: true,
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            height: 80.0,
            child: TextFormField(
              controller: _email,
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "请输入邮箱",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  errorStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.email, color: Colors.white,)),
              validator: (v) {
                return v.trim().length > 0 ? null : "邮箱不能为空";
              }),
            decoration: BoxDecoration(
              // 下滑线浅灰色，宽度1像素
             border: Border(bottom: BorderSide(color: Colors.grey[200], width: 0.5))
          ),
          ),
      
          
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: RaisedButton(
              padding: EdgeInsets.all(15.0),
              child: Text("发送到邮箱",  style: TextStyle(fontSize: 14.0, color: Colors.white)),
              color: Color(0xFF8E2DE2),
              textColor: Colors.white,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: _onPressed,
            ),
          ),
          
         
        ],
      ));
}

