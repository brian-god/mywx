import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'contacts_header.dart';
import './contacts_vo.dart';
import './contacts_item.dart';
import './contacts_sidr_list.dart';

/**
 * 通讯录
 */
class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => new _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ContactsSidrList(
        items: contactData,
        headerBuilder: (BuildContext context, int index) {
          //实现按需加载
          return Container(
            //头部实现
            child: ContactsHearder(),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //人员列表项
            color: Colors.white,
            child: ContactsItem(
              contactVO: contactData[index],
            ),
          );
        },
        sectionBuilder: (BuildContext context, int index) {
          return Container(
            //字母的实现
            height: 36.0,
            color: Colors.grey[300],
            padding: const EdgeInsets.only(left: 15.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              contactData[index].seationKey != "#"
                  ? contactData[index].seationKey
                  : "其他",
              style: TextStyle(fontSize: 16.0, color: Color(0xff909090)),
            ),
          );
        },
      ),
    );
  }
}
