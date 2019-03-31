import 'package:flutter/material.dart';
import './../common/touch_callback.dart';
import './message_data.dart';
import 'package:date_format/date_format.dart';

/**
 * 消息组件
 */
class MessageItem extends StatefulWidget {
  final MessageData messageData; //消息对象
  //构造函数
  const MessageItem({@required this.messageData //必输
      });
  @override
  _MessageItemState createState() => new _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  /**
   * 子标题
   */
  createSubTitle(String subTitle, MessageType type) {
    if (type == MessageType.CHAT) {
      //显示消息内容
      return subTitle;
    } else if (type == MessageType.PUBLIC) {
      //公共消息
      return "[公共消息]";
    } else if (type == MessageType.SYSTEM) {
      //系统消息
      return "[公共消息]";
    } else if (type == MessageType.GROUP) {
      //群消息
      return "[公共消息]";
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TouchCallBack(
      isfeed: true,
      onpress: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: double.infinity,
        height: 64.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              //头像
              margin: const EdgeInsets.all(8.5),
              decoration: BoxDecoration(
                  //实现圆角
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: widget.messageData.avatar != null //判断是否有图像
                          ? NetworkImage(widget.messageData.avatar) //用户头像
                          :  NetworkImage("http://b-ssl.duitang.com/uploads/item/201711/22/20171122165332_A4nPa.thumb.700_0.jpeg") //默认头像
                      )),
              height: 47.0,
              width: 47.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: widget.messageData.title != null
                                  ? Text(widget.messageData.title,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xFF353535)))
                                  : Text("默认",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xFF353535))), //显示名称
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: new Text(
                                  this.createSubTitle(
                                      widget.messageData.subTitle,
                                      widget.messageData.type),
                                  style: TextStyle(
                                      color: Color(0xFFa9a9a9), fontSize: 18),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 24, right: 10, left: 10),
                      child: new Text(
                        formatDate(widget.messageData.time,
                            [HH, ':', nn, ':', 'ss']).toString(),
                        style:
                            TextStyle(color: Color(0xFFa9a9a9), fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
