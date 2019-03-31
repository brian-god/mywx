import 'dart:async';

/**
 * 我的定时器
 */
class  MyTimer {
  static  getTimer(int miao){
    int time = 0;
    bool iscler = false;
     Timer _timer =new Timer.periodic(const Duration(seconds: 1), (timer) {
       print(time);
      time++;
      if(time==3){
        iscler = true;
      }
    });
    if(iscler){
       _timer.cancel();
       _timer = null;
       return true;
    }
  }
}