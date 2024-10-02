// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'package:learn1/calendar/util/LunarUtil.dart';
import 'package:flutter/material.dart';

import 'package:learn1/calendar/Lunar.dart' as lunar;
import 'new_member.dart'; // Import NewMember class
import 'package:auto_size_text/auto_size_text.dart';

import 'package:learn1/calendar/EightChar.dart';
import 'package:learn1/calendar/gods.dart';

import 'package:learn1/calendar/eightchar/DaYun.dart';
import 'package:learn1/calendar/eightchar/Yun.dart';

class BaziPage extends StatefulWidget {
  final DateTime? birthday;
  final String? time;
  final bool? sex;

  const BaziPage({
    Key? key,
    required this.birthday,
    this.time,
    this.sex,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BaziPageState createState() => _BaziPageState();
}

class _BaziPageState extends State<BaziPage> {
  late double textfont;

  int tappedCellIndex = 0;
  int colorIndexMonth = 0;
  int colorIndexDayun = 0;
  int colorIndexYear = 0;

  late DateTime combinedDateTime;
  DateTime now = DateTime.now();

  //increment for taps usage
  late int year;
  int month = 1;

  late DateTime dateLiunen = DateTime(year, 5, 2);

  late lunar.Lunar lunarDate;
  late lunar.Lunar lunarDateMonth;
  late lunar.Lunar selectedDate;

  late String age;
  late int ageInt;

  //月干月支用
  int selectedYear = 0;

  // 納音
  late String naYingTime;
  late String naYingDay;
  late String naYingMonth;
  late String naYingYear;
  late String dayunNaying;
  late String liunenNaying;
  late String MonthNayingHold;
  String selecteddateNaying = '';

  // 星運
  late String XingYunTime;
  late String XingYunDay;
  late String XingYunMonth;
  late String XingYunYear;
  late String dayunXingYun;
  late String liunenXingYun;
  late String monthXingYun;
  String dayXingYun = '';
  String xingYunZhiHolder = '';

  late String kongWanTime;
  late String kongWanDay;
  late String kongWanMonth;

  late String kongWanTime2;
  late String kongWanDay2;
  late String kongWanMonth2;

  ///kongwanGan
  late String kongWanYear;

  ///kongwanZhi
  late String kongWanYear2;

  late String daYunKongWan;
  late String daYunKongWanZhi;

  late String liunenKongWan;
  late String liunenKongWanZhi;
  late String thisMonntKongwan;
  late String thisMonntKongwanzhi;

  String dayKongwan = '';
  String dayKongwanzhi = '';

  late List<String> combines;

  late List<String> tiangCombines;
  late List<String> tiangThreeTops;
  late List<String> tianattk;

  late List<String> combineszhi;
  late List<String> diziHalfCom;
  late List<String> diziThreeAttck;
  late List<String> diziTwoAttk;
  late List<String> diziSuppCom;
  late List<String> diziCom;
  late List<String> diziHidCom;
  late List<String> attkOneself;
  late List<String> dizihai;

  late List<String> diziAttk;

  late List<String> dizibroke;
  late List<String> diziThreeMeets;

  late EightChar eightChar;
  late EightChar todayEightchar;
  late EightChar liuNenEightc;

  late EightChar liuNenEightcRow1;
  late EightChar liuNenEightcRow2;
  late EightChar liuNenEightcRow3;
  late EightChar liuNenEightcRow4;
  late EightChar liuNenEightcRow5;
  late EightChar liuNenEightcRow6;
  late EightChar liuNenEightcRow7;
  late EightChar liuNenEightcRow8;
  late EightChar liuNenEightcRow9;
  late EightChar liuNenEightcRow10;

  late Yun yun;

  //只用一次
  late DaYun daYun;
  late DaYun daYun2;
  late DaYun daYun3;
  late DaYun daYun4;
  late DaYun daYun5;
  late DaYun daYun6;
  late DaYun daYun7;
  late DaYun daYun8;
  late DaYun daYun9;
  late DaYun daYun10;
  late String dayunNum;
  late String dayunNum2;
  late String dayunNum3;
  late String dayunNum4;
  late String dayunNum5;
  late String dayunNum6;
  late String dayunNum7;
  late String dayunNum8;
  late String dayunNum9;
  late String dayunNum10;

  late String daYunStartYear;
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
  late String daYunGanZhi9;
  late String daYunGanZhi10;

  late int firstDayunInt;
  late int secDayunInt;
  late int thirdDayunInt;
  late int fourthDayunInt;
  late int fifthDayunInt;
  late int sixthDayunInt;
  late int seventhDayunInt;
  late int eighthDayunInt;
  late int ninethDayunInt;
  late int tenthDayunInt;

  late String liunenGanZh1;
  late String liunenGanZhi2;
  late String liunenGanZhi3;
  late String liunenGanZhi4;
  late String liunenGanZhi5;
  late String liunenGanZhi6;
  late String liunenGanZhi7;
  late String liunenGanZhi8;
  late String liunenGanZhi9;
  late String liunenGanZhi10;

  late String liunenZh1;
  late String liunenZhi2;
  late String liunenZhi3;
  late String liunenZhi4;
  late String liunenZhi5;
  late String liunenZhi6;
  late String liunenZhi7;
  late String liunenZhi8;
  late String liunenZhi9;
  late String liunenZhi10;

  late String liunenZh1Num;
  late String liunenZhi2Num;
  late String liunenZhi3Num;
  late String liunenZhi4Num;
  late String liunenZhi5Num;
  late String liunenZhi6Num;
  late String liunenZhi7Num;
  late String liunenZhi8Num;
  late String liunenZhi9Num;
  late String liunenZhi10Num;

  late String liuMonthHolder;
  late String liuMonthHolderZhi;

  late String liuMonthGan;
  late String liuMonthGan2;
  late String liuMonthGan3;
  late String liuMonthGan4;
  late String liuMonthGan5;
  late String liuMonthGan6;
  late String liuMonthGan7;
  late String liuMonthGan8;
  late String liuMonthGan9;
  late String liuMonthGan10;
  late String liuMonthGan11;
  late String liuMonthGan12;

  late String liuMonthzhi;
  late String liuMonthzhi2;
  late String liuMonthzhi3;
  late String liuMonthzhi4;
  late String liuMonthzhi5;
  late String liuMonthzhi6;
  late String liuMonthzhi7;
  late String liuMonthzhi8;
  late String liuMonthzhi9;
  late String liuMonthzhi10;
  late String liuMonthzhi11;
  late String liuMonthzhi12;

  late String liunenGanZh1shishengan;
  late String liunenGanZh1shishenzhi;
  late String liunenGanZhi2shishengan;
  late String liunenGanZhi2shishenzhi;
  late String liunenGanZhi3shishengan;
  late String liunenGanZhi3shishenzhi;
  late String liunenGanZhi4shishengan;
  late String liunenGanZhi4shishenzhi;
  late String liunenGanZhi5shishengan;
  late String liunenGanZhi5shishenzhi;
  late String liunenGanZhi6shishengan;
  late String liunenGanZhi6shishenzhi;
  late String liunenGanZhi7shishengan;
  late String liunenGanZhi7shishenzhi;
  late String liunenGanZhi8shishenggan;
  late String liunenGanZhi8shishenzhi;
  late String liunenGanZhi9shishengan;
  late String liunenGanZhi9shishenzhi;
  late String liunenGanZhi10shishengan;
  late String liunenGanZhi10shishenzhi;

  late String liuMonthshiShenholdergan;
  late String liuMonthshiShenholderzhi;

  late String liuMonthZh1shishengan;
  late String liuMonthZh1shishenzhi;
  late String liuMonthZhi2shishengan;
  late String liuMonthZhi2shishenzhi;
  late String liuMonthZhi3shishengan;
  late String liuMonthZhi3shishenzhi;
  late String liuMonthZhi4shishengan;
  late String liuMonthZhi4shishenzhi;
  late String liuMonthZhi5shishengan;
  late String liuMonthZhi5shishenzhi;
  late String liuMonthZhi6shishengan;
  late String liuMonthZhi6shishenzhi;
  late String liuMonthZhi7shishengan;
  late String liuMonthZhi7shishenzhi;
  late String liuMonthZhi8shishengan;
  late String liuMonthZhi8shishenzhi;
  late String liuMonthZhi9shishengan;
  late String liuMonthZhi9shishenzhi;
  late String liuMonthZhi10shishengan;
  late String liuMonthZhi10shishenzhi;
  late String liuMonthZhi11shishengan;
  late String liuMonthZhi11shishenzhi;
  late String liuMonthZhi12shishengan;
  late String liuMonthZhi12shishenzhi;

  String selectedDateHoldertop = '';
  String selectedDateHolderbot = '';
  String selectedDateshisenHoldTop = '';
  String selectedDateshisenHoldbot = '';

  late String sexString;

  late int currentDaYunPeriod;

  late String daYunHoldergan;
  late String daYunHolderZhi;

  late String thisYearGan;
  late String thisYearZhi;

  late String dayunHidenShiShen;
  late String dayunHidenShiShenZhi1;
  late String dayunHidenShiShenZhi2;
  late String dayunHidenShiShenZhi3;

  late String liunenHidenShiShen;
  late String liunenHidenShiShenZhi1;
  late String liunenHidenShiShenZhi2;
  late String liunenHidenShiShenZhi3;

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

  //神煞
  late List<String> runAllgodsTime;
  late List<String> runAllgodsDay;
  late List<String> runAllgodsMonth;
  late List<String> runAllgodsYear;
  late List<String> runAllgodsDayun;
  late List<String> runAllgodsLiuyear;
  late List<String> runAllgodsLiuMonth;
  late List<String> runAllgodspickDate;

  List<String> getDayunGanShishenZhi(String first, String second) {
    List<String> elements = LunarUtil.ZHI_HIDE_GAN[second] ?? [];

    List<String> relationships = [];

    for (String element in elements) {
      String key = '$first$element';
      String relationship = LunarUtil.SHI_SHEN[key] ?? '??';
      relationships.add(relationship);
    }

    // Ensure the list has at least 3 elements
    while (relationships.length < 3) {
      relationships.add('');
    }

    return relationships;
  }

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  int calculateDaYunPeriod(int startAge, int currentAge) {
    if (currentAge < startAge) {
      return 1; // Indicates that the age is before the start of the DaYun periods
    }
    return ((currentAge - startAge) ~/ 10) + 1;
  }
  //  int currentDaYunPeriod = calculateDaYunPeriod(daYunStartAge, ageInt);

  // if (currentDaYunPeriod == -1) {
  //   print('The current age is before the start of DaYun periods.');
  // } else {
  //   print('The person is currently in DaYun$currentDaYunPeriod');

  // }
  //  default 現在大運的天干
  String daYunPlaceHold(int currentDaYunPeriod) {
    daYun = DaYun(yun, currentDaYunPeriod);
    return daYunGanZhi = daYun.getGanZhi();
  }

  String getDayunGanShishen(String getDayGan, String dayun) {
    String key = '$getDayGan$dayun';
    return LunarUtil.SHI_SHEN[key] ?? '??';
  }

  late String firstCharacter;
  late String tianShiShenTime;
  late String tianShiShenMonth;
  late String tianShiShenYear;

  late List<String> yearZhi;
  late List<String> monthZhi;
  late List<String> dayZhi;
  late List<String> timeZhi;

  // Combine the lists into one with the desired order
  late List<String> combinedList;

  // Assign each element to a string variable, allowing for nulls
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;

  late int lastDay = DateTime(year, month + 1, 0).day;

  String selectedValue = '1'; // Initial selected value
  List<String> dropDownOptions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ]; // Drop-down options

  void updateDropDownOptions(int year, int month) {
    // Determine the last day of the month

    int lastDay = DateTime(year, month + 1, 0).day;
    print('updateDropDownOptions Month: $month');
    print('updateDropDownOptions year: $year');

    // Update the dropDownOptions list based on the last day
    dropDownOptions = List.generate(lastDay, (index) => (index + 1).toString());

    // Ensure that the selected value is still valid
    if (int.parse(selectedValue) > lastDay) {
      selectedValue = lastDay.toString();
    }

    // Call setState if needed to refresh the UI
    setState(() {});
  }

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

    age = calculateAge(combinedDateTime).toString();
    ageInt = calculateAge(combinedDateTime);
    lunarDate = lunar.Lunar.fromDate(combinedDateTime);

    naYingTime = lunarDate.getTimeNaYin();
    naYingDay = lunarDate.getDayNaYin();
    naYingMonth = lunarDate.getMonthNaYin();
    naYingYear = lunarDate.getYearNaYin();

    // 算今年大運
    lunar.Lunar toDay = lunar.Lunar.fromDate(now);

    eightChar = lunarDate.getEightChar();
    // Create an instance of Yun using the EightChar instance and gender (1 for male, 0 for female)
    yun = Yun(eightChar, widget.sex == true ? 1 : 0);

    todayEightchar = toDay.getEightChar();

    daYun = DaYun(yun, 1);
    daYun2 = DaYun(yun, 2);
    daYun3 = DaYun(yun, 3);
    daYun4 = DaYun(yun, 4);
    daYun5 = DaYun(yun, 5);
    daYun6 = DaYun(yun, 6);
    daYun7 = DaYun(yun, 7);
    daYun8 = DaYun(yun, 8);
    daYun9 = DaYun(yun, 9);
    daYun10 = DaYun(yun, 10);

    // 今日
    selectedDate = toDay;

    // dayunNum = daYunStartYear;

    daYunStartYear = daYun.getStartYear().toString();
    daYunEndYear = daYun.getEndYear().toString();
    daYunStartAge = daYun.getStartAge();
    daYunEndAge = daYun.getEndAge().toString();
    daYunGanZhi = daYun.getGanZhi();
    //Dayun start. first dayunGanzhi use daYun withot #
    daYunGanZh1 = daYun.getGanZhi();

    daYunGanZhi2 = daYun2.getGanZhi();
    daYunGanZhi3 = daYun3.getGanZhi();
    daYunGanZhi4 = daYun4.getGanZhi();
    daYunGanZhi5 = daYun5.getGanZhi();
    daYunGanZhi6 = daYun6.getGanZhi();
    daYunGanZhi7 = daYun7.getGanZhi();
    daYunGanZhi8 = daYun8.getGanZhi();
    daYunGanZhi9 = daYun9.getGanZhi();
    daYunGanZhi10 = daYun10.getGanZhi();
    sexString = widget.sex == true ? "男" : "女";

    dayunNum = daYunStartYear;
    dayunNum2 = (daYun.getStartYear() + 10).toString();
    dayunNum3 = (daYun.getStartYear() + 20).toString();
    dayunNum4 = (daYun.getStartYear() + 30).toString();
    dayunNum5 = (daYun.getStartYear() + 40).toString();
    dayunNum6 = (daYun.getStartYear() + 50).toString();
    dayunNum7 = (daYun.getStartYear() + 60).toString();
    dayunNum8 = (daYun.getStartYear() + 70).toString();
    dayunNum9 = (daYun.getStartYear() + 80).toString();
    dayunNum10 = (daYun.getStartYear() + 90).toString();

    firstDayunInt = daYun.getStartYear();
    secDayunInt = (daYun.getStartYear() + 10);
    year = firstDayunInt;

    thirdDayunInt = (daYun.getStartYear() + 20);
    fourthDayunInt = (daYun.getStartYear() + 30);
    fifthDayunInt = (daYun.getStartYear() + 40);
    sixthDayunInt = (daYun.getStartYear() + 50);
    seventhDayunInt = (daYun.getStartYear() + 60);
    eighthDayunInt = (daYun.getStartYear() + 70);
    ninethDayunInt = (daYun.getStartYear() + 80);
    tenthDayunInt = (daYun.getStartYear() + 90);

    liuMonthHolder = toDay.getMonthGan();
    liuMonthHolderZhi = toDay.getMonthZhi();

    print(age);
    print('DaYun Start Year: $daYunStartYear');
    print('DaYun End Year: $daYunEndYear');
    print('DaYun Start Age: $daYunStartAge');
    print('DaYun End Age: $daYunEndAge');
    print('DaYun GanZhi: $daYunGanZhi');
    print('Sex: $sexString');

    print('today baxi:$todayEightchar');

    print(lunarDate.getTimeNaYin());
    print(lunarDate.getDayNaYin());
    print(lunarDate.getMonthNaYin());
    print(lunarDate.getYearNaYin());

    print(lunarDate.getDayKongWong());

    kongWanTime = lunarDate.getTimeKongWong()[0];
    kongWanDay = lunarDate.getDayKongWong()[0];
    kongWanMonth = lunarDate.getMonthKongWong()[0];
    kongWanYear = lunarDate.getYearKongWong()[0];

    kongWanTime2 = lunarDate.getTimeKongWong()[1];
    kongWanDay2 = lunarDate.getDayKongWong()[1];
    kongWanMonth2 = lunarDate.getMonthKongWong()[1];
    kongWanYear2 = lunarDate.getYearKongWong()[1];

    XingYunTime = lunarDate.getTimeXingYun();
    XingYunDay = lunarDate.getDayXingYun();
    XingYunMonth = lunarDate.getMonthXingYun();
    XingYunYear = lunarDate.getYearXingYun();

    // print(toDay.getYearGan());
    thisYearGan = toDay.getYearGan();
    thisYearZhi = toDay.getYearZhi();

    currentDaYunPeriod = calculateDaYunPeriod(daYunStartAge, ageInt);

    daYunHoldergan = daYunPlaceHold(currentDaYunPeriod)[0];
    daYunHolderZhi = daYunPlaceHold(currentDaYunPeriod)[1];
    print('this is daYunHoldergan $daYunHoldergan');
    print('this is daYunHoldergan $daYunHolderZhi');
    print(toDay.getMonthGan());

    dayunNaying = LunarUtil.NAYIN['$daYunHoldergan$daYunHolderZhi']!;
    dayunXingYun =
        LunarUtil.XingYun['${lunarDate.getDayGan()}$daYunHolderZhi']!;
    print('dayunXingYun$dayunXingYun');
    liunenXingYun = LunarUtil.XingYun['${lunarDate.getDayGan()}$thisYearZhi']!;

    monthXingYun =
        LunarUtil.XingYun['${lunarDate.getDayGan()}$liuMonthHolderZhi']!;
    daYunKongWan = LunarUtil.KONGWAN['$daYunHoldergan$daYunHolderZhi']![0];
    daYunKongWanZhi = LunarUtil.KONGWAN['$daYunHoldergan$daYunHolderZhi']![1];

    liunenNaying = LunarUtil.NAYIN['$thisYearGan$thisYearZhi']!;
    MonthNayingHold = LunarUtil.NAYIN['$liuMonthHolder$liuMonthHolderZhi']!;

    liunenKongWan = LunarUtil.KONGWAN['$thisYearGan$thisYearZhi']![0];
    liunenKongWanZhi = LunarUtil.KONGWAN['$thisYearGan$thisYearZhi']![1];

    thisMonntKongwan =
        LunarUtil.KONGWAN['$liuMonthHolder$liuMonthHolderZhi']![0];
    thisMonntKongwanzhi =
        LunarUtil.KONGWAN['$liuMonthHolder$liuMonthHolderZhi']![1];

    // 大運的十神
    dayunHidenShiShen = getDayunGanShishen(
        lunarDate.getDayGan(), daYunPlaceHold(currentDaYunPeriod)[0]);
    dayunHidenShiShenZhi1 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunHolderZhi)[0];
    dayunHidenShiShenZhi2 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunHolderZhi)[1];
    dayunHidenShiShenZhi3 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunHolderZhi)[2];

    dayun10shenpGan1 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZh1[0]);
    print('dayun10shenpGan1: $dayun10shenpGan1');
    dayun10shenpZhi1 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZh1[1])[0];

    dayun10shenpGan2 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi2[0]);
    dayun10shenpZhi2 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi2[1])[0];

    dayun10shenpGan3 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi3[0]);
    dayun10shenpZhi3 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi3[1])[0];

    dayun10shenpGan4 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi4[0]);
    dayun10shenpZhi4 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi4[1])[0];

    dayun10shenpGan5 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi5[0]);
    dayun10shenpZhi5 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi5[1])[0];

    dayun10shenpGan6 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi6[0]);
    dayun10shenpZhi6 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi6[1])[0];

    dayun10shenpGan7 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi7[0]);
    dayun10shenpZhi7 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi7[1])[0];

    dayun10shenpGan8 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi8[0]);
    dayun10shenpZhi8 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi8[1])[0];

    dayun10shenpGan9 =
        getDayunGanShishen(lunarDate.getDayGan(), daYunGanZhi9[0]);
    dayun10shenpZhi9 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), daYunGanZhi9[1])[0];

    firstCharacter = lunarDate.getBaZiShiShenTimeZhi()[0];
    print("First character: $firstCharacter");
    tianShiShenTime = lunarDate.getBaZiShiShenGan()[3];
    tianShiShenMonth = lunarDate.getBaZiShiShenGan()[1];
    tianShiShenYear = lunarDate.getBaZiShiShenGan()[0];

    print('line 369: $lunarDate.getBaZiShiShenYearZhi() ');
    print(lunarDate.getBaZiShiShenMonthZhi());
    print(lunarDate.getBaZiShiShenDayZhi());
    print(lunarDate.getBaZiShiShenTimeZhi());

    List<String> yearZhi = lunarDate.getBaZiShiShenYearZhi();
    List<String> monthZhi = lunarDate.getBaZiShiShenMonthZhi();
    List<String> dayZhi = lunarDate.getBaZiShiShenDayZhi();
    List<String> timeZhi = lunarDate.getBaZiShiShenTimeZhi();

    while (yearZhi.length < 3) {
      yearZhi.add('');
    }
    while (monthZhi.length < 3) {
      monthZhi.add('');
    }
    while (dayZhi.length < 3) {
      dayZhi.add('');
    }
    while (timeZhi.length < 3) {
      timeZhi.add('');
    }

    // Combine the lists into one with the desired order
    List<String> combinedList = [
      ...yearZhi, // s1, s2, s3
      ...monthZhi, // s4, s5, s6
      ...dayZhi, // s7, s8, s9
      ...timeZhi // s10, s11, s12
    ];

    // Assign each element to a string variable, allowing for nulls
    s1 = combinedList[0];
    s2 = combinedList[1];
    s3 = combinedList[2];
    s4 = combinedList[3];
    s5 = combinedList[4];
    s6 = combinedList[5];
    s7 = combinedList[6];
    s8 = combinedList[7];
    s9 = combinedList[8];
    s10 = combinedList[9];
    s11 = combinedList[10];
    s12 = combinedList[11];
    // print(s1);  // Output: 比
    //   print(s2);  // Output: 官

    liunenChange();

    liunenHidenShiShen = getDayunGanShishen(lunarDate.getDayGan(), thisYearGan);
    print('iunenHidenShiShen:$liunenHidenShiShen');
    liunenHidenShiShenZhi1 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), thisYearZhi)[0];
    print('iunenHidenShiShen1:$liunenHidenShiShenZhi1');
    liunenHidenShiShenZhi2 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), thisYearZhi)[1];
    liunenHidenShiShenZhi3 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), thisYearZhi)[2];

    ///month should come after year

    ///

    liuMonthChange(year);
    updateDropDownOptions(year, 2);

    tiangThreeTops = gods.tianganThreeTops(lunarDate.getTimeGan(),
        lunarDate.getDayGan(), lunarDate.getMonthGan(), lunarDate.getYearGan());
    tiangCombines = gods.tianganCombine(lunarDate.getTimeGan(),
        lunarDate.getDayGan(), lunarDate.getMonthGan(), lunarDate.getYearGan());

    tianattk = gods.tianganAttk(lunarDate.getTimeGan(), lunarDate.getDayGan(),
        lunarDate.getMonthGan(), lunarDate.getYearGan());

    combines = combineMultipleLists([tiangCombines, tiangThreeTops, tianattk]);

    diziHalfCom = gods.diziHalfCom(lunarDate.getTimeZhi(),
        lunarDate.getDayZhi(), lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    diziThreeAttck = gods.diziThreeAttcks(lunarDate.getTimeZhi(),
        lunarDate.getDayZhi(), lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    diziTwoAttk = gods.diziTwoAttk(lunarDate.getTimeZhi(),
        lunarDate.getDayZhi(), lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    diziSuppCom = gods.diziSuppCom(lunarDate.getTimeZhi(),
        lunarDate.getDayZhi(), lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    diziCom = gods.diziCom(lunarDate.getTimeZhi(), lunarDate.getDayZhi(),
        lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    diziHidCom = gods.diziHidCom(lunarDate.getTimeZhi(), lunarDate.getDayZhi(),
        lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    diziAttk = gods.diziAttk(lunarDate.getTimeZhi(), lunarDate.getDayZhi(),
        lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    attkOneself = gods.attkOneself(lunarDate.getTimeZhi(),
        lunarDate.getDayZhi(), lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    dizihai = gods.dizihai(lunarDate.getTimeZhi(), lunarDate.getDayZhi(),
        lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    dizibroke = gods.dizibroke(lunarDate.getTimeZhi(), lunarDate.getDayZhi(),
        lunarDate.getMonthZhi(), lunarDate.getYearZhi());

    diziThreeMeets = gods.diziThreeMeets(lunarDate.getTimeZhi(),
        lunarDate.getDayZhi(), lunarDate.getMonthZhi(), lunarDate.getYearZhi());
    combineszhi = combineMultipleLists([
      diziThreeAttck,
      diziTwoAttk,
      diziHalfCom,
      diziSuppCom,
      diziCom,
      diziHidCom,
      diziAttk,
      attkOneself,
      dizihai,
      dizibroke
    ]);

    runAllgodsTime = gods.runAllgodsTime(
        lunarDate.getYearZhi(),
        lunarDate.getDayZhi(),
        lunarDate.getDayGan(),
        lunarDate.getTimeZhi(),
        lunarDate.getTimeGan(),
        lunarDate.getYearGan(),
        lunarDate.getMonthZhi(),
        widget.sex!);
    runAllgodsDay = gods.runAllgodsDay(
        lunarDate.getYearZhi(),
        lunarDate.getDayZhi(),
        lunarDate.getDayGan(),
        lunarDate.getYearGan(),
        lunarDate.getMonthZhi(),
        widget.sex!);
    runAllgodsMonth = gods.runAllgodsMonth(
        lunarDate.getMonthZhi(),
        lunarDate.getDayZhi(),
        lunarDate.getDayGan(),
        lunarDate.getYearZhi(),
        lunarDate.getYearGan(),
        lunarDate.getMonthGan(),
        widget.sex!);

    runAllgodsYear = gods.runAllgodsYear(
        lunarDate.getYearZhi(),
        lunarDate.getMonthZhi(),
        lunarDate.getDayGan(),
        widget.sex!,
        lunarDate.getYearGan(),
        lunarDate.getDayZhi());

    runAllgodsDayun = gods.runAllgodsDayun(
        Dayunbot: daYunHolderZhi,
        daybot: lunarDate.getDayGan(),
        dayunTop: daYunHoldergan,
        yearBot: lunarDate.getYearZhi(),
        yeartop: lunarDate.getYearGan(),
        Subject: lunarDate.getDayGan(),
        sex: widget.sex!,
        monthbot: lunarDate.getMonthZhi());

    runAllgodsLiuyear = gods.runAllgodsLiuyear(
        lunarDate.getYearZhi(),
        lunarDate.getMonthZhi(),
        lunarDate.getDayGan(),
        widget.sex!,
        lunarDate.getYearGan(),
        lunarDate.getDayZhi(),
        thisYearGan,
        thisYearZhi);

    runAllgodsLiuMonth = gods.runAllgodsLiuMonth(
        yearBot: lunarDate.getYearZhi(),
        monthbot: lunarDate.getMonthZhi(),
        Subject: lunarDate.getDayGan(),
        yeartop: lunarDate.getYearGan(),
        daybot: lunarDate.getYearZhi(),
        LiumonthsTop: liuMonthHolder,
        liumonths: liuMonthHolderZhi,
        sex: widget.sex!);

    runAllgodspickDate = gods.runAllgodspickDate(
        yearBot: lunarDate.getYearZhi(),
        monthbot: lunarDate.getMonthZhi(),
        Subject: lunarDate.getDayGan(),
        sex: widget.sex!,
        yeartop: lunarDate.getYearGan(),
        daybot: lunarDate.getDayZhi(),
        pickerDatebot: toDay.getDayGan(),
        pickerDatetop: toDay.getDayZhi());

    print('runallGodstime: $runAllgodsTime');
    print('runallGodsday: $runAllgodsDay');
    print('runallGodsMonth: $runAllgodsMonth');
    print('runallGodsyear: $runAllgodsYear');
  }

  List<String> combineMultipleLists(List<List<String>> lists) {
    return lists.expand((list) => list).toList();
  }

  // 算天干合
  void tianganComs(String input1, String input2, String input3, String input4,
      [String? input5, String? input6, String? input7, String? input8]) {
    // Prepare the list of all inputs including optional ones.
    List<String?> inputs = [
      input1,
      input2,
      input3,
      input4,
      input5,
      input6,
      input7,
      input8
    ];

    // Filter out any null values from the list of inputs before passing them to the methods.
    List<String> filteredInputs = inputs.whereType<String>().toList();

    // Call the methods with the filtered list of inputs.
    List<String> tiangThreeTops = gods.tianganThreeTops(
        filteredInputs[0],
        filteredInputs[1],
        filteredInputs[2],
        filteredInputs[3],
        filteredInputs.length > 4 ? filteredInputs[4] : null,
        filteredInputs.length > 5 ? filteredInputs[5] : null,
        filteredInputs.length > 6 ? filteredInputs[6] : null,
        filteredInputs.length > 7 ? filteredInputs[7] : null);

    List<String> tiangCombines = gods.tianganCombine(
        filteredInputs[0],
        filteredInputs[1],
        filteredInputs[2],
        filteredInputs[3],
        filteredInputs.length > 4 ? filteredInputs[4] : null,
        filteredInputs.length > 5 ? filteredInputs[5] : null,
        filteredInputs.length > 6 ? filteredInputs[6] : null,
        filteredInputs.length > 7 ? filteredInputs[7] : null);

    List<String> tianAttk = gods.tianganAttk(
        filteredInputs[0],
        filteredInputs[1],
        filteredInputs[2],
        filteredInputs[3],
        filteredInputs.length > 4 ? filteredInputs[4] : null,
        filteredInputs.length > 5 ? filteredInputs[5] : null,
        filteredInputs.length > 6 ? filteredInputs[6] : null,
        filteredInputs.length > 7 ? filteredInputs[7] : null);

    // Combine the results into one list.
    combines = combineMultipleLists([tiangThreeTops, tiangCombines, tianAttk]);
    // print('combines: $combines');
  }

  void diziComs(String input1, String input2, String input3, String input4,
      [String? input5, String? input6, String? input7, String? input8]) {
    List<String> diziHalfCom = gods.diziHalfCom(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> diziThreeAttck = gods.diziThreeAttcks(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> diziTwoAttk = gods.diziTwoAttk(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> diziSuppCom = gods.diziSuppCom(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> diziCom = gods.diziCom(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> diziHidCom = gods.diziHidCom(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> diziAttk = gods.diziAttk(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> attkOneself = gods.attkOneself(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> dizihai = gods.dizihai(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> dizibroke = gods.dizibroke(
        input1, input2, input3, input4, input5, input6, input7, input8);
    List<String> diziThreeMeets = gods.diziThreeMeets(
        input1, input2, input3, input4, input5, input6, input7, input8);

    combineszhi = combineMultipleLists([
      diziHalfCom,
      diziThreeAttck,
      diziTwoAttk,
      diziSuppCom,
      diziCom,
      diziHidCom,
      diziAttk,
      attkOneself,
      dizihai,
      dizibroke,
      diziThreeMeets,
    ]);
  }

  // 選日子
  void assignSelectedDate(int year, int month, int day) {
    DateTime dailyforSelection = DateTime(year, month, day);
    lunar.Lunar selectedDate = lunar.Lunar.fromDate(dailyforSelection);
    String selectDayGan = selectedDate.getDayGan();

    selectedDateHoldertop = selectedDate.getDayGan();
    selectedDateHolderbot = selectedDate.getDayZhi();

    print('selectDayGan: $selectDayGan');

    selectedDateshisenHoldTop =
        getDayunGanShishen(lunarDate.getDayGan(), selectedDateHoldertop);
    selectedDateshisenHoldbot =
        getDayunGanShishenZhi(lunarDate.getDayGan(), selectedDateHolderbot)[0];

    dayXingYun =
        LunarUtil.XingYun['${lunarDate.getDayGan()}$selectedDateHolderbot']!;

    dayKongwan =
        LunarUtil.KONGWAN['$selectedDateHoldertop$selectedDateHolderbot']![0];
    dayKongwanzhi =
        LunarUtil.KONGWAN['$selectedDateHoldertop$selectedDateHolderbot']![1];
    selecteddateNaying =
        LunarUtil.NAYIN['$selectedDateHoldertop$selectedDateHolderbot']!;

    runAllgodspickDate = gods.runAllgodspickDate(
        yearBot: lunarDate.getYearZhi(),
        monthbot: lunarDate.getMonthZhi(),
        Subject: lunarDate.getDayGan(),
        sex: widget.sex!,
        yeartop: lunarDate.getYearGan(),
        daybot: lunarDate.getDayZhi(),
        pickerDatebot: selectedDateHolderbot,
        pickerDatetop: selectedDateHoldertop);
    print('runAllgodspickDate:$runAllgodspickDate');
  }

  void liunenChange() {
    // year = firstDayunInt;
    print('year:$year');

    liunenZh1Num = year.toString();
    liunenZhi2Num = (year + 1).toString();
    liunenZhi3Num = (year + 2).toString();
    liunenZhi4Num = (year + 3).toString();
    liunenZhi5Num = (year + 4).toString();
    liunenZhi6Num = (year + 5).toString();
    liunenZhi7Num = (year + 6).toString();
    liunenZhi8Num = (year + 7).toString();
    liunenZhi9Num = (year + 8).toString();
    liunenZhi10Num = (year + 9).toString();

    DateTime thisYear = DateTime(year, 5, 2);
    DateTime year2 = DateTime(year + 1, 5, 2);
    DateTime year3 = DateTime(year + 2, 5, 2);
    DateTime year4 = DateTime(year + 3, 5, 2);
    DateTime year5 = DateTime(year + 4, 5, 2);
    DateTime year6 = DateTime(year + 5, 5, 2);
    DateTime year7 = DateTime(year + 6, 5, 2);
    DateTime year8 = DateTime(year + 7, 5, 2);
    DateTime year9 = DateTime(year + 8, 5, 2);
    DateTime year10 = DateTime(year + 9, 5, 2);

    // first one is the template
    lunar.Lunar liunenBazi = lunar.Lunar.fromDate(thisYear);

    lunar.Lunar liunen1Bazi = lunar.Lunar.fromDate(thisYear);
    lunar.Lunar liunen2Bazi = lunar.Lunar.fromDate(year2);
    lunar.Lunar liunen3Bazi = lunar.Lunar.fromDate(year3);
    lunar.Lunar liunen4Bazi = lunar.Lunar.fromDate(year4);
    lunar.Lunar liunen5Bazi = lunar.Lunar.fromDate(year5);
    lunar.Lunar liunen6Bazi = lunar.Lunar.fromDate(year6);
    lunar.Lunar liunen7Bazi = lunar.Lunar.fromDate(year7);
    lunar.Lunar liunen8Bazi = lunar.Lunar.fromDate(year8);
    lunar.Lunar liunen9Bazi = lunar.Lunar.fromDate(year9);
    lunar.Lunar liunen10Bazi = lunar.Lunar.fromDate(year10);

    // first one is the template
    liuNenEightc = liunenBazi.getEightChar();

    liuNenEightcRow1 = liunen1Bazi.getEightChar();
    liuNenEightcRow2 = liunen2Bazi.getEightChar();
    liuNenEightcRow3 = liunen3Bazi.getEightChar();
    liuNenEightcRow4 = liunen4Bazi.getEightChar();
    liuNenEightcRow5 = liunen5Bazi.getEightChar();
    liuNenEightcRow6 = liunen6Bazi.getEightChar();
    liuNenEightcRow7 = liunen7Bazi.getEightChar();
    liuNenEightcRow8 = liunen8Bazi.getEightChar();
    liuNenEightcRow9 = liunen9Bazi.getEightChar();
    liuNenEightcRow10 = liunen10Bazi.getEightChar();

    // first one is the template
    thisYearGan = liuNenEightc.getYearGan();
    thisYearZhi = liuNenEightc.getYearZhi();

    liunenGanZh1 = liuNenEightcRow1.getYearGan();

    print('liunenGanzh1 : $liunenGanZh1');
    liunenGanZhi2 = liuNenEightcRow2.getYearGan();
    liunenGanZhi3 = liuNenEightcRow3.getYearGan();
    liunenGanZhi4 = liuNenEightcRow4.getYearGan();
    liunenGanZhi5 = liuNenEightcRow5.getYearGan();
    liunenGanZhi6 = liuNenEightcRow6.getYearGan();
    liunenGanZhi7 = liuNenEightcRow7.getYearGan();
    liunenGanZhi8 = liuNenEightcRow8.getYearGan();
    liunenGanZhi9 = liuNenEightcRow9.getYearGan();
    liunenGanZhi10 = liuNenEightcRow10.getYearGan();

    liunenZh1 = liuNenEightcRow1.getYearZhi();
    liunenZhi2 = liuNenEightcRow2.getYearZhi();
    liunenZhi3 = liuNenEightcRow3.getYearZhi();
    liunenZhi4 = liuNenEightcRow4.getYearZhi();
    liunenZhi5 = liuNenEightcRow5.getYearZhi();
    liunenZhi6 = liuNenEightcRow6.getYearZhi();
    liunenZhi7 = liuNenEightcRow7.getYearZhi();
    liunenZhi8 = liuNenEightcRow8.getYearZhi();
    print('this is liunenZhi8$liunenZhi8');
    liunenZhi9 = liuNenEightcRow9.getYearZhi();
    liunenZhi10 = liuNenEightcRow10.getYearZhi();

    // 十什煞
    liunenGanZh1shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZh1);
    liunenGanZh1shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZh1)[0];
    liunenGanZhi2shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi2);
    liunenGanZhi2shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi2)[0];
    liunenGanZhi3shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi3);
    liunenGanZhi3shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi3)[0];
    liunenGanZhi4shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi4);
    liunenGanZhi4shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi4)[0];
    liunenGanZhi5shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi5);
    liunenGanZhi5shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi5)[0];
    liunenGanZhi6shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi6);
    liunenGanZhi6shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi6)[0];
    liunenGanZhi7shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi7);
    liunenGanZhi7shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi7)[0];
    liunenGanZhi8shishenggan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi8);
    liunenGanZhi8shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi8)[0];
    print('this is liunenGanZhi8shishenzhi8$liunenGanZhi8shishenzhi');
    liunenGanZhi9shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi9);
    liunenGanZhi9shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi9)[0];
    liunenGanZhi10shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liunenGanZhi10);
    liunenGanZhi10shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liunenZhi10)[0];
  }

  void liuMonthChange(int year) {
    DateTime dateLiuMonth = DateTime(year, 2, 15);
    lunar.Lunar lunarDateMonth = lunar.Lunar.fromDate(dateLiuMonth);
    liuMonthGan = lunarDateMonth.getMonthGan();

    liuMonthzhi = lunarDateMonth.getMonthZhi();

    print('LiumonthZhi $liuMonthzhi');

    liuMonthZh1shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthHolder);
    liuMonthZh1shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthHolderZhi)[0];

    liuMonthshiShenholdergan = liuMonthZh1shishengan;
    liuMonthshiShenholderzhi = liuMonthZh1shishenzhi;

    ///

    DateTime dateLiuMonth3 = DateTime(year, 3, 15);
    lunar.Lunar lunarDateMonth3 = lunar.Lunar.fromDate(dateLiuMonth3);

    liuMonthGan2 = lunarDateMonth3.getMonthGan();
    liuMonthzhi2 = lunarDateMonth3.getMonthZhi();

    liuMonthZhi2shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan2);
    liuMonthZhi2shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi2)[0];

    ///
    DateTime dateLiuMonth4 = DateTime(year, 4, 15);
    lunar.Lunar lunarDateMonth4 = lunar.Lunar.fromDate(dateLiuMonth4);

    liuMonthGan3 = lunarDateMonth4.getMonthGan();
    liuMonthzhi3 = lunarDateMonth4.getMonthZhi();

    liuMonthZhi3shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan3);
    liuMonthZhi3shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi3)[0];

    ///
    DateTime dateLiuMonth5 = DateTime(year, 5, 15);
    lunar.Lunar lunarDateMonth5 = lunar.Lunar.fromDate(dateLiuMonth5);

    liuMonthGan4 = lunarDateMonth5.getMonthGan();
    liuMonthzhi4 = lunarDateMonth5.getMonthZhi();

    liuMonthZhi4shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan4);
    liuMonthZhi4shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi4)[0];

    ///
    DateTime dateLiuMonth6 = DateTime(year, 6, 15);
    lunar.Lunar lunarDateMonth6 = lunar.Lunar.fromDate(dateLiuMonth6);

    liuMonthGan5 = lunarDateMonth6.getMonthGan();
    liuMonthzhi5 = lunarDateMonth6.getMonthZhi();

    liuMonthZhi5shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan5);
    liuMonthZhi5shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi5)[0];

    ///
    DateTime dateLiuMonth7 = DateTime(year, 7, 15);
    lunar.Lunar lunarDateMonth7 = lunar.Lunar.fromDate(dateLiuMonth7);

    liuMonthGan6 = lunarDateMonth7.getMonthGan();
    liuMonthzhi6 = lunarDateMonth7.getMonthZhi();

    liuMonthZhi6shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan6);
    liuMonthZhi6shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi6)[0];

    ///
    DateTime dateLiuMonth8 = DateTime(year, 8, 15);
    lunar.Lunar lunarDateMonth8 = lunar.Lunar.fromDate(dateLiuMonth8);

    liuMonthGan7 = lunarDateMonth8.getMonthGan();
    liuMonthzhi7 = lunarDateMonth8.getMonthZhi();

    liuMonthZhi7shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan7);
    liuMonthZhi7shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi7)[0];

    ///
    DateTime dateLiuMonth9 = DateTime(year, 9, 15);
    lunar.Lunar lunarDateMonth9 = lunar.Lunar.fromDate(dateLiuMonth9);

    liuMonthGan8 = lunarDateMonth9.getMonthGan();
    liuMonthzhi8 = lunarDateMonth9.getMonthZhi();

    liuMonthZhi8shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan8);
    liuMonthZhi8shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi8)[0];

    ///
    DateTime dateLiuMonth10 = DateTime(year, 10, 15);
    lunar.Lunar lunarDateMonth10 = lunar.Lunar.fromDate(dateLiuMonth10);

    liuMonthGan9 = lunarDateMonth10.getMonthGan();
    liuMonthzhi9 = lunarDateMonth10.getMonthZhi();

    liuMonthZhi9shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan9);
    liuMonthZhi9shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi9)[0];

    ///
    DateTime dateLiuMonth11 = DateTime(year, 11, 15);
    lunar.Lunar lunarDateMonth11 = lunar.Lunar.fromDate(dateLiuMonth11);

    liuMonthGan10 = lunarDateMonth11.getMonthGan();
    liuMonthzhi10 = lunarDateMonth11.getMonthZhi();

    liuMonthZhi10shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan10);
    liuMonthZhi10shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi10)[0];

    ///
    DateTime dateLiuMonth12 = DateTime(year, 12, 15);
    lunar.Lunar lunarDateMonth12 = lunar.Lunar.fromDate(dateLiuMonth12);

    liuMonthGan11 = lunarDateMonth12.getMonthGan();
    liuMonthzhi11 = lunarDateMonth12.getMonthZhi();

    liuMonthZhi11shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan11);
    liuMonthZhi11shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi11)[0];

    ///
    DateTime dateLiuMonth13 = DateTime(year + 1, 1, 15);
    lunar.Lunar lunarDateMonth13 = lunar.Lunar.fromDate(dateLiuMonth13);

    liuMonthGan12 = lunarDateMonth13.getMonthGan();
    liuMonthzhi12 = lunarDateMonth13.getMonthZhi();

    liuMonthZhi12shishengan =
        getDayunGanShishen(lunarDate.getDayGan(), liuMonthGan12);
    liuMonthZhi12shishenzhi =
        getDayunGanShishenZhi(lunarDate.getDayGan(), liuMonthzhi12)[0];
  }

  void dayunShishenChange(String text1, String text2) {
    dayunHidenShiShen = getDayunGanShishen(lunarDate.getDayGan(), text1);
    dayunHidenShiShenZhi1 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), text2)[0];
    dayunHidenShiShenZhi2 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), text2)[1];
    dayunHidenShiShenZhi3 =
        getDayunGanShishenZhi(lunarDate.getDayGan(), text2)[2];
  }

  void yearIncreaseIndex(int tappedCellIndex) {
    switch (tappedCellIndex) {
      case 1:
        print('1 : yearIncreaseIndex');

        break;
      case 2:
        print('2 : yearIncreaseIndex ');
        // Perform any other actions for case 1
        break;

      case 3:
        print('3 : yearIncreaseIndex');
        year = firstDayunInt;

        // Perform any other actions for case 1
        break;
      case 4:
        print('4 : yearIncreaseIndex');
        year = secDayunInt;
        // Perform any other actions for case 1
        break;
      case 5:
        print('5: yearIncreaseIndex ');
        year = thirdDayunInt;
        // Perform any other actions for case 1
        break;
      case 6:
        print('6: yearIncreaseIndex ');
        year = fourthDayunInt;
        // Perform any other actions for case 1
        break;
      case 7:
        print('7: yearIncreaseIndex ');
        year = fifthDayunInt;
        // Perform any other actions for case 1
        break;
      case 8:
        print('8: yearIncreaseIndex ');
        year = sixthDayunInt;
        // Perform any other actions for case 1
        break;
      case 9:
        print('9: yearIncreaseIndex ');
        year = seventhDayunInt;
        // Perform any other actions for case 1
        break;
      case 10:
        print('10: yearIncreaseIndex ');
        year = eighthDayunInt;
        // Perform any other actions for case 1
        break;
      case 11:
        print('11: yearIncreaseIndex ');
        year = ninethDayunInt;
        // Perform any other actions for case 1
        break;
      case 12:
        print('12: yearIncreaseIndex ');
        year = tenthDayunInt;
        // Perform any other actions for case 1
        break;
      default:
        print('6: yearIncreaseIndex');

        // Perform any other actions for default case
        break;
    }
  }

  void xingYunZhiIndex(int tappedCellIndex) {
    switch (tappedCellIndex) {
      case 1:
        print('1 : yearIncreaseIndex');
        xingYunZhiHolder = '丑';
        break;
      case 2:
        print('2 : yearIncreaseIndex ');
        xingYunZhiHolder = '寅';
        break;

      case 3:
        print('3 : yearIncreaseIndex');
        xingYunZhiHolder = '卯';

        // Perform any other actions for case 1
        break;
      case 4:
        print('4 : yearIncreaseIndex');
        xingYunZhiHolder = '辰';
        // Perform any other actions for case 1
        break;
      case 5:
        print('5: yearIncreaseIndex ');
        xingYunZhiHolder = '巳';
        // Perform any other actions for case 1
        break;
      case 6:
        print('6: yearIncreaseIndex ');
        xingYunZhiHolder = '午';
        // Perform any other actions for case 1
        break;
      case 7:
        print('7: yearIncreaseIndex ');
        xingYunZhiHolder = '未';
        // Perform any other actions for case 1
        break;
      case 8:
        print('8: yearIncreaseIndex ');
        xingYunZhiHolder = '申';
        // Perform any other actions for case 1
        break;
      case 9:
        print('9: yearIncreaseIndex ');
        xingYunZhiHolder = '酉';
        // Perform any other actions for case 1
        break;
      case 10:
        print('10: yearIncreaseIndex ');
        xingYunZhiHolder = '戌';
        // Perform any other actions for case 1
        break;
      case 11:
        print('11: yearIncreaseIndex ');
        xingYunZhiHolder = '亥';
        // Perform any other actions for case 1
        break;
      case 12:
        print('12: yearIncreaseIndex ');
        xingYunZhiHolder = '子';
        // Perform any other actions for case 1
        break;
      default:
        print('6: yearIncreaseIndex');

        // Perform any other actions for default case
        break;
    }
  }

  void liuMonthholderChange(int index) {
    if (index == 2) {
      liuMonthHolder = liuMonthGan;
      liuMonthHolderZhi = liuMonthzhi;

      liuMonthshiShenholdergan = liuMonthZh1shishengan;
      liuMonthshiShenholderzhi = liuMonthZh1shishenzhi;
      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    } else if (index == 3) {
      liuMonthHolder = liuMonthGan2;
      liuMonthHolderZhi = liuMonthzhi2;

      liuMonthshiShenholdergan = liuMonthZhi2shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi2shishenzhi;

      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    } else if (index == 4) {
      liuMonthHolder = liuMonthGan3;
      liuMonthHolderZhi = liuMonthzhi3;

      liuMonthshiShenholdergan = liuMonthZhi3shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi3shishenzhi;

      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    } else if (index == 5) {
      liuMonthHolder = liuMonthGan4;
      liuMonthHolderZhi = liuMonthzhi4;

      liuMonthshiShenholdergan = liuMonthZhi4shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi4shishenzhi;
    } else if (index == 6) {
      liuMonthHolder = liuMonthGan5;
      liuMonthHolderZhi = liuMonthzhi5;
      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');

      liuMonthshiShenholdergan = liuMonthZhi5shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi5shishenzhi;
    } else if (index == 7) {
      liuMonthHolder = liuMonthGan6;
      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
      liuMonthHolderZhi = liuMonthzhi6;

      liuMonthshiShenholdergan = liuMonthZhi6shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi6shishenzhi;
    } else if (index == 8) {
      liuMonthHolder = liuMonthGan7;
      liuMonthHolderZhi = liuMonthzhi7;
      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
      liuMonthshiShenholdergan = liuMonthZhi7shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi7shishenzhi;
    } else if (index == 9) {
      liuMonthHolder = liuMonthGan8;
      liuMonthHolderZhi = liuMonthzhi8;
      liuMonthshiShenholdergan = liuMonthZhi8shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi8shishenzhi;

      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    } else if (index == 10) {
      liuMonthHolder = liuMonthGan9;
      liuMonthHolderZhi = liuMonthzhi9;

      liuMonthshiShenholdergan = liuMonthZhi9shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi9shishenzhi;

      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    } else if (index == 11) {
      liuMonthHolder = liuMonthGan10;
      liuMonthHolderZhi = liuMonthzhi10;

      liuMonthshiShenholdergan = liuMonthZhi10shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi10shishenzhi;

      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    } else if (index == 12) {
      liuMonthHolder = liuMonthGan11;
      liuMonthHolderZhi = liuMonthzhi11;

      liuMonthshiShenholdergan = liuMonthZhi11shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi11shishenzhi;

      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    } else if (index == 1) {
      liuMonthHolder = liuMonthGan12;
      liuMonthHolderZhi = liuMonthzhi12;

      liuMonthshiShenholdergan = liuMonthZhi12shishengan;
      liuMonthshiShenholderzhi = liuMonthZhi12shishenzhi;

      print('liuMonthHolder$liuMonthHolder');
      print('liuMonthHolder$liuMonthHolderZhi');
    }
  }

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
      return Color.fromARGB(255, 21, 112, 24);
    } else if (text == '乙') {
      return Color.fromARGB(255, 21, 112, 24);
    } else if (text == '寅') {
      return Color.fromARGB(255, 21, 112, 24);
    } else if (text == '卯') {
      return Color.fromARGB(255, 21, 112, 24);
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

  @override
  Widget build(BuildContext context) {
    if (widget.birthday == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('八字'),
        ),
        body: const Center(
          child: Text('No birthday data available.'),
        ),
      );
    }

    Widget buildCell(String text1, [String? text2]) {
      return GestureDetector(
        onTap: () {
          setState(() {
            daYunHoldergan = text1;
            daYunHolderZhi = text2 ?? '';
            print('build tapped line1: $text1, $text2');
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                text1,
                style: TextStyle(fontSize: 15, color: getColorForText(text1)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                minFontSize: 6, // Adjust this value as needed
              ),
              if (text2 != null)
                AutoSizeText(
                  text2,
                  style: TextStyle(fontSize: 14, color: getColorForText(text2)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  minFontSize: 6, // Adjust this value as needed
                ),
            ],
          ),
        ),
      );
    }

    Widget buildCellStar(String text1, [String? text2]) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              text1,
              style: TextStyle(fontSize: 12, color: getColorForText(text1)),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              minFontSize: 6, // Adjust this value as needed
            ),
            if (text2 != null)
              AutoSizeText(
                text2,
                style: TextStyle(fontSize: 14, color: getColorForText(text2)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                minFontSize: 6, // Adjust this value as needed
              ),
          ],
        ),
      );
    }

    Widget buildCellGods(List<String> texts) {
      return Container(
        width: 150.0, // Fixed width
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey, // Example background color
          borderRadius:
              BorderRadius.circular(8.0), // Optional: add rounded corners
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .start, // Start alignment to stack items vertically
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: texts.map((text) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 2.0), // Adjust vertical padding between texts
              child: AutoSizeText(
                text,
                style: TextStyle(fontSize: 15, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                minFontSize: 6, // Adjust this value as needed
              ),
            );
          }).toList(),
        ),
      );
    }

