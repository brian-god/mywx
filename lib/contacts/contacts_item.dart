import 'package:flutter/material.dart';
import './contacts_vo.dart';

/**
 * 消息组件
 */
class ContactsItem extends StatefulWidget {
  final ContactVO contactVO;
  final String imagename;
  final Color itemcolor;
  //构造函数
  const ContactsItem({@required this.contactVO, this.imagename,this.itemcolor});
  @override
  _ContactsItemState createState() => new _ContactsItemState();
}

class _ContactsItemState extends State<ContactsItem> {

  /**
   * 获取头像
   */
  _getHeadPortrait(){
      if(this.widget.imagename == null){//未传入头像
        String imagePath = this.widget.contactVO.avatarUrl  != '' ? this.widget.contactVO.avatarUrl:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540604543064&di=8aae52b40c5b4f0d2a2265b71ef1ba2c&imgtype=0&src=http%3A%2F%2Fcdnimg103.lizhi.fm%2Faudio_cover%2F2016%2F09%2F29%2F2559592964947348999_320x320.jpg";
        return Image.network(imagePath);
      }else{//传入图像
        return Image.asset(widget.imagename);
      }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: widget.itemcolor != null 
      ?widget.itemcolor
      :Colors.white,
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          //点击事件
        },
        child: Row(
          //水平行
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              //放图像
              margin: const EdgeInsets.only(
                  left: 0, top: 3.5, bottom: 3.5, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: this._getHeadPortrait(),
              width: 40.0,
              height: 40.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
                ),
                child: widget.contactVO.name != null
                    ? Text(widget.contactVO.name,
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF353535)))
                    : Text("默认",
                        style: TextStyle(
                            fontSize: 22, color: Color(0xFF353535))), //显示名称
                height: 52.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
