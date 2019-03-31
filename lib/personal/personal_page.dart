import 'package:flutter/material.dart';
import './../common/wechatItem.dart';

/**
 * 我的页面
 */
class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => new _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: Colors.grey[300],
      child: ListView(
        children: <Widget>[
          Container(
              //我的
              color: Colors.white,
              height: 110,
              padding: EdgeInsets.only(top: 0, left: 14),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      //显示头像
                      decoration: BoxDecoration(
                          //实现圆角
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540604543064&di=8aae52b40c5b4f0d2a2265b71ef1ba2c&imgtype=0&src=http%3A%2F%2Fcdnimg103.lizhi.fm%2Faudio_cover%2F2016%2F09%2F29%2F2559592964947348999_320x320.jpg"))),
                      width: 70,
                      height: 70,
                    ),
                    Expanded(
                      //右侧
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 20,top: 28),
                              alignment: Alignment.centerLeft,
                              //昵称
                              child: Text("大耳朵图图",style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey[600]
                              ),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                     padding: EdgeInsets.only(left: 20,top: 10),
                                    child: Text("微信号：大耳朵图图",style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600]
                              ),),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(//二维码
                                              child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553247667320&di=8f498f59059e96fa02d69d119f9fff58&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201701%2F28%2F20170128085020_jfRhX.jpeg"
                                              ,width: 25,
                                              height: 25,),
                                            ),
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.chevron_right,
                                          size: 33.0,
                                          color: Color(0xFFa9a9a9),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 10),
            child: WeChatItem(
              title: "支付",
              onpress: () {},
              imagePath: "images/icon_me_money.jpg",
              isBorder: false,
            ),
          ),
          Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  WeChatItem(
                    title: "收藏",
                    onpress: () {},
                    imagePath: "images/icon_me_collect.png",
                    isBorder: false,
                  ),
                  WeChatItem(
                    title: "相册",
                    onpress: () {},
                    imagePath: "images/icon_me_photo.png",
                    isBorder: false,
                  ),
                  WeChatItem(
                    title: "卡包",
                    onpress: () {},
                    imagePath: "images/icon_me_card.png",
                    isBorder: false,
                  ),
                  WeChatItem(
                    title: "表情",
                    onpress: () {},
                    imagePath: "images/icon_me_smile.png",
                    isBorder: false,
                  ),
                ],
              )),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 10),
            child: WeChatItem(
              title: "设置",
              onpress: () {},
              imagePath: "images/icon_me_setting.png",
              isBorder: false,
            ),
          ),
        ],
      ),
    ));
  }
}