// Widget buildCellGods(List<String> texts) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 0.0),
//     alignment: Alignment.center,
//     child: Column(
//       // mainAxisAlignment: MainAxisAlignment.center,
//       children: texts.map((text) {
//         return AutoSizeText(
//           text,
//           style: TextStyle(fontSize: 15, color: Colors.white),
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//           minFontSize: 6, // Adjust this value as needed
//         );
//       }).toList(),
//     ),
//   );
// }

// Widget combinedEnergy(List<String> texts) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
//     alignment: Alignment.centerLeft,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: texts.map((text) {
//         return AutoSizeText(
//           text,
//           style: TextStyle(fontSize: 14, color: getColorForText(text)),
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//           minFontSize: 6, // Adjust this value as needed
//         );
//       }).toList(),
//     ),
//   );
// }

    // Widget combinedEnergy(List<String> texts) {
    //   return Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
    //     alignment: Alignment.centerLeft,
    //     child: Wrap(
    //       spacing: 4.0, // Adjust spacing between items
    //       runSpacing: 4.0, // Adjust spacing between lines
    //       children: texts.map((text) {
    //         return AutoSizeText(
    //           text,
    //           style: TextStyle(fontSize: 14, color: getColorForText(text)),
    //           overflow: TextOverflow.ellipsis,
    //           maxLines: 1,
    //           minFontSize: 6, // Adjust this value as needed
    //         );
    //       }).toList(),
    //     ),
    //   );
    // }
    Widget combinedEnergy(List<String> texts) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 4.0, // Adjust spacing between items
          runSpacing: 4.0, // Adjust spacing between lines
          children: texts.map((text) {
            return Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    0.8, // Adjust width as needed
              ),
              child: AutoSizeText(
                text,
                style: TextStyle(fontSize: 14, color: getColorForText(text)),
                overflow: TextOverflow.visible, // Allow text to wrap
                maxLines: null, // Allow unlimited lines for wrapping
                minFontSize: 6, // Adjust this value as needed
              ),
            );
          }).toList(),
        ),
      );
    }

    Widget buildDropdownCell() {
      return Container(
        padding: const EdgeInsets.all(4.0),
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 50, // Adjust the width as needed
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded:
                true, // Ensures the dropdown takes the width of its container
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
                assignSelectedDate(
                    selectedYear, colorIndexMonth, int.parse(selectedValue));
              });
            },
            items:
                dropDownOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 8), // Adjust the font size as needed
                ),
              );
            }).toList(),
            icon: Icon(
              Icons.arrow_drop_down,
              size: 0, // Set icon size to 0
            ),
          ),
        ),
      );
    }

    TableRow buildRow(List<Widget> cells) {
      return TableRow(
        children: cells.map((cell) {
          return GestureDetector(
            onTap: () {
              print('build Row tapped!');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 2.0), // Adjust this value
              color: Colors.transparent, // Ensure cell is visible
              child: cell,
            ),
          );
        }).toList(),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
      );
    }

