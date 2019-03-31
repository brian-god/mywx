import 'package:flutter/material.dart';
import './../config/mywxconfig.dart';
import './../utils//httpUtil.dart';
import './../common/prompt_message.dart';
import 'dart:convert';

/**
 * 通讯录头部
 */
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //用户名控制器
  TextEditingController usercontroller = new TextEditingController();
  //密码控制器
  TextEditingController padcontroller = new TextEditingController();
  //用户名的错误提示内容
  var userError = "";
  //密码的错误提示内容
  var pwdError = "";
  //消息提示框
  Widget prompmessage = new Container();
  /**
   * 初始初始状态
   */
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const user_hleptext = "请输入用户名";
    const pwd_hleptext = "请输入密码";
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                          image: AssetImage("images/blog.jpeg"))),
                  width: 110.0,
                  height: 110.0,
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: user_hleptext,
                        helperText: userError,
                        helperStyle: TextStyle(
                          color: Colors.red[700],
                          fontSize: 14,
                        )),
                    keyboardType: TextInputType.emailAddress,
                    controller: usercontroller,
                    onChanged: _clertext,
                  ),
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.keyboard),
                        hintText: pwd_hleptext,
                        helperText: pwdError,
                        helperStyle: TextStyle(
                          color: Colors.red[700],
                          fontSize: 14,
                        )),
                    obscureText: true,
                    controller: padcontroller,
                    onChanged: _clertext,
                  ),
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                ),
                Container(
                  child: RaisedButton(
                    child: Text("登陆"),
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    disabledColor: Colors.grey,
                    highlightColor: Colors.grey,
                    // 按下的背景色
                    splashColor: Colors.green,
                    // 水波纹颜色
                    colorBrightness: Brightness.light,
                    // 主题
                    elevation: 10,
                    highlightElevation: 10,
                    disabledElevation: 10,
                    padding: EdgeInsets.fromLTRB(93, 10, 93, 10),
                    onPressed: _loginEvent,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //设置内容居中
            alignment: Alignment.center,
            //相当于容器修饰器
            /*decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.indigo[400],
                      width: 3.0,
                    ),
                    //实现圆角效果
                    borderRadius: BorderRadius.circular(15.0),
                  ),*/
            padding: EdgeInsets.only(left: 40, top: 60, bottom: 10, right: 40),
          )),
          prompmessage
        ],
      ),
      backgroundColor: Colors.greenAccent[100],
    );
  }

  /**
   * 清空错误内容
   */
  void _clertext(String str) {
    setState(() {
      userError = "";
      pwdError = "";
    });
  }

  //登陆按钮控制
  void _loginEvent() {
    //隐藏键盘
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      prompmessage =  new PromptMessage(
        wid:  new Container(
                    child: Text(
                      "提示消息测试类",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    height: 20,
                    width: 100,
                  ),
                  isshow: false,
      ); 
    });
    //刚进来时候清空提示消息
    _clertext(null);
    //获取用户名
    var user = usercontroller.text;
    if ("" == user) {
      setState(() {
        userError = "用户名不能为空";
      });
      return;
    }
    //获取密码
    var password = padcontroller.text;
    if ("" == password) {
      setState(() {
        pwdError = "密码不能为空";
      });
      return;
    }
    //为请求构建参数
    var params = new Map<String, String>();
    //将用户名付给集合
    params["username"] = user;
    //将密码付给集合
    //请求地址
    var url = service_url + "/login";
    getData(user, password);
    /*NetService.get("http://www.luxiaosong.top:8080/qywx/getUrl", (data){
        print(data);
     });*/
    //发送请求
    /*NetService.post(url, 
     (data){//成功处理
       print("成功"+data);
     }
     ,params: params,
     errorCallBack: (error){
       print(error);
     }
     );*/
    //跳转至home页面
    //Navigator.of(context).pushReplacementNamed("/home");
  }

  Future getData(String username, String password) async {
    var url = service_url + "/login";
    var data = {'username': username, 'password': password};
    var response = await HttpUtil().post(url, data: data);
    Map<String, dynamic> user = json.decode(response);
    //获取用户名
    var userID = user["id"];
    var mobile = user["mobile"];
    var email = user["email"];
    var nickname = user["nickname"];
   print("用户名："+user["nickname"]);
  }
}
