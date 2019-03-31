import 'package:flutter/material.dart';
import './common/touch_callback.dart';

class Scerch extends StatefulWidget {
  @override
  ScerchState createState() => new ScerchState();
}

class ScerchState extends State<Scerch> {
  FocusNode focusNode = new FocusNode();

  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  _getText(String text) {
    return TouchCallBack(
      isfeed: false,
      onpress: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0, color: Color(0xff1aad19)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TouchCallBack(
                        isfeed: false,
                        onpress: () {
                          //返回按钮
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 45.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 13.0, top: 0.0, bottom: 0.0),
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          //搜索框
                          focusNode: _requestFocus(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          onChanged: (String text) {},
                          decoration: InputDecoration(
                              hintText: '搜索', border: InputBorder.none),
                        ),
                      ),
                      Container(
                        //麦克风
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 46, right: 20, top: 40.0), //画线
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.green))),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Text(
                '搜索指定文章',
                style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('朋友圈'),
                  _getText('文章'),
                  _getText('公众号'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('小程序'),
                  _getText('音乐'),
                  _getText('表情'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
