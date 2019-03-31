import 'package:flutter/material.dart';
import './app.dart';
import './loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './scerch.dart';
import './login/login_page.dart';
/**
 * 入口函数
 */
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'wechat',
  theme: mThemeData,//主题
  routes: <String,WidgetBuilder>{//路由
    "app":(BuildContext context) => new App(),
    "/friends": (_) => new WebviewScaffold( //利用webview组件加载页面
      url: "https://weixin.qq.com/",
      appBar: new AppBar(//顶部
        title: new Text("微信朋友圈"),
      ),
      withZoom: true,
      withLocalStorage: true ,//是否支持本地存储
    ),
    "scerch": (BuildContext context) => new Scerch(),//搜索页面
    "login": (BuildContext context) => new LoginPage(),//登陆页面
  },
  home:new LoadingPage(),//Home页面
));

//定义主题
final ThemeData mThemeData = new ThemeData(
  primaryColor: Color(0xff303030),//主题颜色
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xff393a3f)
);