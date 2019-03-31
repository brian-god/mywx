import 'package:flutter/material.dart';

/**
 * 触摸事件处理
 */
class  TouchCallBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onpress;
  final bool isfeed;
  final Color background;
  const TouchCallBack({
    @required this.child,//必填参数
    @required this.onpress,
    this.isfeed=true,//默认为true
    this.background = const Color(0xffd8d8d8),//默认背景颜色
  });
  @override
  _TouchCallBackState createState() => new _TouchCallBackState(); 
}
class _TouchCallBackState extends State<TouchCallBack> {
  //为透明色
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector( //事件组件
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onpress,
      onPanDown: (d){//按下
        if(!widget.isfeed) return;//不需要的时候直接返回
        setState(() {
         color=widget.background; //颜色改为背景色
        });
      },
      onPanCancel: (){//取消监听
        setState(() {
         color=Colors.transparent; 
        });
      },
    );
  }
  
}