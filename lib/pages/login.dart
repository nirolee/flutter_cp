// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:chucp/common/httpRequest.dart';
import 'package:chucp/pages/register.dart';
import 'package:chucp/pages/forget_password.dart';
import 'package:chucp/common/net/result_data.dart';
// import 'package:chucp/common/utils/navigator_utils.dart';

class Login extends StatefulWidget {
  // static final String sName = "login";
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  height: 400.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Text('登录',
                              style: TextStyle(
                                  fontSize: 31.0, color: Colors.white))),
                      buildForm(_formKey, context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

Widget buildForm(_formKey, BuildContext context) {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  _onPressed() async {
    if ((_formKey.currentState as FormState).validate()) {
      String baseUrl = "https://euvidu0s.lc-cn-n1-shared.com/";
      HttpRequest.setBaseUrl(baseUrl);
      Map<String, String> param = {
        "username": _email.text,
        "password": _password.text
      };
      try {
        ResultData response = HttpRequest.post('1.1/login', param);
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
            child: TextFormField(
                controller: _email,
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: "邮箱",
                    hintText: "请输入邮箱",
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
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    )),
                validator: (v) {
                  return v.trim().length > 0 ? null : "邮箱不能为空";
                }),
            decoration: BoxDecoration(
                // 下滑线浅灰色，宽度1像素
                border: Border(
                    bottom: BorderSide(color: Colors.grey[200], width: 0.5))),
          ),
          Container(
            child: TextFormField(
              controller: _password,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入登录密码",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  errorStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  )),
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能少于6位";
              },
              obscureText: true,
            ),
            decoration: BoxDecoration(
                // 下滑线浅灰色，宽度1像素
                border: Border(
                    bottom: BorderSide(color: Colors.grey[200], width: 0.5))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: RaisedButton(
              padding: EdgeInsets.all(15.0),
              child: Text("立即登录",
                  style: TextStyle(fontSize: 14.0, color: Colors.white)),
              color: Color(0xFF8E2DE2),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: _onPressed,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text("忘记密码",
                        style: TextStyle(fontSize: 12.0, color: Colors.white)),
                    onPressed: () {
                      // return NavigatorUtils.goRegister(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgetPassword();
                      }));
                    },
                  ),
                  Text("|",
                      style: TextStyle(fontSize: 12.0, color: Colors.white)),
                  FlatButton(
                    child: Text("立即注册",
                        style: TextStyle(fontSize: 12.0, color: Colors.white)),
                    onPressed: () {
                      // return NavigatorUtils.goRegister(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Register();
                      }));
                    },
                  )
                ],
              ))
        ],
      ));
}
