// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:learn1/baxi_page.dart';
import 'package:learn1/calendar/eightchar/DaYun.dart';
import 'package:learn1/calendar/eightchar/Yun.dart';
import 'new_member.dart'; // Import NewMember class
import 'package:learn1/calendar/EightChar.dart';
import 'package:learn1/calendar/util/LunarUtil.dart';
import 'package:learn1/lunarCal/ZiweiFunc/ZiweiFunc.dart';
import 'package:learn1/calendar/util/LunarUtil.dart';

import 'package:learn1/calendar/Lunar.dart' as lunar;
// void main() => runApp(Zwei());

class Zwei extends StatefulWidget {
  final String name;
  final DateTime? birthday;
  final String? time;
  final bool? sex;

  const Zwei({
    Key? key,
    required this.name,
    required this.birthday,
    this.time,
    this.sex,
  }) : super(key: key);

  @override
  _ZweiState createState() => _ZweiState();
}

class _ZweiState extends State<Zwei> {
  late String name = widget.name;
  late EightChar eightChar;
  late Yun yun;

  late String daYunStartYear;
  late String daYunStartMonth;

  Color backgroundColor = const Color.fromARGB(255, 201, 201, 201);

  // bool isSelected = false;
  int selectedIndex = -1;

  int dayunselectedBoxIndex = -1;

  int dayunselectedIndex = -1;

  //只用一次

  late int daYunIndexHolder = 12;

  late DaYun daYun;
  late DaYun daYun2;
  late DaYun daYun3;
  late DaYun daYun4;
  late DaYun daYun5;
  late DaYun daYun6;
  late DaYun daYun7;
  late DaYun daYun8;

  late String dayunNum;
  late String dayunNum2;
  late String dayunNum3;
  late String dayunNum4;
  late String dayunNum5;
  late String dayunNum6;
  late String dayunNum7;
  late String dayunNum8;

  late String daYunEndYear;
  late int daYunStartAge;
  late String daYunEndAge;
  late String daYunGanZhi;

  late String daYunGanZh1;
  late String daYunGanZhi2;
  late String daYunGanZhi3;
  late String daYunGanZhi4;
  late String daYunGanZhi5;
  late String daYunGanZhi6;
  late String daYunGanZhi7;
  late String daYunGanZhi8;
  late String age;
  late String manOrFemale;
  late lunar.Lunar lunarDate;

  late String dayun10shenpGan1;
  late String dayun10shenpZhi1;
  late String dayun10shenpGan2;
  late String dayun10shenpZhi2;
  late String dayun10shenpGan3;
  late String dayun10shenpZhi3;
  late String dayun10shenpGan4;
  late String dayun10shenpZhi4;
  late String dayun10shenpGan5;
  late String dayun10shenpZhi5;
  late String dayun10shenpGan6;
  late String dayun10shenpZhi6;
  late String dayun10shenpGan7;
  late String dayun10shenpZhi7;
  late String dayun10shenpGan8;
  late String dayun10shenpZhi8;
  late String dayun10shenpGan9;
  late String dayun10shenpZhi9;

  late String trueMonthGan;
  late String trueMonthZhi;
  late String ju;
  late List<String> whenchu;
  late List<String> whenChan;

  late List<String> leftHelp;
  late List<String> rightHelp;

  late List<String> tianyueTianKui;
  late List<String> tianyue;

  late List<String> dijie;
  late List<String> dikong;

  late List<String> g3stars;

  late List<String> punish;
  late List<String> sexy;

  late List<String> fireStar;
  late List<String> angryBell;
  late List<String> saltWaterNhorse;

  // late ZiweiFunc ziweiFunc;
  late List<String> fiveTiger;

  late List<String> rearrangeList;
  late List<String> yunStart;
  late List<String> yunStartrearrange;
  late List<String> shoyunStartrearrange;
  late List<String> rearrangeAndInsert;
  late List<String> taibu;
  late List<String> fonhao;
  late List<String> sortyunStart;
  late List<String> restruct;

  late String formation;

  // 乙級
  late List<String> solver;
  late List<String> solveryear;
  late List<String> loner;
  late List<String> hongran;

  late List<String> smart;
  late List<String> longLive;
  late List<String> rearrangeAndInsertplaceHolder;
  late List<String> yingxa;
  late List<String> skyEmpty;
  late List<String> heavenbless;
  late List<String> skyMoon;
  late List<String> wizard;
  late List<String> reasonLive;
  late List<String> happy;
  late List<String> bug;
  late List<String> huagai;
  late List<String> cook;
  late List<String> santai;
  late List<String> eightseats;
  late List<String> blessingLight;
  late List<String> highClass;
  late List<String> middleEmepty;
  late Map<int, List<String>> pwer;
  late Map<int, List<String>> pwer2;

  late String life;
  late List<String> daxianeList;
  late List<String> skyCry;
  late List<String> skyNone;
  late List<String> dragonPond;
  late List<String> phonex;
  late List<String> poSui;
  late List<String> heavenjob;
  late List<String> sky;
  late List<String> tiander;
  late List<String> moonder;

  // 被選中的
  String selectedTiangan = '甲';

  late Map<int, List<String>> starMapping;
  late Map<int, List<String>> starBrightness;

  late List<TableRow> longTableRows;
  // late List<String> dayuncombine;
  late List<int> daxianIndex;
  late List<String> liunen;
  late List<String> liunenNum;

  late int liuMonthNum;
  late List<String> liuMonth;
  late String liuMonthHolder;

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  int? selectedBoxIndex;
  int daxianCustomIndex = -1;
  int liunenCustomIndex = -1;
  late DateTime combinedDateTime;
  late String formattedBirthday;

  List<Color> boxColors =
      List.filled(12, Colors.white); // Initial color for all boxes

