
import 'package:flutterbarinfoplugin/flutterbarinfoplugin.dart';

class TBFEnterForumData {
  List<TBFBarInfo> forumList = List();

  // 生成吧列表
  Future<void> barInfoList() async {

    Future<List> barPics = Flutterbarinfoplugin.barPics;
    Future<List> barNames = Flutterbarinfoplugin.barNames;
    Future<List> barDes = Flutterbarinfoplugin.barDes;
    Future<List> barLevels = Flutterbarinfoplugin.barLevels;

    List picList = await barPics;
    List nameList = await barNames;
    List desList = await barDes;
    List levelList = await barLevels;


    TBFAttention attention = TBFAttention();
    attention.name = "关注的吧";
    forumList.add(attention);

    for (int i = 0; i < picList.length; i++) {
      TBFBarInfo barInfo = TBFBarInfo();
      barInfo.forumName = nameList.elementAt(i);
      barInfo.forumAvatar = picList.elementAt(i);
      barInfo.forumIntro = desList.elementAt(i);
      barInfo.levelId = levelList.elementAt(i);
      forumList.add(barInfo);
    }
  }
}

class TBFBarInfo {
  String forumName; // 吧名
  String forumAvatar; // 吧头像
  String levelId; // 等级
  String forumIntro; // 吧简介
}

class TBFAttention extends TBFBarInfo{
  String name;
}