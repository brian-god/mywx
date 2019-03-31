import 'package:flutter/material.dart';
import './touch_callback.dart';

/**
 * 微信按钮
 */
class WeChatItem extends StatefulWidget {
  final String title;
  final String imagePath;
  final IconData icon;
  final VoidCallback onpress;
  final bool isBorder;
  final IconData rightIcon;
  const WeChatItem(
      {@required this.title, //必填参数
      @required this.onpress, //点击回调
      this.imagePath,
      this.icon,
      this.isBorder = true, //是否有边框默认为true
      this.rightIcon = Icons.chevron_right //默认图标
      });
  @override
  _WeChatItemState createState() => new _WeChatItemState();
}

class _WeChatItemState extends State<WeChatItem> {
  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      onpress: widget.onpress, //点击回调
      child: Container(
        //color: Colors.white,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              //按钮图标
              margin: const EdgeInsets.all(8.5),
              decoration: BoxDecoration(
                //实现圆角
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 33.0,
              width: 33.0,
              child: widget.imagePath != null
                  ? Image.asset(widget.imagePath)
                  : Icon(widget.icon),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 4.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: widget.isBorder ? 0.5 : 0.0,
                            color: Color(0xFFd9d9d9))),
                  ),
                  //中间部分
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          //title
                          child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.title,
                            style: TextStyle(
                                fontSize: 19.0, color: Color(0xFF353535))),
                      )),
                      Container(
                        //右侧标记
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(right: 18),
                        width: 50,
                        child: Icon(
                          widget.rightIcon,
                          size: 33.0,
                          color: Color(0xFFa9a9a9),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
