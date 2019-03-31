import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contacts_page.dart';
import './found/found_page.dart';
import './personal/personal_page.dart';

enum ItemType { GroupChat, AddFriends, QrCode, Payments, Help }

/**
 * 主页面
 */
class App extends StatefulWidget {
  @override
  MainState createState() => new MainState();
}

class MainState extends State {
  MessagePage messagePage; //消息页面
  ContactsPage contactsPage; //通讯录
  FoundPage foundPage; //发现页面
  PersonalPage personalPage; //我的页面
  /**
   * 右侧菜单组的子项
   */
  _PopupMenuItem(String title, {String imagepath, IconData iconData}) {
    // TODO: implement build
    return PopupMenuItem(
      child: new Row(
        children: <Widget>[
          imagepath != null
              ? new Image.asset(
                  imagepath,
                  width: 32.0,
                  height: 32.0,
                )
              : SizedBox(
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                  width: 32.0,
                  height: 32.0,
                ),
          Container(
            padding: const EdgeInsets.only(left: 20.0), //左侧内边距
            child: new Text(title, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  //导航按钮选择
  var _currentIndex = 0;
  /**
   * 底部导航页面切换
   */
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (messagePage == null) {
          //创建消息页面
          messagePage = new MessagePage();
        }
        return messagePage;
      case 1:
        if (contactsPage == null) {
          //创建通讯录页面
          contactsPage = new ContactsPage();
        }
        return contactsPage;
      case 2:
        if (foundPage == null) {
          //创建发现页面
          foundPage = new FoundPage();
        }
        return foundPage;
      case 3:
        if (personalPage == null) {
          //创建我页面
          personalPage = new PersonalPage();
        }
        return personalPage;
    }
  }
  _getTitle(){
 switch (_currentIndex) {
      case 0:
        return "微信";
      case 1:
        return "通讯录";
      case 2:
        return "发现";
      case 3:
        return "我";
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        //顶部
        title: new Text(_getTitle()),
        actions: <Widget>[
          GestureDetector(
            onTap: (() {
              Navigator.pushNamed(context, "scerch");
            }),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: (() {
                showMenu(
                  //显示菜单
                  context: context,
                  position:
                      RelativeRect.fromLTRB(500.0, 86.0, 10.0, 0.0), //按钮菜单的位置
                  items: <PopupMenuEntry>[
                    //按钮项
                    _PopupMenuItem("发起群聊",
                        imagepath: "images/icon_menu_group.png"),
                    _PopupMenuItem("添加朋友",
                        imagepath: "images/icon_menu_addfriend.png"),
                    _PopupMenuItem("扫一扫",
                        imagepath: "images/icon_menu_scan.png"),
                    _PopupMenuItem("收付款", iconData: Icons.crop_free),
                    _PopupMenuItem("帮助于反馈", iconData: Icons.email)
                  ],
                );
              }),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        //底部导航
        type: BottomNavigationBarType.fixed, //填充类型
        currentIndex: _currentIndex, //默认选择
        onTap: ((index) {
          //点击
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          //底部按钮菜单
          new BottomNavigationBarItem(
              title: new Text(
                "微信",
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 0
                  ? new Image.asset(
                      "images/weixin_pressed.png",
                      width: 32.0,
                      height: 28.0,
                    )
                  : new Image.asset(
                      "images/weixin_normal.png",
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                "通讯录",
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 1
                  ? new Image.asset(
                      "images/contact_list_pressed.png",
                      width: 32.0,
                      height: 28.0,
                    )
                  : new Image.asset(
                      "images/contact_list_normal.png",
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                "发现",
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 2
                  ? new Image.asset(
                      "images/find_pressed.png",
                      width: 32.0,
                      height: 28.0,
                    )
                  : new Image.asset(
                      "images/find_normal.png",
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                "我",
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 3
                  ? new Image.asset(
                      "images/profile_pressed.png",
                      width: 32.0,
                      height: 28.0,
                    )
                  : new Image.asset(
                      "images/profile_normal.png",
                      width: 32.0,
                      height: 28.0,
                    ))
        ],
      ),
      body: this.currentPage(),
    );
  }
}
