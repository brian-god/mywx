import 'package:flutter/material.dart';
import './../common/wechatItem.dart';

/**
 * 发现页面
 */
class FoundPage extends StatefulWidget {
  @override
  _FoundPageState createState() => new _FoundPageState();
}

class _FoundPageState extends State<FoundPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 10),
              child: WeChatItem(
                title: "朋友圈",
                onpress: () {},
                imagePath: "images/icon_friends.png",
                isBorder: false,
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  WeChatItem(
                    title: "扫一扫",
                    onpress: () {},
                    imagePath: "images/icon_scan.png",
                    isBorder: true,
                  ),
                  WeChatItem(
                    title: "摇一摇",
                    onpress: () {},
                    imagePath: "images/icon_shake.png",
                    isBorder: false,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  WeChatItem(
                    title: "看一看",
                    onpress: () {},
                    imagePath: "images/icon_look.png",
                    isBorder: true,
                  ),
                  WeChatItem(
                    title: "搜一搜",
                    onpress: () {},
                    imagePath: "images/icon_search.png",
                    isBorder: false,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  WeChatItem(
                    title: "附近的人",
                    onpress: () {},
                    imagePath: "images/icon_near.png",
                    isBorder: true,
                  ),
                  WeChatItem(
                    title: "漂流瓶",
                    onpress: () {},
                    imagePath: "images/icon_bottle.png",
                    isBorder: false,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  WeChatItem(
                    title: "购物",
                    onpress: () {},
                    imagePath: "images/icon_shop.png",
                    isBorder: true,
                  ),
                  WeChatItem(
                    title: "游戏",
                    onpress: () {},
                    imagePath: "images/icon_game.png",
                    isBorder: false,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 15),
              child: WeChatItem(
                title: "小程序",
                onpress: () {},
                imagePath: "images/icon_link.png",
                isBorder: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