  @override
  void initState() {
    super.initState();

    TimeOfDay? parsedTime = NewMember.stringToTimeOfDay(widget.time);
    combinedDateTime = DateTime(
      widget.birthday!.year,
      widget.birthday!.month,
      widget.birthday!.day,
      parsedTime?.hour ?? 0,
      parsedTime?.minute ?? 0,
    );

    formattedBirthday = '${combinedDateTime.year.toString().padLeft(4, '0')} '
        '${combinedDateTime.month.toString().padLeft(2, '0')} '
        '${combinedDateTime.day.toString().padLeft(2, '0')} '
        '${combinedDateTime.hour.toString().padLeft(2, '0')}:'
        '${combinedDateTime.minute.toString().padLeft(2, '0')}';

    age = calculateAge(combinedDateTime).toString();

    // lunarDate line of code must be above eightChar and yun and dayun
    lunarDate = lunar.Lunar.fromDate(combinedDateTime);
    print('lunarDate:$lunarDate');
    print('formattedBirthday:$formattedBirthday');

    // ziweiFunc = ZiweiFunc(combinedDateTime);
    print('Below: lunarDate.getSolar.getday() 農曆生日 ');
    print(lunarDate.getSolar().getLunar().getDay());
    print(lunarDate.getSolar().getLunar().toString());

    trueMonthZhi = ZiweiFunc.extractFromFziMap(
        lunarDate.getSolar().getLunar().toString())!;

    eightChar = lunarDate.getEightChar();
    // Create an instance of Yun using the EightChar instance and gender (1 for male, 0 for female)
    yun = Yun(eightChar, widget.sex == true ? 1 : 0);

    // daYunStartYear = daYun.getStartYear().toString();

    fiveTiger = ZiweiFunc.runFiveTiger(lunarDate.getYearGan());
    print('五虎:$fiveTiger');

    reasonLive = ZiweiFunc.reasonLive(fiveTiger, lunarDate.getYearGan());

    print(lunarDate.getMonthZhi());
    print('非本月 月干 TrueMonthZhi$trueMonthZhi');
    print(lunarDate.getTimeZhi());

    whenchu = ZiweiFunc.wengqu(lunarDate.getTimeZhi());
    print('文曲:$whenchu');

    whenChan = ZiweiFunc.wengchan(lunarDate.getTimeZhi());
    print('文昌:$whenChan');

    leftHelp = ZiweiFunc.leftHelp(trueMonthZhi);
    print('左輔:$leftHelp');
    rightHelp = ZiweiFunc.rightHelp(trueMonthZhi);
    print('右弼:$rightHelp');

    // formation = ZiweiFunc.formation(number);

    tianyueTianKui = ZiweiFunc.tianyueTianKui(lunarDate.getYearGan());
    print('tianyueTianKui:$tianyueTianKui');
    tianyue = ZiweiFunc.tianyue(lunarDate.getYearGan());

    dijie = ZiweiFunc.dijie(lunarDate.getTimeZhi());
    dikong = ZiweiFunc.dikong(lunarDate.getTimeZhi());

    g3stars = ZiweiFunc.generate3Stars(lunarDate.getYearGan());

    punish = ZiweiFunc.punish(trueMonthZhi);

    sexy = ZiweiFunc.sexy(trueMonthZhi);

    fireStar =
        ZiweiFunc.fireStar(lunarDate.getYearZhi(), lunarDate.getTimeZhi());
    angryBell =
        ZiweiFunc.angryBell(lunarDate.getYearZhi(), lunarDate.getTimeZhi());

    print('angryBell: $angryBell');

    saltWaterNhorse = ZiweiFunc.saltWaterNhorse(lunarDate.getYearZhi());

    // 乙級星
    solver = ZiweiFunc.solver(trueMonthZhi);
    solveryear = ZiweiFunc.solverYear(lunarDate.getYearZhi());
    loner = ZiweiFunc.loner(lunarDate.getYearZhi());
    taibu = ZiweiFunc.taibu(lunarDate.getTimeZhi());
    fonhao = ZiweiFunc.fonhao(lunarDate.getTimeZhi());

    skyMoon = ZiweiFunc.skyMoon(trueMonthZhi);
    bug = ZiweiFunc.bug(lunarDate.getYearZhi());

    skyEmpty = ZiweiFunc.skyEmpty(lunarDate.getYearGan());
    hongran = ZiweiFunc.hongran(lunarDate.getYearZhi());
    heavenbless = ZiweiFunc.heavenbless(lunarDate.getYearGan());

    wizard = ZiweiFunc.wizard(trueMonthZhi);
    happy = ZiweiFunc.happy(lunarDate.getYearZhi());
    huagai = ZiweiFunc.huagai(lunarDate.getYearZhi());
    cook = ZiweiFunc.cook(lunarDate.getYearGan());
    santai =
        ZiweiFunc.santai(leftHelp, lunarDate.getSolar().getLunar().getDay());
    eightseats = ZiweiFunc.eightseats(
        rightHelp, lunarDate.getSolar().getLunar().getDay());
    blessingLight = ZiweiFunc.blessingLight(
        whenChan, lunarDate.getSolar().getLunar().getDay());
    highClass =
        ZiweiFunc.highClass(whenchu, lunarDate.getSolar().getLunar().getDay());

    middleEmepty = ZiweiFunc.middleEmepty(lunarDate.getYearInGanZhi());
    skyCry = ZiweiFunc.skycry(lunarDate.getYearZhi());
    skyNone = ZiweiFunc.skyNone(lunarDate.getYearZhi());
    dragonPond = ZiweiFunc.dragonPond(lunarDate.getYearZhi());
    phonex = ZiweiFunc.phonex(lunarDate.getYearZhi());
    poSui = ZiweiFunc.poSui(lunarDate.getYearZhi());

    heavenjob = ZiweiFunc.heavenjob(lunarDate.getYearGan());
    sky = ZiweiFunc.sky(lunarDate.getYearZhi());
    tiander = ZiweiFunc.tiander(lunarDate.getYearZhi());
    moonder = ZiweiFunc.moonder(lunarDate.getYearZhi());

    String base = ZiweiFunc.calculateBase(trueMonthZhi, lunarDate.getTimeZhi());

    String topbase = ZiweiFunc.extractGanForZhi(fiveTiger, base);
    trueMonthGan = ZiweiFunc.extractGanForZhi(fiveTiger, trueMonthZhi);

    //must come after base

    print('非本月 月干trueMonthGan:$trueMonthGan');

    life = topbase + base;

    int elementR = ZiweiFunc.elementsResult(topbase, base);
    print('五虎局elementR: $elementR');
    formation = ZiweiFunc.formation(elementR);
    print('topbase: $topbase');
    print('calculateBase生宮: $base');

    print('life: $life');

    rearrangeList = ZiweiFunc.rearrangeList(fiveTiger, life);
    print('rearrangeList: $rearrangeList');

    //比較難算 需要fivetiger and life
    smart = ZiweiFunc.smart(fiveTiger, life, lunarDate.getYearZhi());
    yingxa = ZiweiFunc.yingxa(trueMonthZhi);

    // print(smart);
    // 身宮
    rearrangeAndInsert =
        ZiweiFunc.rearrangeAndInsert(rearrangeList, lunarDate.getTimeZhi());
    print('rearrangeAndInsert: $rearrangeAndInsert');
    rearrangeAndInsertplaceHolder = rearrangeAndInsert;

    longLive = ZiweiFunc.longLive(
        rearrangeAndInsertplaceHolder, lunarDate.getYearZhi());
    print('rearrangeAndInsert after longLive func: $rearrangeAndInsert');
    print('排12宮$rearrangeList');

    print('longLive$longLive');

    restruct = ZiweiFunc.generateList(0, rearrangeList);
    print('restruct:$restruct');

    // print('longLive: $longLive');
    ju = ZiweiFunc.searchju(
        topbase, base, lunarDate.getSolar().getLunar().getDay());

    manOrFemale = ZiweiFunc.manOrFemale(widget.sex!, lunarDate.getYearGan());

    shoyunStartrearrange =
        ZiweiFunc.generateSequence(lunarDate.getYearZhi(), widget.sex!);

    print('shoyunStartrearrange:$shoyunStartrearrange');

    print('manOrFemale: $manOrFemale');
    starMapping = ZiweiFunc.generateStarMapping(
        topbase, base, lunarDate.getSolar().getLunar().getDay());

    Map<int, List<String>> combinegods =
        ZiweiFunc.combinegods(starMapping, whenchu);

    combinegods = ZiweiFunc.combinegods(combinegods, whenChan);
    combinegods = ZiweiFunc.combinegods(combinegods, leftHelp);
    combinegods = ZiweiFunc.combinegods(combinegods, rightHelp);
    combinegods = ZiweiFunc.combinegods(combinegods, tianyueTianKui);
    combinegods = ZiweiFunc.combinegods(combinegods, tianyue);

    combinegods = ZiweiFunc.combinegods(combinegods, dijie);
    combinegods = ZiweiFunc.combinegods(combinegods, dikong);
    combinegods = ZiweiFunc.combinegods(combinegods, g3stars);
    combinegods = ZiweiFunc.combinegods(combinegods, punish);
    combinegods = ZiweiFunc.combinegods(combinegods, sexy);
    combinegods = ZiweiFunc.combinegods(combinegods, fireStar);
    combinegods = ZiweiFunc.combinegods(combinegods, angryBell);
    combinegods = ZiweiFunc.combinegods(combinegods, saltWaterNhorse);

    combinegods = ZiweiFunc.combinegods(combinegods, solver);
    combinegods = ZiweiFunc.combinegods(combinegods, solveryear);
    combinegods = ZiweiFunc.combinegods(combinegods, loner);
    combinegods = ZiweiFunc.combinegods(combinegods, hongran);
    combinegods = ZiweiFunc.combinegods(combinegods, taibu);

    combinegods = ZiweiFunc.combinegods(combinegods, smart);
    combinegods = ZiweiFunc.combinegods(combinegods, longLive);
    combinegods = ZiweiFunc.combinegods(combinegods, yingxa);
    combinegods = ZiweiFunc.combinegods(combinegods, skyEmpty);
    combinegods = ZiweiFunc.combinegods(combinegods, heavenbless);
    combinegods = ZiweiFunc.combinegods(combinegods, skyMoon);
    combinegods = ZiweiFunc.combinegods(combinegods, wizard);
    combinegods = ZiweiFunc.combinegods(combinegods, happy);
    combinegods = ZiweiFunc.combinegods(combinegods, bug);
    combinegods = ZiweiFunc.combinegods(combinegods, huagai);
    combinegods = ZiweiFunc.combinegods(combinegods, cook);
    combinegods = ZiweiFunc.combinegods(combinegods, santai);
    combinegods = ZiweiFunc.combinegods(combinegods, eightseats);
    combinegods = ZiweiFunc.combinegods(combinegods, blessingLight);
    combinegods = ZiweiFunc.combinegods(combinegods, highClass);
    combinegods = ZiweiFunc.combinegods(combinegods, middleEmepty);
    combinegods = ZiweiFunc.combinegods(combinegods, skyCry);
    combinegods = ZiweiFunc.combinegods(combinegods, skyNone);
    combinegods = ZiweiFunc.combinegods(combinegods, dragonPond);
    combinegods = ZiweiFunc.combinegods(combinegods, phonex);
    combinegods = ZiweiFunc.combinegods(combinegods, poSui);

    combinegods = ZiweiFunc.combinegods(combinegods, heavenjob);
    combinegods = ZiweiFunc.combinegods(combinegods, sky);
    combinegods = ZiweiFunc.combinegods(combinegods, tiander);
    // combinegods = ZiweiFunc.combinegods(combinegods, moonder);
    // 沒有亮度 所以排最後
    combinegods = ZiweiFunc.combinegods(combinegods, fonhao);

    print('combineGods:$combinegods');

    print(fiveTiger);
    print('startMapping:$starMapping');
    starBrightness = ZiweiFunc.starBrightness(starMapping);
    print('starBrightness: $starBrightness');

    print('ju: $elementR - zwei.dart page');

    print('manorFemal: $manOrFemale');
    yunStart = ZiweiFunc.yunStart(manOrFemale, elementR);

    // must be below yunStart
    yunStartrearrange = ZiweiFunc.rearrangeLife(fiveTiger, life, yunStart);

    sortyunStart = ZiweiFunc.sortYunStart(yunStart);

    print('sortyunStart: $sortyunStart');

    print('yunStart:$yunStart ');
    print(yunStartrearrange);

    liunenNum = ZiweiFunc.generateYearsForRange(combinedDateTime, yunStart, 1);

    // int liunenholder
    liunen = ZiweiFunc.generateLunarGanZhiYears(liunenNum);

    liuMonthNum = ZiweiFunc.countStepsFromMingGong(rearrangeList);
    print(liuMonthNum);

    print('liunenNum: $liunenNum');
    print('liunen: $liunen');

    liuMonthHolder = lunarDate.getYearZhi();
    liuMonth = ZiweiFunc.insertPredefinedList(liuMonthNum, '');

    print('liuMonth: $liuMonth');

    pwer = ZiweiFunc.mapColorsToStart(starMapping, lunarDate.getYearGan());
    print(pwer);
    pwer2 = ZiweiFunc.pwer2(pwer);
    print(pwer2);

    //  dayuncombine = ZiweiFunc.dayuncombine(yunStart, fireStar);

    daxianeList = ZiweiFunc.daxianeList(fiveTiger, life, manOrFemale);
    daxianIndex = ZiweiFunc.daxianIndex(fiveTiger, life, manOrFemale);
    print('daxianeList: $daxianeList');
    print('daxianIndex: $daxianIndex');

    daYun = DaYun(yun, 1);
    daYun2 = DaYun(yun, 2);
    daYun3 = DaYun(yun, 3);
    daYun4 = DaYun(yun, 4);
    daYun5 = DaYun(yun, 5);
    daYun6 = DaYun(yun, 6);
    daYun7 = DaYun(yun, 7);
    daYun8 = DaYun(yun, 8);

    daYunGanZh1 = daYun.getGanZhi();

    daYunGanZhi2 = daYun2.getGanZhi();
    daYunGanZhi3 = daYun3.getGanZhi();
    daYunGanZhi4 = daYun4.getGanZhi();
    daYunGanZhi5 = daYun5.getGanZhi();
    daYunGanZhi6 = daYun6.getGanZhi();
    daYunGanZhi7 = daYun7.getGanZhi();
    daYunGanZhi8 = daYun8.getGanZhi();

    dayunNum = daYun.getStartYear().toString();
    dayunNum2 = (daYun.getStartYear() + 10).toString();
    dayunNum3 = (daYun.getStartYear() + 20).toString();
    dayunNum4 = (daYun.getStartYear() + 30).toString();
    dayunNum5 = (daYun.getStartYear() + 40).toString();
    dayunNum6 = (daYun.getStartYear() + 50).toString();
    dayunNum7 = (daYun.getStartYear() + 60).toString();
    dayunNum8 = (daYun.getStartYear() + 70).toString();

    dayun10shenpGan1 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZh1[0]);
    print('dayun10shenpGan1: $dayun10shenpGan1');
    dayun10shenpZhi1 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZh1[1])[0];

    dayun10shenpGan2 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi2[0]);
    dayun10shenpZhi2 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZhi2[1])[0];

    dayun10shenpGan3 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi3[0]);
    dayun10shenpZhi3 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZhi3[1])[0];

    dayun10shenpGan4 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi4[0]);
    dayun10shenpZhi4 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZhi4[1])[0];

    dayun10shenpGan5 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi5[0]);
    dayun10shenpZhi5 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZhi5[1])[0];

    dayun10shenpGan6 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi6[0]);
    dayun10shenpZhi6 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZhi6[1])[0];

    dayun10shenpGan7 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi7[0]);
    dayun10shenpZhi7 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZhi7[1])[0];

    dayun10shenpGan8 =
        ZiweiFunc.getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi8[0]);
    dayun10shenpZhi8 = ZiweiFunc.getDayunGanShishenZhi(
        lunarDate.getDayGan(), daYunGanZhi8[1])[0];

    // longTableRows = [
    //   buildLongRow([
    //     dayunCustom(yunStart[0], daxianeList[0], 0),
    //     dayunCustom(yunStart[1], daxianeList[1], 1),
    //     dayunCustom(yunStart[2], daxianeList[2], 2),
    //     dayunCustom(yunStart[3], daxianeList[3], 3),
    //     dayunCustom(yunStart[4], daxianeList[4], 4),
    //     dayunCustom(yunStart[5], daxianeList[5], 5),
    //     dayunCustom(yunStart[6], daxianeList[6], 6),
    //     dayunCustom(yunStart[7], daxianeList[7], 7),
    //     dayunCustom(yunStart[8], daxianeList[8], 8),
    //     dayunCustom(yunStart[9], daxianeList[9], 9),
    //   ]),

    //   // Add a spacing TableRow
    //   // TableRow(
    //   //   children: List.generate(10, (_) => Container(height: 10)), // Spacer row
    //   // ),

    //   buildLongRow([
    //     dayunCustom(liunenNumHolder0, liunen[0], 0),
    //     dayunCustom(liunenNumHolder1, liunen[1], 1),
    //     dayunCustom(liunenNumHolder2, liunen[2], 2),
    //     dayunCustom(liunenNum[3], liunen[3], 3),
    //     dayunCustom(liunenNum[4], liunen[4], 4),
    //     dayunCustom(liunenNum[5], liunen[5], 5),
    //     dayunCustom(liunenNum[6], liunen[6], 6),
    //     dayunCustom(liunenNum[7], liunen[7], 7),
    //     dayunCustom(liunenNum[8], liunen[8], 8),
    //     dayunCustom(liunenNum[9], liunen[9], 9),
    //   ]),

    //   // Another spacing TableRow
    //   // TableRow(
    //   //   children: List.generate(12, (_) => Container(height: 10)), // Spacer row
    //   // ),

    //   // buildLongRow([
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   //   Text('月干'),
    //   // ]),
    // ];
  } //init

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '紫薇',
          style: TextStyle(color: Colors.black), // Change title color here
        ),
        backgroundColor: Color.fromARGB(255, 187, 255, 187),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              // Grid of boxes
              buildGrid(),
              SizedBox(height: 20), // Gap between grid and table
              Container(
                color: Colors.white, // Background color for the table
                child: Table(
                  children: [
                    buildLongRow([
                      dayunCustom(yunStart[0], daxianeList[0], 0),
                      dayunCustom(yunStart[1], daxianeList[1], 1),
                      dayunCustom(yunStart[2], daxianeList[2], 2),
                      dayunCustom(yunStart[3], daxianeList[3], 3),
                      dayunCustom(yunStart[4], daxianeList[4], 4),
                      dayunCustom(yunStart[5], daxianeList[5], 5),
                      dayunCustom(yunStart[6], daxianeList[6], 6),
                      dayunCustom(yunStart[7], daxianeList[7], 7),
                      dayunCustom(yunStart[8], daxianeList[8], 8),
                      dayunCustom(yunStart[9], daxianeList[9], 9),
                    ]),
                    buildLongRow([
                      liunenCustom(liunenNum[0], liunen[0], 0),
                      liunenCustom(liunenNum[1], liunen[1], 1),
                      liunenCustom(liunenNum[2], liunen[2], 2),
                      liunenCustom(liunenNum[3], liunen[3], 3),
                      liunenCustom(liunenNum[4], liunen[4], 4),
                      liunenCustom(liunenNum[5], liunen[5], 5),
                      liunenCustom(liunenNum[6], liunen[6], 6),
                      liunenCustom(liunenNum[7], liunen[7], 7),
                      liunenCustom(liunenNum[8], liunen[8], 8),
                      liunenCustom(liunenNum[9], liunen[9], 9),
                    ]),
                    // Add more TableRow widgets as needed
                  ],
                ),
              ),
              // buildTable(),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Zwei'),
  //       backgroundColor: Color.fromARGB(255, 187, 255, 187),
  //     ),
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: Column(
  //           children: [
  //             // Grid of boxes
  //             buildGrid(),
  //             SizedBox(height: 10), // Gap between grid and table
  //             const SizedBox(height: 0.1),
  //             // Divider(),
  //             Container(
  //               color: Colors.white, // Background color for the table
  //               child: Table(
  //                 // border: TableBorder.all(color: Colors.black),
  //                 children: longTableRows,
  //               ),
  //             ),
  //             // buildTable(),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  void updateBackgroundColorBasedOnMapping(int index, String selectedTiangan) {
    setState(() {
      // Use map instead of forEach to iterate over the starMapping list
      List<Color> updatedColors = (starMapping[index + 1] ?? []).map((str) {
        // Get the color mapping for the current selectedTiangan
        Map<String, Color> currentGanMapping =
            ganColorMapping[selectedTiangan] ?? {};

        // Check if str exists in the currentGanMapping
        String attribute = currentGanMapping.containsKey(str) ? str : '';

        // Map the attribute (祿, 權, 科, 忌) to the corresponding color
        Color textColor = colorMapping[attribute] ?? Colors.transparent;

        // Debugging prints
        print("selectedTiangan: $selectedTiangan");
        print('str: $str');
        print("attribute: $attribute");
        print("textColor: $textColor");

        // Return the color for each star
        return textColor;
      }).toList();

      // Optionally update the state with the list of colors, or apply the first color as background
      if (updatedColors.isNotEmpty) {
        backgroundColor = updatedColors.first;
      }
    });
  }

