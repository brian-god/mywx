import 'package:flutter/material.dart';
import './message_item.dart';
import './message_data.dart';
/**
 * 消息页面
 */
class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState () => new _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        //padding: EdgeInsets.all(1.0),
        itemExtent: 70.0,
        itemCount: messageData.length,//条目数
        itemBuilder: (BuildContext context, int index) {
          return MessageItem(
            messageData: messageData[index],
          );
        },
      );
  }
  
}