// TableRow buildRow(List<Widget> cells) {
//   return TableRow(
//     children: cells.map((cell) {
//       return GestureDetector(
//         onTap: () {

//           print('build Row tapped!');
//         },
//         child: Container(
//           color: Colors.transparent, // Ensure cell is visible
//           child: cell,
//         ),
//       );
//     }).toList(),
//     decoration: const BoxDecoration(
//       border: Border(
//         bottom: BorderSide(color: Colors.black),
//       ),
//     ),
//   );
// }
// TableRow buildCRow(List<Widget> cells) {
//   return TableRow(
//     children: cells.map((cell) {
//       return GestureDetector(
//         onTap: () {
//           print('Combined Row tapped!');
//         },
//         child: Container(
//           color: Color.fromARGB(0, 26, 121, 158), // Ensure cell is visible
//           child: Align(
//             alignment: Alignment.centerLeft, // Aligns the cell content to the left
//             child: cell,
//           ),
//         ),
//       );
//     }).toList(),
//     decoration: const BoxDecoration(
//       border: Border(
//         bottom: BorderSide(color: Colors.black),
//       ),
//     ),
//   );
// }

    TableRow buildRowGods(List<Widget> cells) {
      return TableRow(
        children: cells.map((cell) {
          return GestureDetector(
            onTap: () {
              print('build Row tapped!');
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
              color: Colors.transparent, // Ensure cell is visible
              child: cell,
            ),
          );
        }).toList(),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
      );
    }

    TableRow buildRowYears(List<Widget> cells) {
      return TableRow(
        children: cells.map((cell) {
          return GestureDetector(
            onTap: () {
              print('build Row year tapped!');
            },
            child: Container(
              // color: Color.fromARGB(143, 255, 255, 255), // Ensure cell is visible
              child: cell,
            ),
          );
        }).toList(),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color.fromARGB(143, 0, 0, 0)),
          ),
        ),
      );
    }

    Widget buildCellYears(String text1, int index, [String? text2]) {
      return GestureDetector(
        onTap: () {
          setState(() {
            tappedCellIndex = index;
            daYunHoldergan = text1;
            daYunHolderZhi = text2 ?? '';

            dayunXingYun =
                LunarUtil.XingYun['${lunarDate.getDayGan()}$daYunHolderZhi']!;
            daYunKongWan =
                LunarUtil.KONGWAN['$daYunHoldergan$daYunHolderZhi']![0];
            daYunKongWanZhi =
                LunarUtil.KONGWAN['$daYunHoldergan$daYunHolderZhi']![1];

            yearIncreaseIndex(index);
            dayunShishenChange(text1, text2!);

            tianganComs(
                lunarDate.getTimeGan(),
                lunarDate.getDayGan(),
                lunarDate.getMonthGan(),
                lunarDate.getYearGan(),
                daYunHoldergan);
            diziComs(
                lunarDate.getTimeZhi(),
                lunarDate.getDayZhi(),
                lunarDate.getMonthZhi(),
                lunarDate.getYearZhi(),
                daYunHolderZhi);
            runAllgodsDayun = gods.runAllgodsDayun(
                Dayunbot: daYunHolderZhi,
                daybot: lunarDate.getDayGan(),
                dayunTop: daYunHoldergan,
                yearBot: lunarDate.getYearZhi(),
                yeartop: lunarDate.getYearGan(),
                Subject: lunarDate.getDayGan(),
                sex: widget.sex!,
                monthbot: lunarDate.getMonthZhi());

            liunenChange();
            // reset year
            colorIndexDayun = index;
            print('buildcekk yearstapped line1: $text1, $text2');
          });
        },
        child: Container(
          color: colorIndexDayun == index
              ? Color.fromARGB(255, 30, 190, 57)
                  .withOpacity(0.4) // Highlight selected cell with 0.3 opacity
              : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AutoSizeText(
                  text1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: getColorForText(text1)),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  minFontSize: 8,
                ),
              ),
              if (text2 != null)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AutoSizeText(
                    text2,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: getColorForText(text2)),
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    minFontSize: 8,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    Widget buildCellYearsTitle(String text1, int index, [String? text2]) {
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AutoSizeText(
                  text1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: getColorForText(text1)),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  minFontSize: 8,
                ),
              ),
              if (text2 != null)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AutoSizeText(
                    text2,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: getColorForText(text2)),
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    minFontSize: 8,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    Widget buildCellYears2(String text1, int index, [String? text2]) {
      return GestureDetector(
        onTap: () {
          setState(() {
            // tappedCellIndex = index;

            // this code must be above thisYearGan and thisYearZhi
            liunenChange();

            // thisYearGan and thisYearZhi both codes must live under liunenChange()
            thisYearGan = text1;
            thisYearZhi = text2!;
            liunenXingYun =
                LunarUtil.XingYun['${lunarDate.getDayGan()}$thisYearZhi']!;

            liunenKongWan = LunarUtil.KONGWAN['$thisYearGan$thisYearZhi']![0];
            liunenKongWanZhi =
                LunarUtil.KONGWAN['$thisYearGan$thisYearZhi']![1];
            liunenNaying = LunarUtil.NAYIN['$thisYearGan$thisYearZhi']![0];

            liunenHidenShiShen =
                getDayunGanShishen(lunarDate.getDayGan(), thisYearGan);
            print('iunenHidenShiShen:$liunenHidenShiShen');
            liunenHidenShiShenZhi1 =
                getDayunGanShishenZhi(lunarDate.getDayGan(), thisYearZhi)[0];
            print('iunenHidenShiShen1:$liunenHidenShiShenZhi1');
            liunenHidenShiShenZhi2 =
                getDayunGanShishenZhi(lunarDate.getDayGan(), thisYearZhi)[1];
            liunenHidenShiShenZhi3 =
                getDayunGanShishenZhi(lunarDate.getDayGan(), thisYearZhi)[2];

            List<int> liunenZhiNumsFormonth = [
              year,
              year + 1,
              year + 2,
              year + 3,
              year + 4,
              year + 5,
              year + 6,
              year + 7,
              year + 8,
              year + 9,
            ];
            liuMonthChange(liunenZhiNumsFormonth[index]);
            colorIndexYear = index;

            // reset year 月干月支用 for buildLongCell
            selectedYear = 0;
            selectedYear = year + index;

            runAllgodsLiuyear = gods.runAllgodsLiuyear(
                lunarDate.getYearZhi(),
                lunarDate.getMonthZhi(),
                lunarDate.getDayGan(),
                widget.sex!,
                lunarDate.getYearGan(),
                lunarDate.getDayZhi(),
                thisYearGan,
                thisYearZhi);

            tianganComs(
                lunarDate.getTimeGan(),
                lunarDate.getDayGan(),
                lunarDate.getMonthGan(),
                lunarDate.getYearGan(),
                daYunHoldergan,
                thisYearGan);
            diziComs(
                lunarDate.getTimeZhi(),
                lunarDate.getDayZhi(),
                lunarDate.getMonthZhi(),
                lunarDate.getYearZhi(),
                daYunHolderZhi,
                thisYearZhi);

            print('buildcekk yearstapped line1: $text1, $text2');
          });
        },
        child: Container(
          color: colorIndexYear == index
              ? Colors.blue
                  .withOpacity(0.3) // Highlight selected cell with 0.3 opacity
              : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AutoSizeText(
                  text1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: getColorForText(text1)),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  minFontSize: 8,
                ),
              ),
              if (text2 != null)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AutoSizeText(
                    text2,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: getColorForText(text2)),
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    minFontSize: 8,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    Widget buildCellYearsnum(String text1) {
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.1, vertical: 1.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                text1,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                // Maximum font size
                overflow: TextOverflow.visible,
                maxLines: 1,
                minFontSize: 6, // Minimum font size
                //  textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    Widget CellYearsgaps({double width = 0.5, double height = 0.0}) {
      return SizedBox(
        width: width,
        height: height,
      );
    }

    Widget buildCellYearsShiShen(String text1, int index, [String? text2]) {
      return GestureDetector(
        onTap: () {
          setState(() {
            tappedCellIndex = index;

            print('buildcekk yearstapped line1: $text1, $text2');
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 8.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AutoSizeText(
                  text1,
                  style: const TextStyle(fontSize: 10),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  minFontSize: 8,
                ),
              ),
              if (text2 != null) const SizedBox(height: 0.1),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AutoSizeText(
                  text2 ?? '',
                  style: const TextStyle(fontSize: 10),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  minFontSize: 5,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Custom cell widget for complex string layout
    Widget buildCustomCell(String mainText, List<String> sideTexts) {
      final screenHeight = MediaQuery.of(context).size.height;
      if (screenHeight < 790) {
        textfont = 16;
        // pizel 5 6inch Screen Height: 802.9090909090909
      } else if (screenHeight < 830) {
        textfont = 16;
      } else if (screenHeight < 870) {
        textfont = 17;
      } else if (screenHeight < 950) {
        textfont = 20;
      } else {
        textfont = 20;
      }
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(width: 2.0),
            Flexible(
              flex: 4,
              child: Text(
                mainText,
                style: TextStyle(
                    fontSize: textfont,
                    color: getColorForText(mainText),
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: sideTexts.map((text) {
                  return Text(
                    text,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    List<TableRow> titletableRows = [
      buildRow([
        buildCell('日期'),
        buildCell('時柱'),
        buildCell('日柱'),
        buildCell('月柱'),
        buildCell('年柱'),
        buildCell('大運'),
        buildCell('流年'),
        buildCell('流月'),
        buildDropdownCell(),
      ]),
    ];

    List<TableRow> tableRows = [
      buildRow([
        buildCell(''),
        buildCell('$age歲'),
        buildCell(''),
        buildCell(''),
        buildCell(''),
        buildCell(''),
        buildCell(''),
        buildCell(''),
        buildCell(''),
      ]),
    ];
    List<TableRow> tableRowstiandi = [
      buildRow([
        buildCell('天干'),
        buildCustomCell(lunarDate.getTimeGan(), [tianShiShenTime]),
        buildCustomCell(lunarDate.getDayGan(), [sexString]),
        buildCustomCell(lunarDate.getMonthGan(), [tianShiShenMonth]),
        buildCustomCell(lunarDate.getYearGan(), [tianShiShenYear]),
        buildCustomCell(daYunHoldergan, [dayunHidenShiShen]),
        buildCustomCell(thisYearGan, [liunenHidenShiShen]),
        buildCustomCell(liuMonthHolder, [liuMonthshiShenholdergan]),
        buildCustomCell(selectedDateHoldertop, [selectedDateshisenHoldTop]),
      ]),
    ];

    List<TableRow> tableRowsbot = [
      buildRow([
        buildCell('地支'),
        buildCustomCell(
            lunarDate.getTimeZhi(), [s10 ?? '', s11 ?? '', s12 ?? '']),
        buildCustomCell(lunarDate.getDayZhi(), [s7 ?? '', s8 ?? '', s9 ?? '']),
        buildCustomCell(
            lunarDate.getMonthZhi(), [s4 ?? '', s5 ?? '', s6 ?? '']),
        buildCustomCell(lunarDate.getYearZhi(), [s1 ?? '', s2 ?? '', s3 ?? '']),
        buildCustomCell(daYunHolderZhi, [
          dayunHidenShiShenZhi1,
          dayunHidenShiShenZhi2,
          dayunHidenShiShenZhi3
        ]),
        buildCustomCell(thisYearZhi, [
          liunenHidenShiShenZhi1,
          liunenHidenShiShenZhi2,
          liunenHidenShiShenZhi3
        ]),
        buildCustomCell(liuMonthHolderZhi, [liuMonthshiShenholderzhi]),
        buildCustomCell(selectedDateHolderbot, [selectedDateshisenHoldbot]),
      ]),
    ];

    Widget buildLongCell(String text1, int index, [List<String>? sideTexts]) {
      return GestureDetector(
        onTap: () {
          setState(() {
            //  liuMonthHolder = text1;
            //    liuMonthHolderZhi = sideTexts![0];

            liuMonthholderChange(index);
            colorIndexMonth = index;

            updateDropDownOptions(selectedYear, index);

            // 星運用

            xingYunZhiIndex(index);
            monthXingYun =
                LunarUtil.XingYun['${lunarDate.getDayGan()}$xingYunZhiHolder']!;
            thisMonntKongwan =
                LunarUtil.KONGWAN['$liuMonthHolder$liuMonthHolderZhi']![0];
            thisMonntKongwanzhi =
                LunarUtil.KONGWAN['$liuMonthHolder$liuMonthHolderZhi']![1];
            MonthNayingHold =
                LunarUtil.NAYIN['$liuMonthHolder$liuMonthHolderZhi']!;

            tianganComs(
                lunarDate.getTimeGan(),
                lunarDate.getDayGan(),
                lunarDate.getMonthGan(),
                lunarDate.getYearGan(),
                daYunHoldergan,
                thisYearGan,
                liuMonthHolder);
            diziComs(
                lunarDate.getTimeZhi(),
                lunarDate.getDayZhi(),
                lunarDate.getMonthZhi(),
                lunarDate.getYearZhi(),
                daYunHolderZhi,
                thisYearZhi,
                liuMonthHolderZhi);

            runAllgodsLiuMonth = gods.runAllgodsLiuMonth(
                yearBot: lunarDate.getYearZhi(),
                monthbot: lunarDate.getMonthZhi(),
                Subject: lunarDate.getDayGan(),
                yeartop: lunarDate.getYearGan(),
                daybot: lunarDate.getDayZhi(),
                LiumonthsTop: liuMonthHolder,
                liumonths: liuMonthHolderZhi,
                sex: widget.sex!);
            print('Tapped cell at index $index');
          });
        },
        child: Container(
          color: colorIndexMonth == index
              ? Colors.blue
                  .withOpacity(0.3) // Highlight selected cell with 0.3 opacity
              : Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
          alignment: Alignment.center,
          constraints:
              const BoxConstraints(minWidth: 30.0), // Adjust minWidth as needed
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Text(
                  text1,
                  style: TextStyle(fontSize: 14, color: getColorForText(text1)),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 4),
                if (sideTexts != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: sideTexts.map((text) {
                      return Text(
                        text,
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildLongCellzhi(String text1, int index,
        [List<String>? sideTexts]) {
      return GestureDetector(
        onTap: () {
          liuMonthHolder = text1;
          liuMonthHolderZhi = sideTexts![0];
          colorIndexDayun = index;
          // liuMonthshiShenholdergan;
          // liuMonthshiShenholderzhi = sideTexts![0];
          print('Tapped cell at index $index');
        },
        child: Container(
          color: colorIndexDayun == index
              ? Colors.blue
                  .withOpacity(0.3) // Highlight selected cell with 0.3 opacity
              : Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
          alignment: Alignment.center,
          constraints:
              const BoxConstraints(minWidth: 30.0), // Adjust minWidth as needed
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Text(
                  text1,
                  style: TextStyle(fontSize: 14, color: getColorForText(text1)),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 4),
                if (sideTexts != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: sideTexts.map((text) {
                      return Text(
                        text,
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    TableRow buildLongRow(List<Widget> cells) {
      return TableRow(
        children: cells
            .asMap()
            .map((index, cell) {
              return MapEntry(
                index,
                GestureDetector(
                  onTap: () {
                    print('Combined Row tapped!');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.0), // Remove vertical padding
                    color: Color.fromARGB(
                        0, 26, 121, 158), // Ensure cell is visible
                    child: Align(
                      alignment: Alignment
                          .centerLeft, // Aligns the cell content to the left
                      child: cell,
                    ),
                  ),
                ),
              );
            })
            .values
            .toList(),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black), // Border at the bottom
          ),
        ),
      );
    }

    TableRow buildLongRowNnoBorder(List<Widget> cells) {
      return TableRow(
        children: cells
            .asMap()
            .map((index, cell) {
              return MapEntry(
                index,
                GestureDetector(
                  onTap: () {
                    print('Combined Row tapped!');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.0), // Remove vertical padding
                    color: Color.fromARGB(
                        0, 26, 121, 158), // Ensure cell is visible
                    child: Align(
                      alignment: Alignment
                          .centerLeft, // Aligns the cell content to the left
                      child: cell,
                    ),
                  ),
                ),
              );
            })
            .values
            .toList(),
      );
    }

    // TableRow buildLongRow(List<Widget> cells) {
    //   return TableRow(
    //     children: cells
    //         .asMap()
    //         .map((index, cell) {
    //           return MapEntry(
    //             index,
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 left: index == 0
    //                     ? 8.0
    //                     : 0.0, // Add padding to the left side of the first cell
    //                 right: index == cells.length - 1
    //                     ? 8.0
    //                     : 0.0, // Add padding to the right side of the last cell
    //               ),
    //               child: GestureDetector(
    //                 onTap: () {
    //                   print('Combined Row tapped!');
    //                 },
    //                 child: Container(
    //                   color: Color.fromARGB(
    //                       0, 26, 121, 158), // Ensure cell is visible
    //                   child: Align(
    //                     alignment: Alignment
    //                         .centerLeft, // Aligns the cell content to the left
    //                     child: cell,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         })
    //         .values
    //         .toList(),
    //     decoration: const BoxDecoration(
    //       border: Border(
    //         bottom: BorderSide(color: Colors.black),
    //       ),
    //     ),
    //   );
    // }

    // TableRow buildLongRowNnoBorder(List<Widget> cells) {
    //   return TableRow(
    //     children: cells
    //         .asMap()
    //         .map((index, cell) {
    //           return MapEntry(
    //             index,
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 left: index == 0
    //                     ? 8.0
    //                     : 0.0, // Add padding to the left side of the first cell
    //                 right: index == cells.length - 1
    //                     ? 8.0
    //                     : 0.0, // Add padding to the right side of the last cell
    //               ),
    //               child: GestureDetector(
    //                 onTap: () {
    //                   print('Combined Row tapped!');
    //                 },
    //                 child: Container(
    //                   color: Color.fromARGB(
    //                       0, 26, 121, 158), // Ensure cell is visible
    //                   child: Align(
    //                     alignment: Alignment
    //                         .centerLeft, // Aligns the cell content to the left
    //                     child: cell,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         })
    //         .values
    //         .toList(),
    //   );
    // }

    List<TableRow> longTableRows = [
      buildLongRowNnoBorder([
        Text('月干'),
        buildLongCell(liuMonthGan, 2, [liuMonthZh1shishengan]),
        buildLongCell(liuMonthGan2, 3, [liuMonthZhi2shishengan]),
        buildLongCell(liuMonthGan3, 4, [liuMonthZhi3shishengan]),
        buildLongCell(liuMonthGan4, 5, [liuMonthZhi4shishenzhi]),
        buildLongCell(liuMonthGan5, 6, [liuMonthZhi5shishengan]),
        buildLongCell(liuMonthGan6, 7, [liuMonthZhi6shishengan]),
        buildLongCell(liuMonthGan7, 8, [liuMonthZhi7shishengan]),
        buildLongCell(liuMonthGan8, 9, [liuMonthZhi8shishengan]),
        buildLongCell(liuMonthGan9, 10, [liuMonthZhi9shishengan]),
        buildLongCell(liuMonthGan10, 11, [liuMonthZhi10shishengan]),
        buildLongCell(liuMonthGan11, 12, [liuMonthZhi11shishengan]),
        buildLongCell(liuMonthGan12, 1, [liuMonthZhi12shishengan]),
      ]),
      buildLongRow([
        Text('月支'),
        buildLongCell('寅', 2, [liuMonthZh1shishenzhi]),
        buildLongCell('卯', 3, [liuMonthZhi2shishenzhi]),
        buildLongCell('辰', 4, [liuMonthZhi3shishenzhi]),
        buildLongCell('巳', 5, [liuMonthZhi4shishenzhi]),
        buildLongCell('午', 6, [liuMonthZhi5shishenzhi]),
        buildLongCell('未', 7, [liuMonthZhi6shishenzhi]),
        buildLongCell('申', 8, [liuMonthZhi7shishenzhi]),
        buildLongCell('酉', 9, [liuMonthZhi8shishenzhi]),
        buildLongCell('戌', 10, [liuMonthZhi9shishenzhi]),
        buildLongCell('亥', 11, [liuMonthZhi10shishenzhi]),
        buildLongCell('子', 12, [liuMonthZhi11shishenzhi]),
        buildLongCell('丑', 1, [liuMonthZhi12shishenzhi]),
      ]),
    ];
    // ignore: non_constant_identifier_names
    List<TableRow> StarsRows = [
      buildRow([
        buildCellStar('星運'),
        buildCellStar(XingYunTime),
        buildCellStar(XingYunDay),
        buildCellStar(XingYunMonth),
        buildCellStar(XingYunYear),
        buildCellStar(dayunXingYun),
        buildCellStar(liunenXingYun),
        buildCellStar(monthXingYun),
        buildCellStar(dayXingYun),
      ]),
    ];
    List<TableRow> StarsRows2 = [
      buildRow([
        buildCellStar('空亡'),
        buildCellStar(kongWanTime, kongWanTime2),
        buildCellStar(kongWanDay, kongWanDay2),
        buildCellStar(kongWanMonth, kongWanMonth2),
        buildCellStar(kongWanYear, kongWanYear2),
        buildCellStar(daYunKongWan, daYunKongWanZhi),
        buildCellStar(liunenKongWan, liunenKongWanZhi),
        buildCellStar(thisMonntKongwan, thisMonntKongwanzhi),
        buildCellStar(dayKongwan, dayKongwanzhi),
      ]),
    ];
    List<TableRow> StarsRows3 = [
      buildRow([
        buildCellStar('納音'),
        buildCellStar(naYingTime),
        buildCellStar(naYingDay),
        buildCellStar(naYingMonth),
        buildCellStar(naYingYear),
        buildCellStar(dayunNaying),
        buildCellStar(liunenNaying),
        buildCellStar(MonthNayingHold),
        buildCellStar(selecteddateNaying),
      ]),
    ];

    List<TableRow> yearRows = [
      buildRowYears([
        // buildCellYearsnum(''),
        // buildCellYearsnum(''),
        // buildCellYearsnum(''),
        // buildCellYearsnum(''),
        CellYearsgaps(),
        CellYearsgaps(),
        CellYearsgaps(),
        CellYearsgaps(),

        buildCellYearsnum(dayunNum),

        CellYearsgaps(),
        buildCellYearsnum(dayunNum2),
        CellYearsgaps(),
        buildCellYearsnum(dayunNum3),
        CellYearsgaps(),
        buildCellYearsnum(dayunNum4),
        CellYearsgaps(),
        buildCellYearsnum(dayunNum5),
        CellYearsgaps(),
        buildCellYearsnum(dayunNum6),
        CellYearsgaps(),
        buildCellYearsnum(dayunNum7),
        CellYearsgaps(),
        buildCellYearsnum(dayunNum8),
        CellYearsgaps(),
        buildCellYearsnum(dayunNum9),
        CellYearsgaps(),
      ]),
      buildRowYears([
        buildCellYearsTitle('大', 1),
        buildCellYearsTitle('運', 0),
        buildCellYearsTitle('', 0),
        buildCellYearsTitle('', 0),
        buildCellYears(daYunGanZh1[0], 3, daYunGanZh1[1]),
        buildCellYearsShiShen(dayun10shenpGan1, 0, dayun10shenpZhi1),
        buildCellYears(daYunGanZhi2[0], 4, daYunGanZhi2[1]),
        buildCellYearsShiShen(dayun10shenpGan2, 0, dayun10shenpZhi2),
        buildCellYears(daYunGanZhi3[0], 5, daYunGanZhi3[1]),
        buildCellYearsShiShen(dayun10shenpGan3, 0, dayun10shenpZhi3),
        buildCellYears(daYunGanZhi4[0], 6, daYunGanZhi4[1]),
        buildCellYearsShiShen(dayun10shenpGan4, 0, dayun10shenpZhi4),
        buildCellYears(daYunGanZhi5[0], 7, daYunGanZhi5[1]),
        buildCellYearsShiShen(dayun10shenpGan5, 0, dayun10shenpZhi5),
        buildCellYears(daYunGanZhi6[0], 8, daYunGanZhi6[1]),
        buildCellYearsShiShen(dayun10shenpGan6, 0, dayun10shenpZhi6),
        buildCellYears(daYunGanZhi7[0], 9, daYunGanZhi7[1]),
        buildCellYearsShiShen(dayun10shenpGan7, 0, dayun10shenpZhi7),
        buildCellYears(daYunGanZhi8[0], 10, daYunGanZhi8[1]),
        buildCellYearsShiShen(dayun10shenpGan8, 0, dayun10shenpZhi8),
        buildCellYears(daYunGanZhi9[0], 11, daYunGanZhi9[1]),
        buildCellYearsShiShen(dayun10shenpGan9, 0, dayun10shenpZhi9),
      ]),
    ];

    List<TableRow> yearRows2 = [
      buildRowYears([
        CellYearsgaps(),
        CellYearsgaps(),
        buildCellYearsnum(liunenZh1Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi2Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi3Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi4Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi5Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi6Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi7Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi8Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi9Num),
        CellYearsgaps(),
        buildCellYearsnum(liunenZhi10Num),
        CellYearsgaps(),
      ]),
    ];

    List<TableRow> yearRows3 = [
      buildRowYears([
        buildCellYearsTitle('流', 1),
        buildCellYearsTitle('年', 0),
        buildCellYears2(liunenGanZh1, 0, liunenZh1),
        buildCellYearsShiShen(
            liunenGanZh1shishengan, 0, liunenGanZh1shishenzhi),
        buildCellYears2(liunenGanZhi2, 1, liunenZhi2),
        buildCellYearsShiShen(
            liunenGanZhi2shishengan, 0, liunenGanZhi2shishenzhi),
        buildCellYears2(liunenGanZhi3, 2, liunenZhi3),
        buildCellYearsShiShen(
            liunenGanZhi3shishengan, 0, liunenGanZhi3shishenzhi),
        buildCellYears2(liunenGanZhi4, 3, liunenZhi4),
        buildCellYearsShiShen(
            liunenGanZhi4shishengan, 0, liunenGanZhi4shishenzhi),
        buildCellYears2(liunenGanZhi5, 4, liunenZhi5),
        buildCellYearsShiShen(
            liunenGanZhi5shishengan, 0, liunenGanZhi5shishenzhi),
        buildCellYears2(liunenGanZhi6, 5, liunenZhi6),
        buildCellYearsShiShen(
            liunenGanZhi6shishengan, 0, liunenGanZhi6shishenzhi),
        buildCellYears2(liunenGanZhi7, 6, liunenZhi7),
        buildCellYearsShiShen(
            liunenGanZhi7shishengan, 0, liunenGanZhi7shishenzhi),
        buildCellYears2(liunenGanZhi8, 7, liunenZhi8),
        buildCellYearsShiShen(
            liunenGanZhi8shishenggan, 0, liunenGanZhi8shishenzhi),
        buildCellYears2(liunenGanZhi9, 8, liunenZhi9),
        buildCellYearsShiShen(
            liunenGanZhi9shishengan, 0, liunenGanZhi9shishenzhi),
        buildCellYears2(liunenGanZhi10, 9, liunenZhi10),
        buildCellYearsShiShen(
            liunenGanZhi10shishengan, 0, liunenGanZhi10shishenzhi),
      ]),
    ];

    List<TableRow> CombinedRows = [
      TableRow(
        children: [
          Column(
            children: [
              combinedEnergy(['天干合: $combines']),
              combinedEnergy(['地支合: $combineszhi']),
            ],
          ),
        ],
      ),
    ];

    List<TableRow> godsRowGods = [
      buildRowGods([
        buildCellYearsTitle(' 神煞:   ', 0),

        buildCellGods(runAllgodsTime),
        // Adjust width as needed
        buildCellGods(runAllgodsDay),

        buildCellGods(runAllgodsMonth),

        buildCellGods(runAllgodsYear),

        buildCellGods(runAllgodsDayun),

        buildCellGods(runAllgodsLiuyear),

        buildCellGods(runAllgodsLiuMonth),

        buildCellGods(runAllgodspickDate),
      ]),
    ];
    // return Scaffold(
    //   backgroundColor: Color.fromARGB(255, 115, 180, 255),
    //   appBar: AppBar(
    //     title: const Text('八字'),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),

    //       child: Column(
    //         children: [
    //           Table(
    //             // border: TableBorder.all(color: Colors.black),

    //             children: tableRows,

    //           ),

    //           const SizedBox(height: 3),
    //           Divider(),
    //           Table(
    //             // border: TableBorder.all(color: Colors.black),
    //             children: longTableRows,
    //           ),
    //            Divider(),
    //           Table(
    //             // border: TableBorder.all(color: Colors.black),
    //             children: StarsRows,
    //           ),
    //           //  Divider(),
    //           Table(

    //             children: yearRows,

    //           ),

    //           Table(

    //             children: CombinedRows,

    //           ),

    //         ],

    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 115, 180, 255),
        title: const Text('八字'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(
                    255, 115, 180, 255), // Background color for the table
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: titletableRows,
                ),
              ),
              Container(
                color: Color.fromARGB(255, 115, 180, 255),
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: tableRows,
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: tableRowstiandi,
                ),
              ),
              Container(
                color: Color.fromARGB(
                    255, 115, 180, 255), // Background color for the table
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: tableRowsbot,
                ),
              ),

              const SizedBox(height: 0.1),
              // Divider(),
              Container(
                color: Colors.white, // Background color for the table
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: longTableRows,
                ),
              ),
              // Divider(),
              Container(
                color: Colors.white, // Background color for the table
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: StarsRows,
                ),
              ),
              Container(
                color: Color.fromARGB(
                    255, 115, 180, 255), // Background color for the table
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: StarsRows2,
                ),
              ),
              Container(
                color: Colors.white, // Background color for the table
                child: Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: StarsRows3,
                ),
              ),
              Container(
                color: Color.fromARGB(255, 115, 180, 255),
                child: Table(
                  children: yearRows,
                ),
              ),
              Container(
                color: Colors.white, // Background color for the table
                child: Table(
                  children: yearRows2,
                ),
              ),
              Container(
                color: Colors.white, // Background color for the table
                child: Table(
                  children: yearRows3,
                ),
              ),
              Container(
                color: Colors.white, // Background color for the table
                child: Table(
                  children: CombinedRows,
                ),
              ),
              Container(
                color: Color.fromARGB(
                    255, 115, 180, 255), // Background color for the table
                child: Table(
                  children: godsRowGods,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
