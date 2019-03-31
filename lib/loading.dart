import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart'; //储存值
/**
 * 加载页面
 */
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
  
}
/**
 * 状态组件
 */
class _LoadingState extends State<LoadingPage> {
  @override
  void initState(){//初始化状态
    super.initState();
    new Future.delayed(Duration(seconds:3),(){
      Future<String> userID = getUser(); //获取用户的ID
      userID.then((String userID) {
        if(null == userID){
          Navigator.of(context).pushReplacementNamed("login");//导航跳转到登陆页面
        }else{
          Navigator.of(context).pushReplacementNamed("app");//导航跳转到app页面
        }              
      });
    });
  }
  /**
   * 获取存储中的用户
   */
  Future<String> getUser() async {
      var userID;
      //读取存储文件
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userID = prefs.getString("userID");
      return userID;
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset("images/loading.jpg"),
    );
  }
  
}