import 'package:flutter/material.dart';
/**
 * 右上角的按钮项
 */
class WXPopupMenuItem extends StatelessWidget {
  final String title;//标题
  final String imagepath;//图片
  final IconData iconData;
  const WXPopupMenuItem({//构造函数
    Key key,
    this.title,
    this.imagepath,
    this.iconData
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuItem(
      child: new Row(
        children: <Widget>[
          imagepath !=null
          ?new Image.asset(imagepath,width: 32.0,height: 32.0,)
          :SizedBox(
            child: Icon(
              iconData,
              color: Colors.white,
            ),
            width: 32.0,
            height: 32.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),//左侧内边距
            child: new Text(title,
            style:TextStyle(
              color:Colors.white
            )),
          )
        ],
      ),
    );
  }
}