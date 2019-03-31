import 'package:flutter/material.dart';
import './contacts_item.dart';
import './contacts_vo.dart';

/**
 * 通讯录头部
 */
class ContactsHearder extends StatefulWidget {
  @override
  _ContactsHearderState createState() => new _ContactsHearderState();
}

class _ContactsHearderState extends State<ContactsHearder> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ContactsItem(
          contactVO: ContactVO(seationKey: "0", name: "新的朋友"),
          imagename: "images/icon_addfriend.png",
        ),
        ContactsItem(
          contactVO: ContactVO(seationKey: "0", name: "群聊"),
          imagename: "images/icon_groupchat.png",
        ),
        /*ContactsItem(
          contactVO: ContactVO(seationKey: "0", name: "标签"),
          imagename: "images/icon_tag.png",
        ),*/
        ContactsItem(
          contactVO: ContactVO(seationKey: "0", name: "公众号"),
          imagename: "images/icon_public.png",
        )
      ],
    );
  }
}