//  void updateBackgroundColorBasedOnMapping(int index, String selectedTiangan) {
//     setState(() {
//       // Use map instead of forEach to iterate over the starMapping list
//       List<Color> updatedColors = (starMapping[index + 1] ?? []).map((str) {
//         // Get the color mapping for the current selectedTiangan
//         Map<String, Color> currentGanMapping =
//             ganColorMapping[selectedTiangan] ?? {};

//         // Get the attribute for the current star (祿, 權, 科, 忌)
//        Map attribute = currentGanMapping[str] ?? '';

//         // Map the attribute (祿, 權, 科, 忌) to the corresponding color
//         Color textColor = colorMapping[attribute] ?? Colors.transparent;

//         // Debugging prints
//         print("selectedTiangan: $selectedTiangan");
//         print('str: $str');
//         print("attribute: $attribute");
//         print("textColor: $textColor");

//         // Return the color for each star
//         return textColor;
//       }).toList();

//       // Optionally update the state with the list of colors, or apply the first color as background
//       if (updatedColors.isNotEmpty) {
//         backgroundColor = updatedColors.first;
//       }
//     });
//   }

  Widget dayunCustom(String range, String sign, int dayunIndex) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double fontSize;

    if (screenHeight > 1800) {
      fontSize = 16.0;
    } else if (screenHeight < 1800 && screenHeight > 1500) {
      fontSize = 14.0;
    } else if (screenHeight < 1200 && screenHeight > 930) {
      fontSize = 12.0;
    } else if (screenHeight < 930 && screenHeight > 780) {
      fontSize = 10.0;
    } else if (screenHeight < 780 && screenHeight > 690) {
      fontSize = 9.0;
    } else if (screenHeight < 690 && screenHeight > 500) {
      fontSize = 7.0;
    } else {
      fontSize = 8.0;
    }
    return InkWell(
      onTap: () {
        setState(() {
          if (dayunselectedIndex == dayunIndex) {
            dayunselectedIndex = -1;
            daxianCustomIndex = -1;

            print("576daxianCustomIndex : $daxianCustomIndex ");
            print('577dayunselectedBoxIndex:$dayunselectedBoxIndex');
          } else {
            liunenNum = ZiweiFunc.generateYearsForRange(
                combinedDateTime, yunStart, dayunIndex);
            dayunselectedIndex = dayunIndex;

            liunen = ZiweiFunc.generateLunarGanZhiYears(liunenNum);

            print("585dayunselectedIndex : $dayunselectedIndex ");

            print("587daxianCustomIndex : $daxianCustomIndex ");
            print('588dayunselectedBoxIndex:$dayunselectedBoxIndex');
            daxianCustomIndex = daxianIndex[dayunIndex];
          }
          // liunenNumHolder0 = liunenNum[0];
          // liunenNumHolder1 = liunenNum[1];
          // liunenNumHolder2 = liunenNum[2];
          // print('liunenNumHolder1:$liunenNumHolder1');
          updateBackgroundColorBasedOnMapping(daxianCustomIndex, sign[0]);
          print('595dayunIndex:$dayunIndex');
          // daxianCustomIndex = daxianIndex[dayunIndex];
          print("597 daxianCustomIndex : $daxianCustomIndex ");
          // liunen[borderWidth] below
          print('Sign:$sign');
          print(sign[0]);
          print(liunen[dayunIndex]);

          print(daxianIndex[dayunIndex]);

          if (daxianCustomIndex == 0) {
            boxColors[0] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[1] = Colors.white; // Box 1
            boxColors[2] = Colors.white; // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Color.fromARGB(255, 133, 255, 224);
            boxColors[7] = Colors.white;
            boxColors[8] = Color.fromARGB(255, 133, 255, 224);
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (daxianCustomIndex == 1) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[2] = Colors.white; // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Color.fromARGB(255, 133, 255, 224);
            boxColors[8] = Colors.white;
            boxColors[9] = Color.fromARGB(255, 133, 255, 224);
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (daxianCustomIndex == 2) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Color.fromARGB(255, 133, 255, 224);
            boxColors[9] = Colors.white;
            boxColors[10] = Color.fromARGB(255, 133, 255, 224);
            boxColors[11] = Colors.white;
          } else if (daxianCustomIndex == 3) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Color.fromARGB(255, 133, 255, 224);
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (daxianCustomIndex == 4) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[9] = Colors.white; // Box 1
            boxColors[10] = Color.fromARGB(255, 133, 255, 224);
            boxColors[11] = Colors.white;
          } else if (daxianCustomIndex == 5) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[10] = Colors.white; // Box 1
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (daxianCustomIndex == 6) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Colors.white; // Box 1
            boxColors[10] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[11] = Colors.white; // Box 1
          } else if (daxianCustomIndex == 7) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Color.fromARGB(255, 164, 189, 228);
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (daxianCustomIndex == 8) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 133, 255, 224);
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Color.fromARGB(255, 164, 189, 228);
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (daxianCustomIndex == 9) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 133, 255, 224);
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Color.fromARGB(255, 164, 189, 228);
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (daxianCustomIndex == 10) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 133, 255, 224);
            boxColors[5] = Colors.white;
            boxColors[6] = Color.fromARGB(255, 133, 255, 224);
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Color.fromARGB(255, 164, 189, 228);
            boxColors[11] = Colors.white;
          } else if (daxianCustomIndex == 11) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 133, 255, 224);
            boxColors[6] = Colors.white;
            boxColors[7] = Color.fromARGB(255, 133, 255, 224);
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 164, 189, 228);
          } else if (daxianCustomIndex == -1) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          }
        });
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.all(0), // Padding inside the border
        decoration: BoxDecoration(
          color: dayunselectedIndex == dayunIndex
              ? Colors.blueAccent
              : Colors.white,
          border: Border.all(
            color: Colors.black, // Border color

            width: 0, // Border width
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Make children take full width
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 2), // Padding for the range text
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  range,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 2), // Padding for the sign text
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  sign,
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget liunenCustom(String range, String sign, int index) {
     final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double fontSize;

    if (screenHeight > 1800) {
      fontSize = 16.0;
    } else if (screenHeight < 1800 && screenHeight > 1500) {
      fontSize = 14.0;
    } else if (screenHeight < 1200 && screenHeight > 930) {
      fontSize = 12.0;
    } else if (screenHeight < 930 && screenHeight > 780) {
      fontSize = 10.0;
    } else if (screenHeight < 780 && screenHeight > 690) {
      fontSize = 10.0;
    } else if (screenHeight < 690 && screenHeight > 500) {
      fontSize = 8.0;
    } else {
      fontSize = 8.0;
    }
    
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedIndex == index) {
            selectedIndex = -1;
            liunenCustomIndex = -1;
            print("liunenCustomIndex :$liunenCustomIndex");
          } else {
            print('rang:$range');
            selectedIndex = index;
            int dex = ZiweiFunc.getZhiIndex(sign);
            liuMonth = ZiweiFunc.insertPredefinedList(liuMonthNum, sign[1]);
            print(liuMonth);
            print('sign:$sign');
            liunenCustomIndex = dex;
            print("liunenCustomIndex :$liunenCustomIndex");
          }
          if (liunenCustomIndex == 0) {
            boxColors[0] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[1] = Colors.white; // Box 1
            boxColors[2] = Colors.white; // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Color.fromARGB(255, 133, 255, 224);
            boxColors[7] = Colors.white;
            boxColors[8] = Color.fromARGB(255, 133, 255, 224);
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (liunenCustomIndex == 1) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[2] = Colors.white; // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Color.fromARGB(255, 133, 255, 224);
            boxColors[8] = Colors.white;
            boxColors[9] = Color.fromARGB(255, 133, 255, 224);
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (liunenCustomIndex == 2) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Color.fromARGB(255, 133, 255, 224);
            boxColors[9] = Colors.white;
            boxColors[10] = Color.fromARGB(255, 133, 255, 224);
            boxColors[11] = Colors.white;
          } else if (liunenCustomIndex == 3) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Color.fromARGB(255, 133, 255, 224);
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (liunenCustomIndex == 4) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[9] = Colors.white; // Box 1
            boxColors[10] = Color.fromARGB(255, 133, 255, 224);
            boxColors[11] = Colors.white;
          } else if (liunenCustomIndex == 5) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[10] = Colors.white; // Box 1
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (liunenCustomIndex == 6) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Colors.white; // Box 1
            boxColors[10] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[11] = Colors.white; // Box 1
          } else if (liunenCustomIndex == 7) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Color.fromARGB(255, 164, 189, 228);
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (liunenCustomIndex == 8) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 133, 255, 224);
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Color.fromARGB(255, 164, 189, 228);
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (liunenCustomIndex == 9) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 133, 255, 224);
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Color.fromARGB(255, 164, 189, 228);
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (liunenCustomIndex == 10) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 133, 255, 224);
            boxColors[5] = Colors.white;
            boxColors[6] = Color.fromARGB(255, 133, 255, 224);
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Color.fromARGB(255, 164, 189, 228);
            boxColors[11] = Colors.white;
          } else if (liunenCustomIndex == 11) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 133, 255, 224);
            boxColors[6] = Colors.white;
            boxColors[7] = Color.fromARGB(255, 133, 255, 224);
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 164, 189, 228);
          } else if (liunenCustomIndex == -1) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          }
        });
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.all(0), // Padding inside the border
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.blueAccent : Colors.white,
          border: Border.all(
            color: Colors.black, // Border color

            width: 0, // Border width
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Make children take full width
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 2), // Padding for the range text
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  range,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 2), // Padding for the sign text
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  sign,
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCellYearsShiShen(String text1, int index, [String? text2]) {
     double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;
    if (screenHeight > 1800) {
     
      fontSize = 10;
      
    } else if (screenHeight > 1200) {
   
      fontSize = 10;
     
    } else if (screenHeight < 1200 && screenHeight > 930) {
     
    
      fontSize = 10;
     
    } else if (screenHeight < 930 && screenHeight > 780) {
     
      fontSize = 9;
     
    } else if (screenHeight < 780 && screenHeight > 690) {
   
      fontSize = 9;
    
    } else if (screenHeight < 690 && screenHeight > 500) {
    
      fontSize = 8;
      
    } else {
     
      fontSize = 8;
    
    }
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: AutoSizeText(
                text1,
                style: TextStyle(fontSize: fontSize),
                overflow: TextOverflow.visible,
                maxLines: 1,
                minFontSize: 2,
              ),
            ),
            if (text2 != null) const SizedBox(height: 2.1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: AutoSizeText(
                text2 ?? '',
                style: TextStyle(fontSize: fontSize),
                overflow: TextOverflow.visible,
                maxLines: 1,
                minFontSize: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildCellYears(String text1, int index, [String? text2]) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {});
  //     },
  //     child: Container(
  //       color: Colors.transparent,
  //       padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
  //       alignment: Alignment.center,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           SingleChildScrollView(
  //             scrollDirection: Axis.horizontal,
  //             child: AutoSizeText(
  //               text1,
  //               style: TextStyle(fontSize: 8),
  //               overflow: TextOverflow.visible,
  //               maxLines: 1,
  //               minFontSize: 6,
  //             ),
  //           ),
  //           if (text2 != null)
  //             SingleChildScrollView(
  //               scrollDirection: Axis.horizontal,
  //               child: AutoSizeText(
  //                 text2,
  //                 style: TextStyle(fontSize: 8),
  //                 overflow: TextOverflow.visible,
  //                 maxLines: 1,
  //                 minFontSize: 6,
  //               ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget buildCellYears(String text1, int index, [String? text2]) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        double fontSizeFactor;
        double fontSize ;
        
         if (screenHeight > 1800) {
          fontSize = 14.0;
          fontSizeFactor = 0.025; // Adjusted for smaller screensns
        
        } else if (screenHeight < 1200 && screenHeight > 930) {
         fontSize = 12.0;
          fontSizeFactor = 0.025; // Adjusted for smaller screensns
          
        } else if (screenHeight < 930 && screenHeight > 780) {
         fontSize = 10.0;
          fontSizeFactor = 0.025; // Adjusted for smaller screensns
        } else if (screenHeight < 780 && screenHeight > 690) {
         fontSize = 10.0;
          fontSizeFactor = 0.025; // Adjusted for smaller screensns
        } else if (screenHeight < 690 && screenHeight > 500) {
          fontSize = 8.0;
          fontSizeFactor = 0.025; // Adjusted for smaller screensns
        } else {
         fontSize = 8.0;
          fontSizeFactor = 0.025; // Adjusted for smaller screensns
        }
       

       

        return GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AutoSizeText(
                    text1,
                    style: TextStyle(
                        fontSize: fontSize,
                        color: getColorForText(
                            text1)), // Dynamic font size with clamping
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    minFontSize: 6,
                  ),
                ),
                if (text2 != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: AutoSizeText(
                      text2,
                      style: TextStyle(
                          fontSize: fontSize.clamp(6, 12),
                          color: getColorForText(
                              text2)), // Dynamic font size for text2
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      minFontSize: 6,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGrid() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double widthFactor = 0.60; // 60% of the width

    double fontSize = screenWidth * 0.03; // Adjust the multiplier as needed
    double topPosition;
    double height;
    double sizeBox;
    double arrowSize;
    double arrowTopPosition;

    return Stack(
      children: [
        Column(
          children: [
            buildRow([3, 4, 5, 6]),
            buildRow([2, null, null, 7]),
            buildRow([1, null, null, 8]),
            buildRow([0, 11, 10, 9]),
          ],
        ),
        Builder(
          builder: (BuildContext context) {
            // double screenHeight = MediaQuery.of(context).size.height;
            // double screenWidth = MediaQuery.of(context).size.width;

            // double fontSize =
            //     screenWidth * 0.03; // Adjust the multiplier as needed
            // double topPosition;
            double height;

            // double arrowSize;
            // double arrowTopPosition;

            // Adjust based on screen height
            if (screenHeight > 1800) {
              // For large screens (e.g., tablets or desktops)
              topPosition = screenHeight * 0.20;
              // arrowSize = 50; // Larger arrow for big screens
              // arrowTopPosition = screenHeight * 0.50; // // 19% from the top
              fontSize = 30;
              height = screenHeight * 0.31; // 30% of screen height
            } else if (screenHeight > 1200) {
              // For large screens (e.g., tablets or desktops)
              topPosition = screenHeight * 0.19;
              // arrowSize = 50; // Larger arrow for big screens
              // arrowTopPosition = screenHeight * 0.50; // // 19% from the top
               fontSize = 20;
              height = screenHeight * 0.3; // 30% of screen height
            } else if (screenHeight < 1200 && screenHeight > 930) {
              // For medium screens (e.g., larger phones)
              widthFactor = 0.6;
              fontSize = 16;
              topPosition = screenHeight * 0.19; // 19% from the top
              height = screenHeight * 0.33;
              // arrowSize = 5; // Medium-sized arrow
              // arrowTopPosition = screenHeight * 0.73; // 34% of screen height
            } else if (screenHeight < 930 && screenHeight > 780) {
              // For medium screens (e.g., larger phones)
              widthFactor = 0.6;
              fontSize = 14;
              topPosition = screenHeight * 0.19; // 19% from the top
              height = screenHeight * 0.33;
              // arrowSize = 5; // Medium-sized arrow
              // arrowTopPosition = screenHeight * 0.73; // 34% of scree
            } else if (screenHeight < 780 && screenHeight > 690) {
              // For medium screens (e.g., larger phones)
              widthFactor = 0.6;
              fontSize = 12;
              topPosition = screenHeight * 0.19; // 19% from the top
              height = screenHeight * 0.33;
              // arrowSize = 5; // Medium-sized arrow
              // arrowTopPosition = screenHeight * 0.73; // 34% of scree
            } else if (screenHeight < 690 && screenHeight > 500) {
              // For medium screens (e.g., larger phones)
              widthFactor = 0.6;
              fontSize = 10;
              topPosition = screenHeight * 0.19; // 19% from the top
              height = screenHeight * 0.33;
              // arrowSize = 5; // Medium-sized arrow
              // arrowTopPosition = screenHeight * 0.73; // 34%
            } else {
              // For small screens (e.g., smaller phones)
              topPosition = screenHeight * 0.20; // 20% from the top
              // height = screenHeight * 0.32;
              fontSize = 16;
              height = screenHeight * 0.32;
              // arrowSize = 15; // Smaller arrow for small screens
              // arrowTopPosition = screenHeight * 0.25;
            }
            print("Screen Height: $screenHeight");
            print("Top Position: $topPosition");
            print("Height: $height");
            print("Width: $screenWidth");

            return Positioned(
              left:
                  MediaQuery.of(context).size.width * 0.1, // 10% from the left
              right:
                  MediaQuery.of(context).size.width * 0.1, // 10% from the right
              top: topPosition,
              child: FractionallySizedBox(
                widthFactor:
                    widthFactor, // General width factor for the entire container
                child: Container(
                  height: height,
                  color: Colors.white, // Keep the yellow background
                  child: Center(
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Adjust based on content size
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Ensures space between the two texts
                            children: [
                              Text(
                                // $manOrFemale
                                '$manOrFemale',
                                style: TextStyle(fontSize: fontSize),
                              ),
                              Text(
                                formation, // Replace with your placeholder text
                                style: TextStyle(fontSize: fontSize),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text('姓名: $name',
                           style: TextStyle(fontSize: fontSize),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            '生日: $formattedBirthday',
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            '農曆:$lunarDate',
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor:
                              0.74, // 60% of the container's width for the top table
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Adjust based on content size
                            children: [
                              // Add any other widgets here if needed
                              Table(
                                children: [
                                  buildLongRow([
                                    buildLongCell('本', 3, ['']),
                                    buildLongCell('月', 3, ['']),
                                    buildLongCell('八', 3, ['']),
                                    buildLongCell('字', 3, ['']),
                                    SizedBox(width: 30),
                                    buildLongCell('非', 3, ['']),
                                    buildLongCell('本', 3, ['']),
                                    buildLongCell('八', 3, ['']),
                                    buildLongCell('字', 3, ['']),
                                  ]),
                                  buildLongRow([
                                    buildLongCell('時', 3, ['']),
                                    buildLongCell('日', 3, ['']),
                                    buildLongCell('月', 3, ['']),
                                    buildLongCell('年', 3, ['']),
                                    SizedBox(width: 30),
                                    buildLongCell('時', 3, ['']),
                                    buildLongCell('日', 3, ['']),
                                    buildLongCell('月', 3, ['']),
                                    buildLongCell('年', 3, ['']),
                                  ]),
                                  buildLongRow([
                                    buildLongCell(
                                        lunarDate.getTimeGan(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getDayGan(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getMonthGan(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getYearGan(), 3, ['']),
                                    SizedBox(width: 30),
                                    buildLongCell(
                                        lunarDate.getTimeGan(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getDayGan(), 3, ['']),
                                    buildLongCell(trueMonthGan, 3, ['']),
                                    buildLongCell(
                                        lunarDate.getYearGan(), 3, ['']),
                                  ]),
                                  buildLongRow([
                                    buildLongCell(
                                        lunarDate.getTimeZhi(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getDayZhi(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getMonthZhi(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getYearZhi(), 3, ['']),
                                    SizedBox(width: 20),
                                    buildLongCell(
                                        lunarDate.getTimeZhi(), 3, ['']),
                                    buildLongCell(
                                        lunarDate.getDayZhi(), 3, ['']),
                                    buildLongCell(trueMonthZhi, 3, ['']),
                                    buildLongCell(
                                        lunarDate.getYearZhi(), 3, ['']),
                                  ]),
                                ],
                              ),

                              // Add more widgets after the Table if needed
                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        //      Positioned(
                        //   top: 300, // 45% of the screen height
                        //   // left: (screenWidth - arrowSize) / 2, // Center the arrow horizontally
                        //   left : 200,
                        //   child: Transform.rotate(
                        //     angle: 45 * (3.1416 / 180), // Convert 45 degrees to radians
                        //     child: Icon(
                        //       Icons.arrow_downward, // Arrow icon
                        //       size: arrowSize, // Adjust size dynamically
                        //       color: const Color.fromARGB(255, 255, 0, 0), // Arrow color
                        //     ),
                        //   ),
                        // ),
                        FractionallySizedBox(
                          widthFactor:
                              0.85, // 100% of the container's width for the bottom table
                          child: Table(
                            // Optional: Add borders to the second table cells
                            children: [
                              buildLongRow([
                                buildCellYears(
                                    daYunGanZh1[0], 3, daYunGanZh1[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan1, 3, dayun10shenpZhi1),
                                buildCellYears(
                                    daYunGanZhi2[0], 3, daYunGanZhi2[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan2, 3, dayun10shenpZhi2),
                                buildCellYears(
                                    daYunGanZhi3[0], 3, daYunGanZhi3[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan3, 3, dayun10shenpZhi3),
                                buildCellYears(
                                    daYunGanZhi4[0], 3, daYunGanZhi4[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan4, 3, dayun10shenpZhi4),
                                buildCellYears(
                                    daYunGanZhi5[0], 3, daYunGanZhi5[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan5, 3, dayun10shenpZhi5),
                                buildCellYears(
                                    daYunGanZhi6[0], 3, daYunGanZhi6[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan6, 3, dayun10shenpZhi6),
                                buildCellYears(
                                    daYunGanZhi7[0], 3, daYunGanZhi7[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan7, 3, dayun10shenpZhi7),
                                buildCellYears(
                                    daYunGanZhi8[0], 3, daYunGanZhi8[1]),
                                buildCellYearsShiShen(
                                    dayun10shenpGan8, 3, dayun10shenpZhi8),
                              ]),
                            ],
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor:
                              0.85, // 100% of the container's width for the bottom table
                          child: Table(
                            // Optional: Add borders to the second table cells
                            children: [
                              buildLongRow([
                                buildCellYearsnum(dayunNum),
                                buildCellYearsnum(dayunNum2),
                                buildCellYearsnum(dayunNum3),
                                buildCellYearsnum(dayunNum4),
                                buildCellYearsnum(dayunNum5),
                                buildCellYearsnum(dayunNum6),
                                buildCellYearsnum(dayunNum7),
                                buildCellYearsnum(dayunNum8),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  TableRow buildLongRow(List<Widget> cells) {
    return TableRow(
      children: cells
          .asMap()
          .map((index, cell) {
            return MapEntry(
              index,
              Padding(
                padding: EdgeInsets.only(
                  left: index == 0
                      ? 1.0
                      : 0.0, // Add padding to the left side of the first cell
                  right: index == cells.length - 1
                      ? 2.0
                      : 0.0, // Add padding to the right side of the last cell
                ),
                child: GestureDetector(
                  onTap: () {
                    print('Combined Row tapped!');
                  },
                  child: Container(
                    color: Color.fromARGB(
                        0, 107, 32, 156), // Ensure cell is visible
                    child: Align(
                      alignment: Alignment
                          .centerLeft, // Aligns the cell content to the left
                      child: cell,
                    ),
                  ),
                ),
              ),
            );
          })
          .values
          .toList(),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }

  Row buildRow(List<int?> boxIndices) {
    return Row(
      children: boxIndices.map((index) {
        if (index == null) {
          return Expanded(
              child: Container()); // Handle gaps with empty Expanded containers
        } else {
          return Expanded(
            child: buildBox(index),
          );
        }
      }).toList(),
    );
  }

  // Widget buildLongCell(String text1, int index, [List<String>? sideTexts]) {
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Container(
  //       color: Colors.transparent,
  //       padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
  //       alignment: Alignment.center,
  //       constraints:
  //           const BoxConstraints(minWidth: 40.0), // Adjust minWidth as needed
  //       child: FittedBox(
  //         fit: BoxFit.scaleDown,
  //         child: Row(
  //           children: [
  //             Text(
  //               text1,
  //               style: TextStyle(fontSize: 12),
  //               overflow: TextOverflow.ellipsis,
  //             ),
  //             SizedBox(width: 4),
  //             if (sideTexts != null)
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: sideTexts.map((text) {
  //                   return Text(
  //                     text,
  //                     style: TextStyle(fontSize: 12),
  //                     overflow: TextOverflow.ellipsis,
  //                   );
  //                 }).toList(),
  //               ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildLongCell(String text1, int index, [List<String>? sideTexts]) {
    double fontSize;
    return LayoutBuilder(
      
      builder: (context, constraints) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        double forWidth;
        double sizeBoxSiz;
        double topPosition;
        double height;
        double arrowSize;
        double arrowTopPosition;
        if (screenHeight > 1800) {
          // For large screens (e.g., tablets or desktops)
          topPosition = screenHeight * 0.19;

          sizeBoxSiz = 4;
          forWidth = 0.03;
          fontSize = 22;
          height = screenHeight * 0.3; // 30% of screen height
         } else if (screenHeight > 1200) {
           // For large screens (e.g., tablets or desktops)
          topPosition = screenHeight * 0.19;
        
          sizeBoxSiz = 4;
          forWidth = 0.03;
          fontSize = 16;
          height = screenHeight * 0.3; // 30% of screen height
        
        } else if (screenHeight < 1200 && screenHeight > 930) {
            // For medium screens (e.g., larger phones)
          topPosition = screenHeight * 0.19; // 19% from the top
          height = screenHeight * 0.34;
          sizeBoxSiz = 2;
          forWidth = 0.4;
           fontSize = 15;
          arrowSize = 5; // Medium-sized arrow
          arrowTopPosition = screenHeight * 0.73; // 73% of screen height
        } else if (screenHeight < 930 && screenHeight > 780) {
         // For small screens (e.g., smaller phones)
          topPosition = screenHeight * 0.25; // 20% from the top
          height = screenHeight * 0.20;
          sizeBoxSiz = 6;
          forWidth = 0.03;
           fontSize = 14;
          arrowSize = 15; // Smaller arrow for small screens
          arrowTopPosition = screenHeight * 0.25;
        } else if (screenHeight < 780 && screenHeight > 690) {
         // For small screens (e.g., smaller phones)
          topPosition = screenHeight * 0.20; // 20% from the top
          height = screenHeight * 0.20;
          sizeBoxSiz = 2;
          forWidth = 0.02;

           fontSize = 13;
          arrowSize = 15; // Smaller arrow for small screens
          arrowTopPosition = screenHeight * 0.25;
        } else if (screenHeight < 690 && screenHeight > 500) {
          // For small screens (e.g., smaller phones)
          topPosition = screenHeight * 0.20; // 20% from the top
          height = screenHeight * 0.20;
          sizeBoxSiz = 1;
           fontSize = 10;
          forWidth = 0.02;
          // arrowSize = 15; // Smaller arrow for small screens
          // arrowTopPosition = screenHeight * 0.25;
        } else {
          // For small screens (e.g., smaller phones)
          topPosition = screenHeight * 0.20; // 20% from the top
          height = screenHeight * 0.20;
          sizeBoxSiz = 1;
           fontSize = 8;
          forWidth = 0.02;
          arrowSize = 15; // Smaller arrow for small screens
          arrowTopPosition = screenHeight * 0.25;
        }
        // Adjust values based on screen height
       

        // Adjust font size and layout based on screen width
        // double fontSize =
        //     screenWidth * forWidth; // Adjust text size based on screen width

        return GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            alignment: Alignment.center,
            constraints: const BoxConstraints(minWidth: 0.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                        fontSize: fontSize,
                        color: getColorForText(
                            text1)), // Font size based on screen width
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: sizeBoxSiz),
                  if (sideTexts != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: sideTexts.map((text) {
                        return Text(
                          text,
                          style: TextStyle(
                              fontSize: fontSize,
                              color: getColorForText(
                                  text1)), // Font size for side text
                          overflow: TextOverflow.ellipsis,
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildBox(int index) {
    // Use MediaQuery to get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the box size based on screen dimensions
    final boxHeight = screenHeight * 0.18; // 18% of the screen height
    final boxWidth = screenWidth * 0.22; // 22% of the screen width

    // Get the number of items in the starMapping list
    int itemCount = starMapping[index + 1]?.length ?? 0;

// Determine font size based on the number of items
    double fontSize;
    double resturctSize;
    double yunStartrearrangefont = 7.0;
    double liuMonthFontSize;
    double rearrangeListFont;
    double restructpadding;
    // 4a 5.8 inch
    if (screenHeight < 650) {
      yunStartrearrangefont = 7.0;
      restructpadding = 24;
      if (itemCount >= 9) {
        fontSize = 7.0;
        
        rearrangeListFont = 9;
        
      } else if (itemCount >= 8) {
        fontSize = 8.0;
        
         rearrangeListFont = 9;
        
      } else if (itemCount >= 7) {
        fontSize = 9.0;
       
         rearrangeListFont = 9;
         
        
      } else {
        
        fontSize = 9.0;
         rearrangeListFont = 9;
         
         
      }
   }else if (screenHeight < 700) {
    restructpadding = 21;
    rearrangeListFont = 6;
    yunStartrearrangefont = 7.0;
      if (itemCount >= 9) {
        fontSize = 7.0;
       
        
        
      } else if (itemCount >= 8) {
        fontSize = 8.0;
        
       
        
      } else if (itemCount >= 7) {
        fontSize = 9.0;
        
        
        
      } else {
        
        
        fontSize = 10.0;
        
      }
      // pizel 5 6inch Screen Height: 802.9090909090909
    } else if (screenHeight < 830) {
      restructpadding = 24;
      if (itemCount >= 9) {
        fontSize = 8.0;
        yunStartrearrangefont = 9.0;
        rearrangeListFont = 10;
       
      } else if (itemCount >= 8) {
        fontSize = 9.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        
      } else if (itemCount >= 7) {
        fontSize = 10.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        
      } else {
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        fontSize = 12.0;
        
      }
    } else if (screenHeight < 870) {
      restructpadding = 24;
      if (itemCount >= 9) {
        fontSize = 8.0;
        yunStartrearrangefont = 9.0;
        rearrangeListFont = 10;
        
      } else if (itemCount >= 8) {
        fontSize = 9.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        
      } else if (itemCount >= 7) {
        fontSize = 10.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        
      } else {
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        fontSize = 12.0;
        
      }
    } else if (screenHeight < 930) {
      restructpadding = 24;
      if (itemCount >= 9) {
        fontSize = 8.0;
        yunStartrearrangefont = 9.0;
        rearrangeListFont = 10;
        
      } else if (itemCount >= 8) {
        fontSize = 9.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        
      } else if (itemCount >= 7) {
        fontSize = 12.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        
      } else {
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        fontSize = 12.0;
        
      }
       } else if (screenHeight < 1200 && screenHeight > 930) {
      restructpadding = 38;
      if (itemCount >= 9) {
        fontSize = 12.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
      } else if (itemCount >= 8) {
        fontSize = 12.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
      } else if (itemCount >= 7) {
        fontSize = 13.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
      } else {
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        fontSize = 14.0;
      }
       } else if (screenHeight < 1500 && screenHeight > 1200) {
      restructpadding = 38;
      if (itemCount >= 9) {
        fontSize = 14.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
      } else if (itemCount >= 8) {
        fontSize = 14.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
      } else if (itemCount >= 7) {
        fontSize = 14.0;
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
      } else {
        yunStartrearrangefont = 10.0;
        rearrangeListFont = 10;
        fontSize = 15.0;
      }
      } else if (screenHeight < 1900 && screenHeight > 1500) {
     restructpadding = 38;
      fontSize = 20.0;
      yunStartrearrangefont = 20.0;
      rearrangeListFont = 20;
    } else {
      yunStartrearrangefont = 8.0;
      rearrangeListFont = 10;
      fontSize = 8.0;
      restructpadding = 24;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          if (dayunselectedBoxIndex == index) {
            dayunselectedBoxIndex = -1;
            print('dayunselectedBoxIndex:$dayunselectedBoxIndex');
          } else {
            dayunselectedBoxIndex = index;
            selectedBoxIndex = index;
            print(fiveTiger[selectedBoxIndex!][0]);
            selectedTiangan = fiveTiger[selectedBoxIndex!][0];
          }
          if (dayunselectedBoxIndex == 0) {
            boxColors[0] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[1] = Colors.white; // Box 1
            boxColors[2] = Colors.white; // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Color.fromARGB(255, 133, 255, 224);
            boxColors[7] = Colors.white;
            boxColors[8] = Color.fromARGB(255, 133, 255, 224);
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (dayunselectedBoxIndex == 1) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[2] = Colors.white; // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Color.fromARGB(255, 133, 255, 224);
            boxColors[8] = Colors.white;
            boxColors[9] = Color.fromARGB(255, 133, 255, 224);
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (dayunselectedBoxIndex == 2) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[3] = Colors.white; // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Color.fromARGB(255, 133, 255, 224);
            boxColors[9] = Colors.white;
            boxColors[10] = Color.fromARGB(255, 133, 255, 224);
            boxColors[11] = Colors.white;
          } else if (dayunselectedBoxIndex == 3) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[4] = Colors.white; // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Color.fromARGB(255, 133, 255, 224);
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (dayunselectedBoxIndex == 4) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[5] = Colors.white; // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[9] = Colors.white; // Box 1
            boxColors[10] = Color.fromARGB(255, 133, 255, 224);
            boxColors[11] = Colors.white;
          } else if (dayunselectedBoxIndex == 5) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[6] = Colors.white; // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[10] = Colors.white; // Box 1
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (dayunselectedBoxIndex == 6) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Color.fromARGB(255, 164, 189, 228); // Box 1
            boxColors[7] = Colors.white; // Box 1
            boxColors[8] = Colors.white; // Box 1
            boxColors[9] = Colors.white; // Box 1
            boxColors[10] = Color.fromARGB(255, 133, 255, 224); // Box 1
            boxColors[11] = Colors.white; // Box 1
          } else if (dayunselectedBoxIndex == 7) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Color.fromARGB(255, 164, 189, 228);
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 133, 255, 224);
          } else if (dayunselectedBoxIndex == 8) {
            boxColors[0] = Color.fromARGB(255, 133, 255, 224);
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 133, 255, 224);
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Color.fromARGB(255, 164, 189, 228);
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (dayunselectedBoxIndex == 9) {
            boxColors[0] = Colors.white;
            boxColors[1] = Color.fromARGB(255, 133, 255, 224);
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 133, 255, 224);
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Color.fromARGB(255, 164, 189, 228);
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          } else if (dayunselectedBoxIndex == 10) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Color.fromARGB(255, 133, 255, 224);
            boxColors[3] = Colors.white;
            boxColors[4] = Color.fromARGB(255, 133, 255, 224);
            boxColors[5] = Colors.white;
            boxColors[6] = Color.fromARGB(255, 133, 255, 224);
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Color.fromARGB(255, 164, 189, 228);
            boxColors[11] = Colors.white;
          } else if (dayunselectedBoxIndex == 11) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Color.fromARGB(255, 133, 255, 224);
            boxColors[4] = Colors.white;
            boxColors[5] = Color.fromARGB(255, 133, 255, 224);
            boxColors[6] = Colors.white;
            boxColors[7] = Color.fromARGB(255, 133, 255, 224);
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Color.fromARGB(255, 164, 189, 228);
          } else if (dayunselectedBoxIndex == -1) {
            boxColors[0] = Colors.white;
            boxColors[1] = Colors.white;
            boxColors[2] = Colors.white;
            boxColors[3] = Colors.white;
            boxColors[4] = Colors.white;
            boxColors[5] = Colors.white;
            boxColors[6] = Colors.white;
            boxColors[7] = Colors.white;
            boxColors[8] = Colors.white;
            boxColors[9] = Colors.white;
            boxColors[10] = Colors.white;
            boxColors[11] = Colors.white;
          }
        });
        print("selectedBoxIndex $selectedBoxIndex tapped");
        print("Box $index tapped");
        restruct = ZiweiFunc.generateList(index, rearrangeList);
        print('restruct:$restruct');
        print("Selected Tiangan: $selectedTiangan");
      },
      child: Container(
        height: boxHeight, // Responsive height
        width: boxWidth, // Responsive width
        decoration: BoxDecoration(
          color: boxColors[index],
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            // Top section (using Flexible to allow more control over space allocation)
            Flexible(
              child: Column(
                children: [
                  if ((starMapping[index + 1] ?? []).isNotEmpty)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (starMapping[index + 1] ?? []).map((str) {
                        Map<String, Color> currentGanColors =
                            ganColorMapping[selectedTiangan] ?? {};
                        Color textColor =
                            currentGanColors[str] ?? Colors.transparent;
                        backgroundColor = textColor;
                        // print("selectedTiangan: $selectedTiangan");
                        // print("backgroundColor: $backgroundColor");
                        // print("currentGanColors: $currentGanColors");
                        // print("str- buildbox: $str");
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 50,
                          ),
                          child: Container(
                            // padding: EdgeInsets.symmetric(
                            //     vertical: 0, horizontal: 0),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              // 錄全科技顏色
                              // border: Border.all(color: textColor),
                              // borderRadius: BorderRadius.circular(1),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: str.split('').map((char) {
                                Color textColor = Color.fromARGB(255, 1, 95, 1);
                                if (['地劫', '地劫', '擎羊', '陀羅'].contains(str)) {
                                  textColor = Color.fromARGB(255, 216, 74, 245);
                                }
                                return AutoSizeText(
                                  char,
                                  maxLines: 1,
                                  minFontSize: 2,
                                  maxFontSize: fontSize,
                                  style: TextStyle(color: textColor),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  if ((starBrightness[index + 1] ?? []).isNotEmpty)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (starBrightness[index + 1] ?? []).map((str) {
                        Map<String, Color> currentGanColors =
                            ganColorMapping[selectedTiangan] ?? {};
                        Color textColor2 = colorMapping[str] ?? Colors.white;
                        Color textColor = currentGanColors[str] ?? textColor2;
                        Color backgroundColor = textColor;

                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 50,
                          ),
                          child: Container(
                            // padding: EdgeInsets.symmetric(
                            //     vertical: 0, horizontal: 0),
                            // decoration: BoxDecoration(
                            //   color: backgroundColor,
                            //   border: Border.all(color: backgroundColor),
                            //   borderRadius: BorderRadius.circular(2),
                            // ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: str.split('').map((char) {
                                return AutoSizeText(
                                  char,
                                  maxLines: 1,
                                  minFontSize: 2,
                                  maxFontSize: fontSize,
                                  style: TextStyle(
                                    color: char == '無'
                                        ? Colors.transparent
                                        : const Color.fromARGB(
                                            255, 107, 107, 107),
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  // Add another pwer row here if needed
                  if ((pwer2[index + 1] ?? []).isNotEmpty)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (pwer2[index + 1] ?? []).map((str) {
                        Map<String, Color> currentGanColors =
                            ganColorMapping[selectedTiangan] ?? {};
                        Color textColor2 =
                            colorMapping[str] ?? Colors.transparent;
                        Color textColor = currentGanColors[str] ?? textColor2;
                        Color backgroundColor = textColor;
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 50,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              // border: Border.all(color: textColor),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: str.split('').map((char) {
                                return AutoSizeText(
                                  char,
                                  maxLines: 1,
                                  minFontSize: 2,
                                  maxFontSize: fontSize,
                                  style: TextStyle(
                                    color: char == '無'
                                        ? Colors.transparent
                                        : Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                );
                              }).toList(),
                            ),
                          ),
                        );
                        // return ConstrainedBox(
                        //   constraints: BoxConstraints(
                        //     minWidth: 0,
                        //   ),
                        //   child: Container(
                        //     // padding: EdgeInsets.symmetric(
                        //     //     vertical: 0, horizontal: 0),
                        //     decoration: BoxDecoration(
                        //       color: backgroundColor,
                        //       border: Border.all(color: textColor),
                        //     ),
                        //     child: Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: str.split('').map((char) {
                        //         return AutoSizeText(
                        //           char,
                        //           maxLines: 1,
                        //           minFontSize: 2,
                        //           maxFontSize: fontSize,
                        //           style: TextStyle(color: Colors.black),
                        //           textAlign: TextAlign.center,
                        //           overflow: TextOverflow.ellipsis,
                        //         );
                        //       }).toList(),
                        //     ),
                        //   ),
                        // );
                      }).toList(),
                    ),
                ],
              ),
            ),

            // test3
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Ensure the column takes the minimum height needed
                children: [
                  // Row 1: Red bordered yunStartrearrange and rearrangeAndInsertplaceHolder on the right
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(0, 51, 212,
                                    18)), // Red border for first AutoSizeText
                          ),
                          child: AutoSizeText(
                            yunStartrearrange[index]!,
                            maxLines: 1,
                            minFontSize: 2,
                            maxFontSize: yunStartrearrangefont,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              height: 1.0, // Adjust this to reduce line height
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: rearrangeAndInsertplaceHolder[index]!
                            .split(
                                '') // Split the string into individual characters
                            .map((g) {
                          return AutoSizeText(
                            g, // Render each character vertically
                            minFontSize: 2,
                            maxFontSize: rearrangeListFont,
                            style: TextStyle(
                              color: Color.fromARGB(255, 163, 0, 0),
                              height:
                                  1.0, // Adjust this to control the spacing between lines
                            ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  // Row 2: Blue bordered yunStartrearrange
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors
                              .transparent), // Blue border for second AutoSizeText
                    ),
                    child: AutoSizeText(
                      shoyunStartrearrange[index]!,
                      maxLines: 1,
                      minFontSize: 2,
                      maxFontSize: yunStartrearrangefont,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        height: 0.0, // Adjust this to reduce line height
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double
                                .infinity, // Ensures the container spans the full width of its parent
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    restructpadding), // Add padding to avoid sticking to edges
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit
                                      .tight, // Ensures the text can take up available space
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: AutoSizeText(
                                      restruct[index]!,
                                      maxLines: 1,
                                      minFontSize: 4,
                                      maxFontSize: rearrangeListFont,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit
                                      .tight, // Ensures the text can take up available space
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: AutoSizeText(
                                      rearrangeList[index]!,
                                      maxLines: 1,
                                      minFontSize: 2,
                                      maxFontSize: rearrangeListFont,
                                      style: TextStyle(color: Colors.red),
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: AutoSizeText(
                      liuMonth[index]!,
                      maxLines: 1,
                      minFontSize: 2,
                      maxFontSize: rearrangeListFont,
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AutoSizeText(
                      fiveTiger[index]!,
                      maxLines: 1,
                      minFontSize: 2,
                      maxFontSize: rearrangeListFont,
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCellYearsnum(String text1) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
double fontSize;

    if (screenHeight > 1800) {
      fontSize = 16.0;
     } else if (screenHeight < 1800 && screenHeight > 1500) {
      fontSize = 14.0;
    } else if (screenHeight < 1200 && screenHeight > 930) {
      fontSize = 12.0;
     
    } else if (screenHeight < 930 && screenHeight > 780) {
      fontSize = 10.0;
     
    } else if (screenHeight < 780 && screenHeight > 690) {
      fontSize = 10.0;
      
    } else if (screenHeight < 690 && screenHeight > 500) {
      fontSize = 8.0;
      
    } else {
      fontSize = 8.0;
      
    }
       

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.3, vertical: 1.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              text1,
              style: TextStyle(fontSize: fontSize),
              // Maximum font size
              overflow: TextOverflow.visible,
              maxLines: 1,
              minFontSize: 5, // Minimum font size
              //  textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildTable() {
  //   double screenHeight = MediaQuery.of(context).size.height;
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double fontSize;
  //   if (screenHeight > 1800) {
  //     fontSize = 10;
  //   } else if (screenHeight > 1200) {
  //     fontSize = 10;
  //   } else if (screenHeight < 1200 && screenHeight > 930) {
  //     fontSize = 10;
  //   } else if (screenHeight < 930 && screenHeight > 780) {
  //     fontSize = 9;
  //   } else if (screenHeight < 780 && screenHeight > 690) {
  //     fontSize = 9;
  //   } else if (screenHeight < 690 && screenHeight > 500) {
  //     fontSize = 8;
  //   } else {
  //     fontSize = 8;
  //   }
  //   return Table(
  //     columnWidths: {
  //       // Distribute space equally among all columns
  //       for (int i = 0; i < 11; i++) i: FlexColumnWidth(1),
  //     },
  //     border: TableBorder.all(color: Colors.black),
  //     children: List.generate(5, (rowIndex) {
  //       return TableRow(
  //         children: List.generate(11, (colIndex) {
  //           return Padding(
  //             padding:
  //                 const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
  //             child: Center(
  //               child: FittedBox(
  //                 fit: BoxFit.scaleDown,
  //                 child: Text(
  //                   'R${rowIndex + 1}C${colIndex + 1}',
  //                   style: TextStyle(fontSize: 12),
  //                 ),
  //               ),
  //             ),
  //           );
  //         }),
  //       );
  //     }),
  //   );
  // }

  // Define a map that associates each string with a color
  Map<String, Color> colorMapping = {
    '祿': Colors.green,
    '權': Colors.purple,
    '科': Colors.blue,
    '忌': Colors.red,
    // '貪狼': Colors.purple,
    // '天同': Colors.orange,
    // '巨門': Colors.pink,
    // '武曲': Colors.teal,
    // '天相': Colors.cyan,
    // '太陽': Colors.lime,
    // '天樑': Colors.amber,
    // '七殺': Colors.indigo,
    // '天機': const Color.fromARGB(255, 0, 0, 0),
    // '紫薇': Colors.deepOrange,
    // '文曲': Colors.lightGreen,
    // // Add other strings with corresponding colors as needed
  };

  // Color getBackgroundColorForText(String text) {
  //   // Define your logic here to return a different color for different texts
  //   if (text == "紫薇") {
  //     return Color.fromARGB(255, 62, 14, 236);
  //   } else if (text == "太陰") {
  //     return const Color.fromARGB(255, 65, 105, 173);
  //   }
  //   return Color.fromARGB(255, 126, 30, 30); // Default background color
  // }

  final Map<String, Map<String, Color>> ganColorMapping = {
    '甲': {
      '廉貞': Colors.green,
      '破軍': Colors.purple,
      '武曲': Colors.blue,
      '太陽': Colors.red,
    },
    '乙': {
      '天機': Colors.green,
      '天梁': Colors.purple,
      '紫薇': Colors.blue,
      '太陰': Colors.red,
    },
    '丙': {
      '天同': Colors.green,
      '天機': Colors.purple,
      '文昌': Colors.blue,
      '廉貞': Colors.red,
    },
    '丁': {
      '太陰': Colors.green,
      '天同': Colors.purple,
      '天機': Colors.blue,
      '巨門': Colors.red,
    },
    '戊': {
      '貪狼': Colors.green,
      '太陰': Colors.purple,
      '右弼': Colors.blue,
      '天機': Colors.red,
    },
    '己': {
      '武曲': Colors.green,
      '貪狼': Colors.purple,
      '天梁': Colors.blue,
      '文曲': Colors.red,
    },
    '庚': {
      '太陽': Colors.green,
      '武曲': Colors.purple,
      '天同': Colors.blue,
      '天相': Colors.red,
    },
    '辛': {
      '巨門': Colors.green,
      '太陽': Colors.purple,
      '文曲': Colors.blue,
      '文昌': Colors.red,
    },
    '壬': {
      '天梁': Colors.green,
      '紫薇': Colors.purple,
      '左輔': Colors.blue,
      '武曲': Colors.red,
    },
    '癸': {
      '破軍': Colors.green,
      '巨門': Colors.purple,
      '太陰': Colors.blue,
      '貪狼': Colors.red,
    },
  };
  Color getColorForText(String text) {
    if (text == '丙') {
      return Colors.red;
    } else if (text == '丁') {
      return Color.fromARGB(255, 255, 0, 0);
    } else if (text == '巳') {
      return Colors.red;
    } else if (text == '午') {
      return Color.fromARGB(255, 255, 0, 0);
    } else if (text == '甲') {
      return Colors.green;
    } else if (text == '乙') {
      return Colors.green;
    } else if (text == '寅') {
      return Colors.green;
    } else if (text == '卯') {
      return Colors.green;
    } else if (text == '癸') {
      return Color.fromARGB(255, 6, 10, 255);
    } else if (text == '壬') {
      return Color.fromARGB(255, 6, 10, 255);
    } else if (text == '亥') {
      return Color.fromARGB(255, 6, 10, 255);
    } else if (text == '子') {
      return Color.fromARGB(255, 6, 10, 255);
    } else if (text == '庚') {
      return Color.fromARGB(255, 180, 154, 3);
    } else if (text == '辛') {
      return Color.fromARGB(255, 180, 154, 3);
    } else if (text == '申') {
      return Color.fromARGB(255, 180, 154, 3);
    } else if (text == '酉') {
      return Color.fromARGB(255, 180, 154, 3);
    } else if (text == '己') {
      return Color.fromARGB(255, 102, 95, 1);
    } else if (text == '戊') {
      return Color.fromARGB(255, 102, 95, 1);
    } else if (text == '辰') {
      return Color.fromARGB(255, 102, 95, 1);
    } else if (text == '戌') {
      return Color.fromARGB(255, 102, 95, 1);
    } else if (text == '丑') {
      return Color.fromARGB(255, 102, 95, 1);
    } else if (text == '未') {
      return Color.fromARGB(255, 102, 95, 1);
    } else {
      return Color.fromARGB(255, 0, 0, 0); // Default color
    }
  }
}
