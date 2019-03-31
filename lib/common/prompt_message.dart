import 'package:flutter/material.dart';
import './../utils/mytimer.dart';
import 'dart:async';
/**
 * 停留几秒的消息提示
 */
class PromptMessage extends StatefulWidget {
  final Widget wid;
  final  bool isshow;
  const PromptMessage({@required this.wid,
    this.isshow =true,
  });
  @override
  _PromptMessageState createState() => _PromptMessageState();
}

class _PromptMessageState extends State<PromptMessage> {
  bool _isoffstage = false; //是否关闭
  int time = 0; //计数
  Timer _timer;
  //开始计时
  void startTime() async {
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time == 3) {
        //等于五秒的时候则关闭
        stopTime();
        return;
      }
      setState(() {
        time++;
      });
    });
  }

  //结束计时
  void stopTime() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      time = 0;
      _isoffstage = true;
    });
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child:Offstage(
          offstage: _isoffstage, //是否显示
          child: Container(    
            child: widget.wid,       
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: Color.fromARGB(70,45, 45, 45),
            ),
            margin: EdgeInsets.only(bottom: 150),
            padding: EdgeInsets.only(top: 3,bottom: 3,left: 10,right: 10),
            alignment: Alignment.center,
          ),
      ),
      top: MediaQuery.of(context).size.height - 100,
      left: MediaQuery.of(context).size.width / 2 - 100 / 2,
    );
  }
}
