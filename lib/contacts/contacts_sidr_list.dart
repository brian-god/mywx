import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'contacts_vo.dart';
/**
 * 滑动列表项
 */
class  ContactsSidrList extends StatefulWidget {
  final List<ContactVO> items;
  //IndexedWidgetBuilder实现按需构造
  final IndexedWidgetBuilder headerBuilder;//头部
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder sectionBuilder;
  //构造函数
  const ContactsSidrList({
    Key key,
    this.headerBuilder,
    this.itemBuilder,
    this.sectionBuilder,
    this.items
  });
  @override
  _ContactsSidrListState createState() => new _ContactsSidrListState();
}

class _ContactsSidrListState extends State< ContactsSidrList>{
    Color _pressColor = Colors.transparent;//siderbar背影颜色,默认透明
  //能用功能，列表加载更多,控制
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification){
    return true;
  }
  /**
   * 是否显示头部
   */
  _isShowHeaderView(index){
    if(index == 0 && widget.headerBuilder != null){
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context,index),
      );
    }
    return Container();
  }
  /**
   * 是否显示字母项
   */
  _isShowsectionBuilder(index){
    if(index==0 || index <0){//当为零时显示
      return false;
    }
    if(index != 0 && widget.items[index].seationKey !=widget.items[index-1].seationKey){
      return false;
    }
    return true;//默认不显示
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //能用功能，列表加载更多
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              controller: _scrollController,
                // list里面的内容不足一屏时，list都可以滑动
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget.items.length,//列表长度
                itemBuilder: (BuildContext context,int index){//构建列表项
                  return Container(
                    alignment: Alignment.centerLeft,//居中向左
                    child: Column(
                        children: <Widget>[
                          _isShowHeaderView(index),//加载头部
                          Offstage(//显示字母
                              offstage: _isShowsectionBuilder(index),
                              child: widget.sectionBuilder(context,index),//字母显示组件
                          ),
                          Column(//显示联系人
                            children: <Widget>[
                              widget.itemBuilder(context,index)
                            ],
                          )
                        ],
                    ),
                  );
                },
            ),
          ),
          Positioned(//定位组件
            right: 0.0,
            child: Container(//右侧文字主键
              alignment: Alignment.center,
              width: 32,
              height: MediaQuery.of(context).size.height,//获取设备的高度
              child: GestureDetector(//事件监听组件
                onTapDown: (TapDownDetails t) {
                  //手指按下
                  setState(() {
                    _pressColor = Colors.grey;
                  });
                },
                onTapUp: (TapUpDetails t) {
                  //手指弹起
                  setState(() {
                    _pressColor = Colors.transparent;
                  });
                },
                onVerticalDragStart: (DragStartDetails details) {
                  //开始垂直滑动
                  setState(() {
                    _pressColor = Colors.grey;
                  });
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  //结束垂直滑动
                  setState(() {
                    _pressColor = Colors.transparent;
                  });
                },
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  //手指垂直滑动时
                },
                child: ListView.builder(
                  controller: ScrollController(),
                    itemCount: siderBarKey.length,
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        alignment: Alignment.center,
                        height: (MediaQuery.of(context).size.height-200) /siderBarKey.length ,
                        child: Text(siderBarKey[index]),
                      );
                    }
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
}

const siderBarKey = <String>[
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];