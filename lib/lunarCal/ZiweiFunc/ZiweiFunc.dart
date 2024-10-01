import 'package:learn1/calendar/Solar.dart';
import 'package:learn1/calendar/util/LunarUtil.dart';
import 'package:learn1/calendar/Lunar.dart' as lunar;

class ZiweiFunc {
  static List<String> getDayunGanShishenZhi(String first, String second) {
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

  static String getDayunGanShishen(String getDayGan, String dayun) {
    String key = '$getDayGan$dayun';
    return LunarUtil.SHI_SHEN[key] ?? '??';
  }

// https://chanloklun.blogspot.com/2009/09/blog-post.html
  static const List<String> ziweiMap = [
    '紫薇',
    '天機',
    '',
    '太陽',
    '武曲',
    '天同',
    '',
    '',
    '廉貞'
  ];
  static const List<String> tianfuMap = [
    '天府',
    '太陰',
    '貪狼',
    '巨門',
    '天相',
    '天梁',
    '七殺',
    '',
    '',
    '',
    '破軍'
  ];

  static const List<String> GAN_5 = [
    '己',
    '庚',
    '辛',
    '壬',
    '癸',
    '甲',
    '乙',
    '丙',
    '丁',
    '戊'
  ];

  static const Map<String, int> zhiMap = {
    '寅': 1,
    '卯': 2,
    '辰': 3,
    '巳': 4,
    '午': 5,
    '未': 6,
    '申': 7,
    '酉': 8,
    '戌': 9,
    '亥': 10,
    '子': 11,
    '丑': 12,
  };

  static const Map<String, int> fziMap = {
    '寅': 3,
    '卯': 4,
    '辰': 5,
    '巳': 6,
    '午': 7,
    '未': 8,
    '申': 9,
    '酉': 10,
    '戌': 11,
    '亥': 12,
    '子': 1,
    '丑': 2,
  };

  static const List<String> zhiList = [
    '寅',
    '卯',
    '辰',
    '巳',
    '午',
    '未',
    '申',
    '酉',
    '戌',
    '亥',
    '子',
    '丑',
  ];

  static List<String> runFiveTiger(String input) {
    List<String> result = [];

    // Get the result of the fivetiger function
    String tigerResult = fivetiger(input);

    // Find the index of the result in GAN_5
    int ganIndex = GAN_5.indexOf(tigerResult);

    // If the result is found in GAN_5, proceed
    if (ganIndex != -1) {
      // Loop through 12 positions and create the result list
      for (int i = 0; i < 12; i++) {
        // Get the current Gan and Zhi
        String currentGan = GAN_5[(ganIndex + i) % GAN_5.length];
        String currentZhi = zhiList[i % zhiList.length];

        // Combine them and add to the result list
        result.add('$currentGan$currentZhi');
      }
    }

    return result;
  }

  // 找命宮天干
  static String extractGanForZhi(List<String> combinations, String zhi) {
    // Iterate through the list of combinations
    for (String combination in combinations) {
      // Check if the combination ends with the specified Zhi
      if (combination.endsWith(zhi)) {
        // Return the Gan part of the combination
        return combination.substring(0, 1);
      }
    }

    // Return a message if the specified Zhi is not found
    return "Not found";
  }

  static String fivetiger(String input) {
    switch (input) {
      case '甲':
      case '己':
        return '丙';
      case '乙':
      case '庚':
        return '戊';
      case '丙':
      case '辛':
        return '庚';
      case '丁':
      case '壬':
        return '壬';
      case '戊':
      case '癸':
        return '甲';
      default:
        return '';
    }
  }

  static int _getTianganValue(String tiangan) {
    switch (tiangan) {
      case '甲':
      case '乙':
        return 1;
      case '丙':
      case '丁':
        return 2;
      case '戊':
      case '己':
        return 3;
      case '庚':
      case '辛':
        return 4;
      case '壬':
      case '癸':
        return 5;
      default:
        return 0; // Return 0 for an unknown tiangan
    }
  }

  static int _getDizhiValue(String dizhi) {
    switch (dizhi) {
      case '子':
      case '丑':
      case '午':
      case '未':
        return 1;
      case '寅':
      case '卯':
      case '申':
      case '酉':
        return 2;
      case '辰':
      case '巳':
      case '戌':
      case '亥':
        return 3;
      default:
        return 0; // Return 0 for an unknown dizhi
    }
  }
// static int elementsResult(String tiangan, String dizhi) {
//   const Map<String, String> newfziMap = {
//     '正': '寅',
//     '臘': '丑',
//     '冬': '子',
//     '九': '戌',
//     '十': '亥',
//     '八': '酉',
//     '七': '申',
//     '六': '未',
//     '五': '午',
//     '四': '巳',
//     '三': '辰',
//     '二': '卯',
//   };

//   // Check that '月' is present and there's a valid character before it
//   int monthIndex = dizhi.indexOf('月');
//   if (monthIndex <= 0 || monthIndex >= dizhi.length) {
//     throw ArgumentError("Invalid input: 'dizhi' must contain a valid month character before '月'.");
//   }

//   // Extract the character before '月'
//   String monthCharacter = dizhi.substring(monthIndex - 1, monthIndex);

//   // Get the corresponding value from the newfziMap
//   String? mappedDizhi = newfziMap[monthCharacter];
//   if (mappedDizhi == null) {
//     throw ArgumentError("Invalid month character: '$monthCharacter' not found in the fziMap.");
//   }

//   // Get the tiangan and dizhi values using the mapped dizhi
//   int tianganValue = _getTianganValue(tiangan);
//   int dizhiValue = _getDizhiValue(mappedDizhi);

//   // Calculate the sum and determine the result based on the logic
//   int sum = tianganValue + dizhiValue;
//   int result = sum > 5 ? sum % 5 : sum;

//   // Apply the specified mapping to the result
//   switch (result) {
//     case 1:
//       return 3;
//     case 2:
//       return 4;
//     case 3:
//       return 2;
//     case 4:
//       return 6;
//     case 5:
//       return 5;
//     default:
//       throw StateError("Unexpected result value: $result");
//   }
// }

// 用紫薇命宮查局數
  static int elementsResult(String tiangan, String dizhi) {
    int tianganValue = _getTianganValue(tiangan);
    int dizhiValue = _getDizhiValue(dizhi);

    int sum = tianganValue + dizhiValue;
    int result = sum > 5 ? sum % 5 : sum;

    // Apply the specified mapping to the result
    switch (result) {
      case 1:
        return 3;
      case 2:
        return 4;
      case 3:
        return 2;
      case 4:
        return 6;
      case 5:
        return 5;
      default:
        return result; // Return the original result if it's not in the mapping
    }
  }

// 算生宮 用農曆找月份
  static String calculateBase(String first, String second) {
    // Get the position of the first string in zhiMap
    int firstPosition = zhiMap[first] ?? 0;

    // Get the number of steps to move backward from fziMap
    int backwardSteps =
        (fziMap[second] ?? 0) - 1; // Adjust for counting directly

    if (firstPosition == 0 || backwardSteps < 0) {
      return "Invalid input"; // Handle invalid inputs
    }

    // Calculate the new position by moving backward from firstPosition
    int resultPosition = (firstPosition - backwardSteps + 12) % 12;

    // Handle position 0 case (which corresponds to position 12 in the map)
    if (resultPosition == 0) {
      resultPosition = 12;
    }

    // Find the key corresponding to the new position in zhiMap
    String result = zhiMap.entries
        .firstWhere(
          (entry) => entry.value == resultPosition,
          orElse: () => const MapEntry("Not found", 0),
        )
        .key;

    return result;
  }

// 文曲算法
  static List<String> wengqu(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = fziMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = zhiMap['辰']!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '文曲'; // Adjust for 0-indexing

    return positions;
  }

// 文昌
// Define the new function to count backward from '戌'
  static List<String> wengchan(String input) {
    /// Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the position of '戌' in zhiMap
    int startPosition = zhiMap['戌']!;

    // Get the zhiMap position of the input string
    int inputPosition = zhiMap[input] ?? 0;
    if (inputPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Calculate the target position based on inputPosition counting backward from '戌'
    int targetPosition = (startPosition - inputPosition + 12) % 12;

    // Subtract 1 to adjust the position
    targetPosition = (targetPosition - 1 + 12) % 12;

    // Handle zero index by adjusting to the 12th position
    targetPosition = targetPosition == 0 ? 12 : targetPosition;

    // Insert '文昌' at the calculated target position
    positions[targetPosition - 1] = '文昌'; // Adjust for zero-based indexing

    return positions;
  }

  // 左府算法
  static List<String> leftHelp(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the zhiMap position of the input string
    int zhiPosition = zhiMap[input] ?? 0;
    if (zhiPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = zhiMap['辰']!;

    // Calculate the target position based on counting forward from 辰
    int targetPosition = (chenPosition + zhiPosition - 1) % 12;
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '左輔' at the calculated target position
    positions[targetPosition - 1] = '左輔'; // Adjust for 0-indexing

    return positions;
  }

  // 右弼算法
  // 右弼算法
  static List<String> rightHelp(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the position of '戌' in zhiMap
    int startPosition = zhiMap['戌']!;

    // Get the zhiMap position of the input string
    int inputPosition = zhiMap[input] ?? 0;
    if (inputPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Calculate the target position by counting backward from '戌', including '戌' itself
    int targetPosition = (startPosition - inputPosition + 13) % 12;

    // Handle zero-based indexing and ensure valid position range
    targetPosition = targetPosition == 0 ? 12 : targetPosition;

    // Insert '右弼' at the calculated target position
    positions[targetPosition - 1] = '右弼'; // Adjust for zero-based indexing

    return positions;
  }
  // 天魁天月

  static List<String> tianyueTianKui(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<List<String>, List<int>> starPositions = {
      ['甲', '戊', '庚']: [12], // '天鉞' at index 5, '天魁' at index 11
      ['壬', '癸']: [2], // '天鉞' at index 2, '天魁' at index 4
      ['丙', '丁']: [10], // '天鉞' at index 8, '天魁' at index 10
      ['辛']: [5], // '天鉞' at index 1, '天魁' at index 5
      ['乙', '己']: [11], // '天鉞' at index 6, '天魁' at index 11
    };

    // Find the matching star positions for the given input
    for (var key in starPositions.keys) {
      if (key.contains(input)) {
        List<int> positionsToFill = starPositions[key]!;

        positions[positionsToFill[0] - 1] =
            '天魁'; // Adjust for zero-based indexing
        break;
      }
    }

    return positions;
  }

  static List<String> tianyue(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<List<String>, List<int>> starPositions = {
      ['甲', '戊', '庚']: [6], // '天鉞' at index 5, '天魁' at index 11
      ['壬', '癸']: [4], // '天鉞' at index 2, '天魁' at index 4
      ['丙', '丁']: [8], // '天鉞' at index 8, '天魁' at index 10
      ['辛']: [1], // '天鉞' at index 1, '天魁' at index 5
      ['乙', '己']: [7], // '天鉞' at index 6, '天魁' at index 11
    };

    // Find the matching star positions for the given input
    for (var key in starPositions.keys) {
      if (key.contains(input)) {
        List<int> positionsToFill = starPositions[key]!;
        positions[positionsToFill[0] - 1] =
            '天鉞'; // Adjust for zero-based indexing

        break;
      }
    }

    return positions;
  }

  // 地劫算法
  static List<String> dijie(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = fziMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = zhiMap['亥']!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '地劫'; // Adjust for 0-indexing

    return positions;
  }

  // 天刑算法 口訣：天刑從酉起正月，順至生月便安之。天姚丑宮起正月，順到生月即停留。
  static List<String> punish(String input) {
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = zhiMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = zhiMap['酉']!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '天刑'; // Adjust for 0-indexing

    return positions;
  }

  // 天姚算法 .說明：用生月定位，天刑從酉時開始順時針排列到生月定位，天姚從丑位開始順時針排列到生月定位。
  static List<String> sexy(String input) {
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = zhiMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = zhiMap['丑']!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '天姚'; // Adjust for 0-indexing

    return positions;
  }

  // 地空算法
  static List<String> dikong(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the position of '戌' in zhiMap
    int startPosition = zhiMap['亥']!;

    // Get the zhiMap position of the input string
    int inputPosition = fziMap[input] ?? 0;
    if (inputPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Calculate the target position by counting backward from '戌', including '戌' itself
    int targetPosition = (startPosition - inputPosition + 13) % 12;

    // Handle zero-based indexing and ensure valid position range
    targetPosition = targetPosition == 0 ? 12 : targetPosition;

    // Insert '右弼' at the calculated target position
    positions[targetPosition - 1] = '地空'; // Adjust for zero-based indexing

    return positions;
  }

  // 乙級星
  // 月解算法
  static List<String> solverYear(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the position of '戌' in zhiMap
    int startPosition = zhiMap['戌']!;

    // Get the zhiMap position of the input string
    int inputPosition = fziMap[input] ?? 0;
    if (inputPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Calculate the target position by counting backward from '戌', including '戌' itself
    int targetPosition = (startPosition - inputPosition + 13) % 12;

    // Handle zero-based indexing and ensure valid position range
    targetPosition = targetPosition == 0 ? 12 : targetPosition;

    // Insert '右弼' at the calculated target position
    positions[targetPosition - 1] = '年解'; // Adjust for zero-based indexing

    return positions;
  }

// ★恩光、天貴
// 1.口訣：由文昌之宮位起初一，順行至生日再退一步起恩光，由文曲之宮位起初一，順行至生日再退一步起天貴。
// 2.說明：用農曆生日定位。
// 恩光要由文昌所在宮位開始計算，順時針到生日時再退一步定位恩光。
// 天貴要由文曲所在宮位開始計算，順時針到生日時再退一步定位天貴。
  static List<String> blessingLight(List<String> list, int steps) {
    // Subtract 1 from the steps
    steps -= 2;

    // Find the index of '左輔' in the list
    int startIndex = list.indexOf('文昌');

    // If '左輔' is not found, return the original list
    if (startIndex == -1) return list;

    // Create a copy of the original list to work with
    List<String> newList = List.from(list);

    // Move `steps` times to the right with wrap-around using modulo
    int finalIndex = (startIndex + steps) % newList.length;

    // Replace '左輔' with an empty string
    newList[startIndex] = '';

    // Set the final position to '三台'
    newList[finalIndex] = '恩光';

    return newList;
  }

  static List<String> highClass(List<String> list, int steps) {
    // Subtract 1 from the steps
    steps -= 2;

    // Find the index of '左輔' in the list
    int startIndex = list.indexOf('文曲');

    // If '左輔' is not found, return the original list
    if (startIndex == -1) return list;

    // Create a copy of the original list to work with
    List<String> newList = List.from(list);

    // Move `steps` times to the right with wrap-around using modulo
    int finalIndex = (startIndex + steps) % newList.length;

    // Replace '左輔' with an empty string
    newList[startIndex] = '';

    // Set the final position to '三台'
    newList[finalIndex] = '天貴';

    return newList;
  }

  static List<String> santai(List<String> list, int steps) {
    // Subtract 1 from the steps
    steps -= 1;

    // Find the index of '左輔' in the list
    int startIndex = list.indexOf('左輔');

    // If '左輔' is not found, return the original list
    if (startIndex == -1) return list;

    // Create a copy of the original list to work with
    List<String> newList = List.from(list);

    // Move `steps` times to the right with wrap-around using modulo
    int finalIndex = (startIndex + steps) % newList.length;

    // Replace '左輔' with an empty string
    newList[startIndex] = '';

    // Set the final position to '三台'
    newList[finalIndex] = '三臺';

    return newList;
  }

  static List<String> eightseats(List<String> list, int steps) {
    // Subtract 1 from the steps
    steps -= 1;

    // Find the index of '右弼' in the list
    int startIndex = list.indexOf('右弼');

    // If '右弼' is not found, return the original list
    if (startIndex == -1) return list;

    // Create a copy of the original list to work with
    List<String> newList = List.from(list);

    // Move `steps` times to the left with wrap-around using modulo
    int finalIndex = (startIndex - steps) % newList.length;

    // Handle negative indices by adjusting with the list length
    if (finalIndex < 0) {
      finalIndex += newList.length;
    }

    // Replace '右弼' with an empty string
    newList[startIndex] = '';

    // Set the final position to '八座'
    newList[finalIndex] = '八座';

    return newList;
  }

  // 年解
  static List<String> solver(String input) {
    // Initialize the list with 12 empty strings
    List<String> resultList = List.filled(12, '');

    // Define a mapping of input strings to their respective positions
    Map<String, int> positionMap = {
      '寅': 7,
      '卯': 7,
      '辰': 9,
      '巳': 9,
      '午': 11,
      '未': 11,
      '申': 1,
      '酉': 1,
      '戌': 3,
      '亥': 3,
      '子': 6,
      '丑': 6,
    };

    // Get the position from the map based on the input
    int? position = positionMap[input];

    // Insert '年解' at the corresponding position if it exists
    if (position != null && position >= 1 && position <= 12) {
      resultList[position - 1] = '解神';
    }

    return resultList;
  }

  // 天喜
  static List<String> happy(String input) {
    // Initialize the list with 12 empty strings
    List<String> resultList = List.filled(12, '');

    // Define a mapping of input strings to their respective positions
    Map<String, int> positionMap = {
      '寅': 6,
      '卯': 5,
      '辰': 4,
      '巳': 3,
      '午': 2,
      '未': 1,
      '申': 0,
      '酉': 11,
      '戌': 10,
      '亥': 9,
      '子': 8,
      '丑': 7,
    };

    // Get the position from the map based on the input
    int? position = positionMap[input];

    // Insert '年解' at the corresponding position if it exists
    if (position != null && position >= 1 && position <= 12) {
      resultList[position - 1] = '天喜';
    }

    return resultList;
  }

  // 天德
  static List<String> tiander(String input) {
    // Initialize the list with 12 empty strings
    List<String> resultList = List.filled(12, '');

    // Define a mapping of input strings to their respective positions
    Map<String, int> positionMap = {
      '寅': 10,
      '卯': 11,
      '辰': 12,
      '巳': 1,
      '午': 2,
      '未': 3,
      '申': 4,
      '酉': 5,
      '戌': 6,
      '亥': 7,
      '子': 8,
      '丑': 9,
    };

    // Get the position from the map based on the input
    int? position = positionMap[input];

    // Insert '年解' at the corresponding position if it exists
    if (position != null && position >= 1 && position <= 12) {
      resultList[position - 1] = '天德';
    }

    return resultList;
  }

  // /月德
  static List<String> moonder(String input) {
    // Initialize the list with 12 empty strings
    List<String> resultList = List.filled(12, '');

    // Define a mapping of input strings to their respective positions
    Map<String, int> positionMap = {
      '寅': 11,
      '卯': 12,
      '辰': 1,
      '巳': 2,
      '午': 3,
      '未': 4,
      '申': 5,
      '酉': 6,
      '戌': 7,
      '亥': 8,
      '子': 9,
      '丑': 10,
    };

    // Get the position from the map based on the input
    int? position = positionMap[input];

    // Insert '年解' at the corresponding position if it exists
    if (position != null && position >= 1 && position <= 12) {
      resultList[position - 1] = '月德';
    }

    return resultList;
  }

  static List<String> loner(String input) {
    // Initialize the list with 12 empty strings
    List<String> resultList = List.filled(12, '');

    // Define a mapping of input strings to their respective positions
    Map<String, int> positionMap = {
      '寅': 4,
      '卯': 4,
      '辰': 4,
      '巳': 7,
      '午': 7,
      '未': 7,
      '申': 10,
      '酉': 10,
      '戌': 10,
      '亥': 1,
      '子': 1,
      '丑': 1,
    };

    // Define the position for the additional output
    Map<String, int> secondPositionMap = {
      '寅': 12,
      '卯': 12,
      '辰': 12,
      '巳': 3,
      '午': 3,
      '未': 3,
      '申': 6,
      '酉': 6,
      '戌': 6,
      '亥': 9,
      '子': 9,
      '丑': 9,
    };

    // Get the positions from the maps based on the input
    int? position1 = positionMap[input];
    int? position2 = secondPositionMap[input];

    // Insert '孤辰' at the first corresponding position if it exists
    if (position1 != null && position1 >= 1 && position1 <= 12) {
      resultList[position1 - 1] = '孤辰';
    }

    // Insert the additional output at the second corresponding position if it exists
    if (position2 != null && position2 >= 1 && position2 <= 12) {
      resultList[position2 - 1] = '寡宿';
    }

    return resultList;
  }

  // 紅鸞算法 卯宮逆算到年
  static List<String> hongran(String input) {
    List<String> positions = List.filled(12, '');

    int startPosition = zhiMap['卯']!;

    int inputPosition = fziMap[input] ?? 0;
    if (inputPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    int targetPosition = (startPosition - inputPosition + 13) % 12;

    targetPosition = targetPosition == 0 ? 12 : targetPosition;

    positions[targetPosition - 1] = '紅鸞';

    return positions;
  }

  static List<String> generate3Stars(String input) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '癸': [10, 11, 12],
      '壬': [9, 10, 11],
      '戊': [3, 4, 5],
      '己': [4, 5, 6],
      '辛': [7, 8, 9],
      '庚': [6, 7, 8],
      '丙': [3, 4, 5],
      '丁': [4, 5, 6],
      '甲': [12, 1, 2],
      '乙': [1, 2, 3],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(input)) {
      List<int> positionsToFill = starPositions[input]!;
      positions[positionsToFill[0] - 1] =
          '陀羅'; // Adjust for zero-based indexing
      positions[positionsToFill[1] - 1] =
          '祿存'; // Adjust for zero-based indexing
      positions[positionsToFill[2] - 1] =
          '擎羊'; // Adjust for zero-based indexing
    }

    return positions;
  }

  static List<String> wizard(String monthBot) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [0], // Adjusted indices to be zero-based
      '子': [0],
      '辰': [0],
      '寅': [3],
      '午': [3],
      '戌': [3],
      '亥': [6],
      '卯': [6],
      '未': [6],
      '巳': [9],
      '酉': [9],
      '丑': [9],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(monthBot)) {
      List<int> positionsToFill = starPositions[monthBot]!;
      positions[positionsToFill[0]] =
          '天巫'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  static List<String> saltWaterNhorse(String yearZhi) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [7, 0], // Adjusted indices to be zero-based
      '子': [7, 0],
      '辰': [7, 0],
      '寅': [1, 6],
      '午': [1, 6],
      '戌': [1, 6],
      '亥': [10, 3],
      '卯': [10, 3],
      '未': [10, 3],
      '巳': [4, 9], // Changed from '己' to '巳'
      '酉': [4, 9],
      '丑': [4, 9],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearZhi)) {
      List<int> positionsToFill = starPositions[yearZhi]!;
      positions[positionsToFill[0]] =
          '咸池'; // Assign '咸池' to the correct position
      positions[positionsToFill[1]] =
          '天馬'; // Assign '天馬' to the correct position
    }

    return positions;
  }

  // 身宮
  static List<String> shengong(String yearZhi) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [7], // Adjusted indices to be zero-based
      '子': [7],
      '辰': [7],
      '寅': [1],
      '午': [1],
      '戌': [1],
      '亥': [10],
      '卯': [10],
      '未': [10],
      '巳': [4], // Changed from '己' to '巳'
      '酉': [4],
      '丑': [4],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearZhi)) {
      List<int> positionsToFill = starPositions[yearZhi]!;
      positions[positionsToFill[0]] =
          '身宮'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  // 火星算法
  static List<String> fireStar(String yearZhi, String input) {
    if (yearZhi == '寅') {
      yearZhi = '丑';
    } else if (yearZhi == '戌') {
      yearZhi = '丑';
    } else if (yearZhi == '午') {
      yearZhi = '丑';
    } else if (yearZhi == '申') {
      yearZhi = '寅';
    } else if (yearZhi == '子') {
      yearZhi = '寅';
    } else if (yearZhi == '辰') {
      yearZhi = '寅';
    } else if (yearZhi == '巳') {
      yearZhi = '卯';
    } else if (yearZhi == '酉') {
      yearZhi = '卯';
    } else if (yearZhi == '丑') {
      yearZhi = '卯';
    } else if (yearZhi == '亥') {
      yearZhi = '酉';
    } else if (yearZhi == '卯') {
      yearZhi = '酉';
    } else if (yearZhi == '未') {
      yearZhi = '酉';
    }

    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = fziMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = zhiMap[yearZhi]!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '火星'; // Adjust for 0-indexing

    return positions;
  }

  // 鈴星算法

  static List<String> angryBell(String yearZhi, String input) {
    if (yearZhi == '寅') {
      yearZhi = '卯';
    } else if (yearZhi == '戌') {
      yearZhi = '卯';
    } else if (yearZhi == '午') {
      yearZhi = '卯';
    } else if (yearZhi == '申') {
      yearZhi = '戌';
    } else if (yearZhi == '子') {
      yearZhi = '戌';
    } else if (yearZhi == '辰') {
      yearZhi = '戌';
    } else if (yearZhi == '巳') {
      yearZhi = '戌';
    } else if (yearZhi == '酉') {
      yearZhi = '戌';
    } else if (yearZhi == '丑') {
      yearZhi = '戌';
    } else if (yearZhi == '亥') {
      yearZhi = '戌';
    } else if (yearZhi == '卯') {
      yearZhi = '戌';
    } else if (yearZhi == '未') {
      yearZhi = '戌';
    }

    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = fziMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = zhiMap[yearZhi]!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '鈴星'; // Adjust for 0-indexing

    return positions;
  }

  // 口訣：台輔星從午宮起，順至生時是貴鄉。封誥寅宮來起子，順到生時是貴方。
  // 2.說明：用生時定位，台輔從午位開始順時針排列到生時定位，封誥從寅位開始順時針排列到生時定位

  // 乙級星

  static List<String> taibu(String input) {
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = zhiMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = fziMap['午']!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '臺輔'; // Adjust for 0-indexing

    return positions;
  }

  static List<String> middleEmepty(String input) {
    // Initialize the list with empty strings (can be modified later)
    List<String> newList = List.filled(12, '');

    // Check for the input and modify the list accordingly
    if (['甲子', '乙丑', '丙寅', '丁卯', '己巳', '庚午', '辛未', '壬申', '癸酉', '戊辰']
        .contains(input)) {
      // Place 'something' at position 2 and 'thing' at position 4
      newList[8] = '旬空'; // Position 2 (index 1)
      // newList[9] = '旬空'; // Position 4 (index 3)
    } else if (['甲戌', '乙亥', '丙子', '丁丑', '戊寅', '己卯', '庚辰', '辛巳', '壬午', '癸未']
        .contains(input)) {
      // Place 'something' at position 6 and 'thing' at position 8
      newList[6] = '旬空'; // Position 6 (index 5)
      // newList[8] = 'thing'; // Position 8 (index 7)
    } else if (['甲申', '乙酉', '丙戌', '丁亥', '戊子', '己丑', '庚寅', '辛卯', '壬辰', '癸巳']
        .contains(input)) {
      // Place 'something' at position 6 and 'thing' at position 8
      newList[4] = '旬空'; // Position 6 (index 5)
      // newList[8] = 'thing'; // Position 8 (index 7)
    } else if (['甲午', '乙未', '丙申', '丁酉', '戊戌', '己亥', '庚子', '辛丑', '壬寅', '癸卯']
        .contains(input)) {
      // Place 'something' at position 6 and 'thing' at position 8
      newList[2] = '旬空'; // Position 6 (index 5)
      // newList[8] = 'thing'; // Position 8 (index 7)
    } else if (['甲辰', '乙巳', '丙午', '丁未', '戊申', '己酉', '庚戌', '辛亥', '壬子', '癸丑']
        .contains(input)) {
      // Place 'something' at position 6 and 'thing' at position 8
      newList[0] = '旬空'; // Position 6 (index 5)
      // newList[8] = 'thing'; // Position 8 (index 7)
    } else if (['甲寅', '乙卯', '丙辰', '丁巳', '戊午', '己未', '庚申', '辛酉', '壬戌', '癸亥']
        .contains(input)) {
      // Place 'something' at position 6 and 'thing' at position 8
      newList[10] = '旬空'; // Position 6 (index 5)
      // newList[8] = 'thing'; // Position 8 (index 7)
    }

    return newList;
  }

  static List<String> fonhao(String input) {
    List<String> positions = List.filled(12, '');

    // Get the fziMap position of the input string
    int fziPosition = zhiMap[input] ?? 0;
    if (fziPosition == 0) {
      return positions; // Return the empty list if the input is invalid
    }

    // Get the position of '辰' in zhiMap
    int chenPosition = fziMap['寅']!;

    // Calculate the target position based on fziPosition
    int targetPosition =
        (chenPosition + fziPosition - 1) % 12; // Adjust for 0-indexing
    targetPosition =
        targetPosition == 0 ? 12 : targetPosition; // Handle zero index

    // Insert '文曲' at the calculated target position
    positions[targetPosition - 1] = '封誥'; // Adjust for 0-indexing

    return positions;
  }
  // 天才、天壽
  // 1.口訣：天才由命宮起子，順行至本生年支安之，天壽由身宮起子，順行至本生年支安之。
  // 2.說明：用生年支定位，天才從命盤上的命宮開始順時針算起，算到生年支定位天才星，天壽從命盤上的身宮開始順時針算起，算到生年支定位天壽星。

  static List<String> smart(
      List<String> inputList, String targetString, String yearbot) {
    // Initialize the predefined list with '天才' in the first position
    List<String> predefinedList = [
      '天才',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      ''
    ];

    // Map to find the index shift based on 'yearbot'

    // Get the shift based on 'yearbot'
    int shift = fziMap[yearbot] ?? 0;

    shift = shift - 1;

    // Find the index of the target string in the input list
    int targetIndex = inputList.indexOf(targetString);
    if (targetIndex == -1) {
      throw ArgumentError('Target string not found in input list.');
    }

    // Calculate the new index for '天才' considering the shift and treating '天才' as 1
    int newPosition = (targetIndex + shift) % predefinedList.length;

    // Reset the predefined list to be empty
    List<String> rearrangedList = List.filled(predefinedList.length, '');

    // Insert '天才' at the new calculated position
    rearrangedList[newPosition] = '天才';

    return rearrangedList;
  }

  // static List<String> longLive(List<String> inputList, String startPosition) {
  //   int currentIndex = inputList.indexOf('身宮');

  //   if (currentIndex == -1 || !fziMap.containsKey(startPosition)) {
  //     throw Exception(
  //         'Invalid input: No "身宮" found or invalid start position.');
  //   }

  //   // Get the step value from the map
  //   int steps = fziMap[startPosition]!;

  //   steps = steps - 1; // Adjust for zero-based indexing

  //   // Calculate the new position with wrapping
  //   int newIndex = (currentIndex + steps) % inputList.length;

  //   // Clear the original '身宮' position
  //   inputList[currentIndex] = '';

  //   // Update the list at the new index
  //   inputList[newIndex] = '天壽';

  //   return inputList;
  // }
  static List<String> longLive(List<String> inputList, String startPosition) {
    // Create a copy of the input list to avoid modifying the original list
    List<String> newList = List.from(inputList);

    int currentIndex = newList.indexOf('身宮');

    if (currentIndex == -1 || !fziMap.containsKey(startPosition)) {
      throw Exception(
          'Invalid input: No "身宮" found or invalid start position.');
    }

    // Get the step value from the map
    int steps = fziMap[startPosition]!;

    steps = steps - 1; // Adjust for zero-based indexing

    // Calculate the new position with wrapping
    int newIndex = (currentIndex + steps) % newList.length;

    // Clear the original '身宮' position
    newList[currentIndex] = '';

    // Update the list at the new index
    newList[newIndex] = '天壽';

    return newList;
  }

//         .口訣：正七月在寅，二八月在子，三九月在戌，四十月在申，五十一在午，六十二在辰。
  // 2.說明：用生月定位。
  // 陰煞
  static List<String> yingxa(String monthZhi) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [0], // Adjusted indices to be zero-based
      '子': [4],
      '辰': [8],
      '寅': [0],
      '午': [4],
      '戌': [8],
      '亥': [6],
      '卯': [10],
      '未': [2],
      '巳': [6], // Changed from '己' to '巳'
      '酉': [10],
      '丑': [2],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(monthZhi)) {
      List<int> positionsToFill = starPositions[monthZhi]!;
      positions[positionsToFill[0]] =
          '陰煞'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  static List<String> sky(String monthZhi) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [7], // Adjusted indices to be zero-based
      '子': [11],
      '辰': [3],
      '寅': [1],
      '午': [5],
      '戌': [9],
      '亥': [10],
      '卯': [2],
      '未': [6],
      '巳': [4], // Changed from '己' to '巳'
      '酉': [8],
      '丑': [0],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(monthZhi)) {
      List<int> positionsToFill = starPositions[monthZhi]!;
      positions[positionsToFill[0]] =
          '天空'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  // .口訣：甲己空申酉，乙庚午未求，丙辛空辰巳，丁壬寅卯憂，戊癸空子丑。
  // 2.說明：用生年定位。
  // 甲年干出生在申位。
  // 乙年干出生在午位。
  // 丙年干出生在辰位。
  // 丁年干出生在寅位。
  // 戊年干出生在子位。
  // 己年干出生在酉位。
  // 庚年干出生在未位。
  // 辛年干出生在巳位。
  // 壬年干出生在卯位。
  // 癸年干出生在丑位。
  static List<String> skyEmpty(String yearTop) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '甲': [6], // Adjusted indices to be zero-based
      '乙': [4],
      '丙': [2],
      '丁': [0],
      '戊': [10],
      '己': [7],
      '庚': [5],
      '辛': [3],
      '癸': [11],
      '壬': [1], // Changed from '己' to '巳'
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearTop)) {
      List<int> positionsToFill = starPositions[yearTop]!;
      positions[positionsToFill[0]] =
          '截空'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  static List<String> heavenbless(String yearGan) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '甲': [5], // Adjusted indices to be zero-based
      '乙': [2],
      '丙': [3],
      '丁': [0],
      '戊': [1],
      '己': [7],
      '庚': [9],
      '辛': [7],
      '壬': [8],
      '癸': [4],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearGan)) {
      List<int> positionsToFill = starPositions[yearGan]!;
      positions[positionsToFill[0]] =
          '天官'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  static List<String> heavenjob(String yearGan) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '甲': [7], // Adjusted indices to be zero-based
      '乙': [6],
      '丙': [10],
      '丁': [9],
      '戊': [1],
      '己': [0],
      '庚': [4],
      '辛': [3],
      '壬': [4],
      '癸': [3],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearGan)) {
      List<int> positionsToFill = starPositions[yearGan]!;
      positions[positionsToFill[0]] =
          '天福'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  static List<String> skycry(String yearGan) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '子': [4], // Adjusted indices to be zero-based
      '丑': [3],
      '寅': [2],
      '卯': [1],
      '辰': [0],
      '巳': [11],
      '午': [
        10,
      ],
      '未': [9],
      '申': [8],
      '酉': [7],
      '戌': [6],
      '亥': [5],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearGan)) {
      List<int> positionsToFill = starPositions[yearGan]!;

      // Place '天哭' and '天虛' at the same positions
      positions[positionsToFill[0]] = '天哭';
    }

    return positions;
  }

  static List<String> skyNone(String yearGan) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '子': [4], // Adjusted indices to be zero-based
      '丑': [5],
      '寅': [6],
      '卯': [7],
      '辰': [8],
      '巳': [9],
      '午': [10],
      '未': [11],
      '申': [0],
      '酉': [1],
      '戌': [2],
      '亥': [3],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearGan)) {
      List<int> positionsToFill = starPositions[yearGan]!;

      // Place '天哭' and '天虛' at the same positions
      positions[positionsToFill[0]] = '天虛';
    }

    return positions;
  }

  static List<String> dragonPond(String yearGan) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '子': [2], // Adjusted indices to be zero-based
      '丑': [3],
      '寅': [4],
      '卯': [5],
      '辰': [6],
      '巳': [7],
      '午': [8],
      '未': [9],
      '申': [10],
      '酉': [11],
      '戌': [0],
      '亥': [1],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearGan)) {
      List<int> positionsToFill = starPositions[yearGan]!;

      positions[positionsToFill[0]] = '龍池';
    }

    return positions;
  }

  static List<String> phonex(String yearGan) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '子': [8], // Adjusted indices to be zero-based
      '丑': [7],
      '寅': [6],
      '卯': [5],
      '辰': [4],
      '巳': [3],
      '午': [2],
      '未': [1],
      '申': [0],
      '酉': [11],
      '戌': [10],
      '亥': [9],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearGan)) {
      List<int> positionsToFill = starPositions[yearGan]!;

      // Place '天哭' and '天虛' at the same positions
      positions[positionsToFill[0]] = '鳳閣';
    }

    return positions;
  }

  static List<String> poSui(String yearBranch) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the mapping for year branches to positions
    final Map<String, int> poSuiPositions = {
      '子': 3, '午': 3, '卯': 3, '酉': 3, // Place 破碎 at position 4 (巳)
      '寅': 7, '申': 7, '巳': 7, '亥': 7, // Place 破碎 at position 7 (酉)
      '辰': 11, '戌': 11, '丑': 11, '未': 11 // Place 破碎 at position 11 (丑)
    };

    // Check if the year branch is valid and place '破碎' at the correct position
    if (poSuiPositions.containsKey(yearBranch)) {
      int position = poSuiPositions[yearBranch]!;
      positions[position] = '破碎';
    }

    return positions;
  }

//               ★天月
  // 1.口訣：一犬二蛇三在龍，四虎五羊六兔宮，七豬八羊九在虎，十馬冬犬臘寅中。
  // 2.說明：用生月定位。
  // 一月出生在戌位。
  // 二月出生在巳位。
  // 三月出生在辰位。
  // 四月出生在寅位。
  // 五月出生在未位。
  // 六月出生在卯未。
  // 七月出生在亥位。
  // 八月出生在未位。
  // 九月出生在寅位。
  // 十月出生在午位。
  // 十一月出生在戌位。
  // 十二月出生在寅位。

  static List<String> skyMoon(String moonthBot) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [9], // Adjusted indices to be zero-based
      '子': [8],
      '辰': [2],
      '寅': [8],
      '午': [5],
      '戌': [0],
      '亥': [4],
      '卯': [3],
      '未': [1],
      '巳': [0], // Changed from '己' to '巳'
      '酉': [5],
      '丑': [0],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(moonthBot)) {
      List<int> positionsToFill = starPositions[moonthBot]!;
      positions[positionsToFill[0]] = '天月';
    }

    return positions;
  }

//   ★蜚廉
// 1.口訣：子丑寅年在申酉戌，卯辰巳年在巳午未，午未申年在寅卯辰，酉戌亥年在亥子丑。
// 2.說明：用生年支定位。
  static List<String> bug(String moonthBot) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [2], // Adjusted indices to be zero-based
      '子': [6],
      '辰': [4],
      '寅': [8],
      '午': [0],
      '戌': [10],
      '亥': [11],
      '卯': [3],
      '未': [1],
      '巳': [5], // Changed from '己' to '巳'
      '酉': [9],
      '丑': [7],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(moonthBot)) {
      List<int> positionsToFill = starPositions[moonthBot]!;
      positions[positionsToFill[0]] =
          '蜚廉'; // Assign '咸池' to the correct position
    }

    return positions;
  }
// 華蓋
// 1.口訣：子辰申年在辰，丑巳酉年在丑，寅午戌年在戌，卯未亥年在未。
// 2.說明：用生年支定位。

  static List<String> huagai(String moonthBot) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '申': [2], // Adjusted indices to be zero-based
      '子': [2],
      '辰': [2],
      '寅': [8],
      '午': [8],
      '戌': [8],
      '亥': [5],
      '卯': [5],
      '未': [5],
      '巳': [11], // Changed from '己' to '巳'
      '酉': [11],
      '丑': [11],
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(moonthBot)) {
      List<int> positionsToFill = starPositions[moonthBot]!;
      positions[positionsToFill[0]] =
          '華蓋'; // Assign '咸池' to the correct position
    }

    return positions;
  }

//   ★天廚
// 1.口訣：甲丁食蛇，乙戊辛馬方，丙從鼠口得，己食於猴房，庚食虎頭上，壬雞癸豬堂。
// 2.說明：用生年干定位。
  static List<String> cook(String yearTop) {
    // Initialize a list with 12 empty strings
    List<String> positions = List.filled(12, '');

    // Define the star positions for the specific inputs
    final Map<String, List<int>> starPositions = {
      '甲': [3], // Adjusted indices to be zero-based
      '乙': [4],
      '丙': [10],
      '丁': [3],
      '戊': [4],
      '己': [6],
      '庚': [0],
      '辛': [4],
      '壬': [7],
      '癸': [9], // Changed from '己' to '巳'
    };

    // Retrieve the positions for the input if it exists in the map
    if (starPositions.containsKey(yearTop)) {
      List<int> positionsToFill = starPositions[yearTop]!;
      positions[positionsToFill[0]] =
          '天廚'; // Assign '咸池' to the correct position
    }

    return positions;
  }

  static Map<int, Map<int, String>> ziweiDictionary = {
    4: {
      // 金四局 (Metal)
      5: "子", 9: "丑", 3: "丑", 4: "寅", 7: "寅", 13: "寅", 8: "卯", 11: "卯", 17: "卯",
      2: "辰", 12: "辰", 15: "辰",
      21: "辰", 6: "巳", 16: "巳", 19: "巳", 25: "巳", 10: "午", 20: "午",
      23: "午", 29: "午", 14: "未", 24: "未", 27: "未", 22: "酉",
      26: "戌", 30: "亥", 1: "亥"
    },
    3: {
      // 木三局 (Wood)
      25: "子", 2: "丑", 28: "丑", 3: "寅", 5: "寅", 8: "卯", 6: "卯", 1: "辰",
      9: "辰", 11: "辰", 4: "巳", 12: "巳", 14: "巳", 7: "午", 15: "午",
      17: "午", 10: "未", 18: "未", 20: "未", 13: "申", 21: "申", 23: "申", 16: "申",
      24: "申", 26: "申", 19: "戌", 27: "戌", 29: "戌", 22: "亥", 30: "亥"
    },
    2: {
      // 水二局 (Water)
      22: "子", 23: "子", 1: "丑", 24: "丑", 25: "丑", 2: "寅", 3: "寅", 26: "寅",
      27: "寅", 4: "卯", 5: "卯", 28: "卯", 29: "卯", 6: "辰", 7: "辰",
      30: "辰", 8: "巳", 9: "巳", 10: "午", 11: "午", 12: "未", 13: "未",
      14: "申", 15: "申", 16: "酉", 17: "酉", 18: "戌", 19: "戌", 20: "亥", 21: "亥"
    },
    6: {
      // 火六局 (Fire)
      9: "子", 19: "子", 5: "丑", 15: "丑", 25: "丑", 6: "寅", 11: "寅",
      21: "寅", 12: "卯", 17: "卯", 27: "卯", 4: "辰", 18: "辰", 23: "辰",
      10: "巳", 24: "巳", 29: "巳", 2: "午", 16: "午", 30: "午", 8: "未",
      22: "未", 14: "申", 28: "申", 1: "酉", 20: "酉", 7: "戌", 26: "戌", 3: "亥",
      13: "亥"
    },
    5: {
      // 土五局 (Earth)
      7: "子", 4: "丑", 12: "丑", 5: "寅", 9: "寅", 17: "寅", 10: "卯",
      14: "卯", 22: "卯", 3: "辰", 15: "辰", 19: "辰", 27: "辰", 8: "巳",
      20: "巳", 24: "巳", 1: "午", 13: "午", 25: "午", 29: "午", 6: "未",
      18: "未", 30: "未", 11: "申", 23: "申", 16: "酉", 28: "酉", 21: "戌", 2: "亥",
      26: "亥"
    }
  };
  static formation(int number) {
    // Map of numbers to their corresponding elements
    Map<int, String> elementMap = {
      4: '金四局',
      3: '木三局',
      2: '水二局',
      6: '火六局',
      5: '土五局',
    };

    // Return the corresponding value or a default message if not found
    return elementMap[number] ?? 'Element not found';
  }

  static String searchju(String tiangan, String dizhi, int birthDate) {
    // Get the result of elementsResult using tiangan and dizhi
    int ju = elementsResult(tiangan, dizhi);

    // Perform the search in the ziweiDictionary using the calculated ju
    if (ziweiDictionary.containsKey(ju)) {
      if (ziweiDictionary[ju]!.containsKey(birthDate)) {
        return ziweiDictionary[ju]![birthDate]!;
      } else {
        return "Number not found in selected Ju.";
      }
    } else {
      return "Ju not found.";
    }
  }

  static Map<int, List<String>> generateStarMapping(
      String tiangan, String dizhi, int birthDate) {
    // Get the Chinese character from the searchju function using the correct parameters
    String chineseCharacter = searchju(tiangan, dizhi, birthDate);

    // Find the index of the character in zhiMap
    int zhiIndex = zhiMap[chineseCharacter] ?? -1;
    if (zhiIndex == -1)
      return {
        0: ["Invalid character in zhiMap."]
      };

    // Initialize the result map with keys from 1 to 12, each with an empty list
    Map<int, List<String>> result = {for (int i = 1; i <= 12; i++) i: []};

    // Populate from ziweiMap backward
    for (int i = 0; i < ziweiMap.length; i++) {
      int backwardIndex = (zhiIndex - i + result.length) % result.length;
      int mappedIndex =
          backwardIndex == 0 ? 12 : backwardIndex; // Handle zero index
      if (ziweiMap[i].isNotEmpty) {
        result[mappedIndex]!.add(ziweiMap[i]);
      }
    }

    // Determine the starting index for tianfuMap based on the Chinese character
    int tianfuStartPosition = {
          '寅': 1,
          '卯': 12,
          '辰': 11,
          '巳': 10,
          '午': 9,
          '未': 8,
          '申': 7,
          '酉': 6,
          '戌': 5,
          '亥': 4,
          '子': 3,
          '丑': 2
        }[chineseCharacter] ??
        0;

    // Populate from tianfuMap forward, starting from the determined position
    for (int i = 0; i < tianfuMap.length; i++) {
      int forwardIndex = (tianfuStartPosition + i - 1) % result.length + 1;
      if (tianfuMap[i].isNotEmpty) {
        result[forwardIndex]!.add(tianfuMap[i]);
      }
    }

    return result;
  }

  static Map<int, List<String>> combinegods(
      Map<int, List<String>> originalMap, // Positional required
      List<String> wenquList, // Positional required
      {int offset = 0,
      bool includeEmpty = false} // Optional named parameters
      ) {
    if (originalMap.length != 12 || wenquList.length != 12) {
      throw ArgumentError(
          "Both the originalMap and wenquList must have exactly 12 entries.");
    }

    // Example usage of the optional parameters
    for (int i = 0; i < 12; i++) {
      if (wenquList[i].isNotEmpty || includeEmpty) {
        int adjustedIndex = (i + offset) % 12 + 1; // Apply offset if provided
        originalMap[adjustedIndex]!.add(wenquList[i]);
      }
    }

    return originalMap;
  }

  // 非本月的月支 從農曆而來
  static String? extractFromFziMap(String input) {
    // Define the fziMap with the correct mappings
    const Map<String, String> fziMap = {
      '正': '寅',
      '腊': '丑',
      '冬': '子',
      '九': '戌',
      '十': '亥',
      '八': '酉',
      '七': '申',
      '六': '未',
      '五': '午',
      '四': '巳',
      '三': '辰',
      '二': '卯',
    };

    // Extract the character before "月"
    String monthCharacter =
        input.substring(input.indexOf('月') - 1, input.indexOf('月'));

    // Return the corresponding value from fziMap, or null if not found
    return fziMap[monthCharacter];
  }

  // 排宮為
  static List<String> rearrangeList(
      List<String> inputList, String targetString) {
    List<String> predefinedList = [
      '命宮',
      '父母',
      '福德',
      '田宅',
      '官祿',
      '交友',
      '遷移',
      '疾惡',
      '財帛',
      '子女',
      '夫妻',
      '兄弟'
    ];

    // Find the index of the target string in the input list
    int targetIndex = inputList.indexOf(targetString);

    if (targetIndex == -1) {
      throw ArgumentError('Target string not found in input list.');
    }

    List<String> part1 =
        predefinedList.sublist(0, predefinedList.length - targetIndex);
    List<String> part2 =
        predefinedList.sublist(predefinedList.length - targetIndex);

    // Combine the parts to get the desired order
    List<String> rearrangedList = part2 + part1;

    return rearrangedList;
  }

  static List<String> reasonLive(List<String> inputList, String searchWord) {
    // Find the index where the first character of the string matches the searchWord
    int index =
        inputList.indexWhere((element) => element.startsWith(searchWord));

    // If the word is not found, throw an exception
    if (index == -1) {
      throw Exception(
          'The word starting with "$searchWord" was not found in the list.');
    }

    // Replace the found index with "來因" and set all other elements to empty strings
    return List<String>.generate(
        inputList.length, (i) => i == index ? '來因' : '');
  }

  //排身宮 (需要拍宮位先) rearrangeList
  static List<String> rearrangeAndInsert(
      List<String> rearrangedList, String word) {
    // List<String> predefinedList = [
    //   '命宮', '父母', '福德', '田宅', '官祿', '交友',
    //   '遷移', '疾惡', '財帛', '子女', '夫妻', '兄弟'
    // ];

    // Find where to insert '身宮' based on the word
    int insertIndex;
    if (word == '子' || word == '午') {
      insertIndex = rearrangedList.indexOf('命宮');
    } else if (word == '丑' || word == '未') {
      insertIndex = rearrangedList.indexOf('福德');
    } else if (word == '寅' || word == '申') {
      insertIndex = rearrangedList.indexOf('官祿');
    } else if (word == '卯' || word == '酉') {
      insertIndex = rearrangedList.indexOf('遷移');
    } else if (word == '辰' || word == '戌') {
      insertIndex = rearrangedList.indexOf('財帛');
    } else if (word == '巳' || word == '亥') {
      insertIndex = rearrangedList.indexOf('夫妻');
    } else {
      insertIndex = rearrangedList.indexOf('福德');
    }

    // Create a new list with empty strings
    List<String> resultList =
        List.generate(rearrangedList.length, (index) => '');

    // Insert '身宮' at the determined index
    if (insertIndex != -1) {
      resultList[insertIndex] = '身宮';
    }

    return resultList;
  }

  // 排大運

  static List<String> rearrangeLife(List<String> inputList, String targetString,
      List<String> predefinedList) {
    // Find the index of the target string in the input list
    int targetIndex = inputList.indexOf(targetString);

    if (targetIndex == -1) {
      throw ArgumentError('Target string not found in input list.');
    }

    // Calculate the correct index offset, adjusting by predefined list length
    int adjustedIndex =
        (predefinedList.length - targetIndex) % predefinedList.length;

    // Slice the predefinedList into two parts based on the adjustedIndex
    List<String> part1 =
        predefinedList.sublist(adjustedIndex); // From adjustedIndex to the end
    List<String> part2 =
        predefinedList.sublist(0, adjustedIndex); // From start to adjustedIndex

    // Combine the parts to get the desired order
    List<String> rearrangedList = part1 + part2;

    return rearrangedList;
  }

  static String manOrFemale(bool sex, String tiangan) {
    // Determine gender based on the boolean value of 'sex'
    String so = (sex == false)
        ? '女'
        : '男'; // If 'sex' is false, return '男', otherwise '女'

    // Determine the positive or negative association based on 'tiangan'
    String positiveOrNeg = '';
    switch (tiangan) {
      case '甲':
      case '丙':
      case '庚':
      case '壬':
      case '戊':
        positiveOrNeg = '陽';
        break;
      case '乙':
      case '丁':
      case '己':
      case '辛':
      case '癸':
        positiveOrNeg = '陰';
        break;
      default:
        positiveOrNeg = ''; // Handle any unexpected cases
        break;
    }

    // Combine and return the gender and positive/negative association
    return '$positiveOrNeg$so'.trim();
  }
// static List<String> yunStart(String type, int startNumber) {
//   List<String> resultList = [];

//   for (int i = 0; i < 12; i++) {
//     int start = startNumber + i * 10;
//     int end = start + 10;

//     String range = '$start~$end';

//     if (type == '陰男' || type == '陽女') {
//       resultList.add(range); // Add ranges in increasing order
//     } else if (type == '陽男' || type == '陰女') {
//       resultList.insert(0, range); // Insert ranges in reverse order
//     }
//   }

//   if (type == '陽男' || type == '陰女') {
//     return resultList.reversed.toList();
//   }

//   return resultList;
// }

  static List<String> yunStart(String type, int startNumber) {
    List<String> resultList = [];

    for (int i = 0; i < 12; i++) {
      int start = startNumber + i * 10;
      int end = start + 9;

      String range = '$start~$end';

      if (type == '陽男' || type == '陰女') {
        resultList.add(range); // Add ranges in increasing order
      } else if (type == '陰男' || type == '陽女') {
        resultList.insert(0, range); // Insert ranges in reverse order
      }
    }

    if (type == '陰男' || type == '陽女') {
      // Move the last index to the first position
      String last = resultList.removeLast(); // Remove last item
      resultList.insert(0, last); // Insert last item at the first position
    }

    return resultList;
  }

  // 從排列運小到大
  static List<String> sortYunStart(List<String> yunStart) {
    yunStart.sort((a, b) {
      // Split the ranges by '~' to get the starting numbers
      int startA = int.parse(a.split('~')[0]);
      int startB = int.parse(b.split('~')[0]);

      // Compare the starting numbers
      return startA.compareTo(startB);
    });

    return yunStart;
  }

  static List<String> generateLunarGanZhiYears(List<String> liunenNum) {
    // Create a list to store the GanZhi Lunar years
    List<String> lunarYearList = [];

    // Loop through the liunenNum list
    for (String yearStr in liunenNum) {
      // Convert the string year to an integer
      int year = int.parse(yearStr);

      // Create a DateTime for June 1 of the given year
      DateTime updatedDateTime =
          DateTime(year, 6, 1, 12, 0); // June 1, any time

      // Convert the updated DateTime to a Lunar date
      var lunarDate = lunar.Lunar.fromDate(updatedDateTime);

      // Get the Lunar year in GanZhi format
      String lunarYearGanZhi = lunarDate.getYearInGanZhi();

      // Add the GanZhi year to the list
      lunarYearList.add(lunarYearGanZhi);
    }

    // Ensure the list is returned
    return lunarYearList;
  }

  // 算流年用的 數字
  static List<String> generateYearsForRange(
      DateTime combinedDateTime, List<String> ranges, int index) {
    // Get the range at the specified index
    String range = ranges[index];

    // Split the range string (e.g., '4~13') into start and end values
    List<String> rangeParts = range.split('~');
    int start = int.parse(rangeParts[0]);
    int end = int.parse(rangeParts[1]);

    // Create a list to store the years
    List<String> yearList = [];

    // Loop through the range from start to end
    for (int i = start; i <= end; i++) {
      // Add 'i' years to the combinedDateTime year and convert to string
      String yearString = (combinedDateTime.year + i).toString();

      // Add the year to the list
      yearList.add(yearString);
    }

    // Return the list of years
    return yearList;
  }

  // 路權科技
  // Function to map and filter colors
  static Map<int, List<String>> mapColorsToStart(
      Map<int, List<String>> startMapping, String gan) {
    final Map<String, Map<String, String>> ganColorMapping = {
      '甲': {
        '廉貞': '祿',
        '破軍': '權',
        '武曲': '科',
        '太陽': '忌',
      },
      '乙': {
        '天機': '祿',
        '天梁': '權',
        '紫薇': '科',
        '太陰': '忌',
      },
      '丙': {
        '天同': '祿',
        '天機': '權',
        '文昌': '科',
        '廉貞': '忌',
      },
      '丁': {
        '太陰': '祿',
        '天同': '權',
        '天機': '科',
        '巨門': '忌',
      },
      '戊': {
        '貪狼': '祿',
        '太陰': '權',
        '右弼': '科',
        '天機': '忌',
      },
      '己': {
        '武曲': '祿',
        '貪狼': '權',
        '天梁': '科',
        '文曲': '忌',
      },
      '庚': {
        '太陽': '祿',
        '武曲': '權',
        '太陰': '科',
        '天同': '忌',
      },
      '辛': {
        '巨門': '祿',
        '太陽': '權',
        '文曲': '科',
        '文昌': '忌',
      },
      '壬': {
        '天梁': '祿',
        '紫薇': '權',
        '左輔': '科',
        '武曲': '忌',
      },
      '癸': {
        '破軍': '祿',
        '巨門': '權',
        '太陰': '科',
        '貪狼': '忌',
      },
    };
    Map<int, List<String>> resultMapping = {};

    // Iterate through the startMapping and replace stars with their colors
    startMapping.forEach((key, starList) {
      List<String> colorList = [];
      int emptyStringCount = 0;

      for (String star in starList) {
        if (ganColorMapping[gan]!.containsKey(star)) {
          colorList.add(ganColorMapping[gan]![star]!);
        } else {
          if (emptyStringCount < 4) {
            colorList.add('');
            emptyStringCount++;
          }
        }
      }
      resultMapping[key] = colorList;
    });

    return resultMapping;
  }

  // 有無
  static Map<int, List<String>> pwer2(Map<int, List<String>> pwer) {
    // Create a new map to store the modified values
    Map<int, List<String>> newPwer = {};

    // Iterate through the original map
    pwer.forEach((key, value) {
      // Create a new list for each entry, replacing empty strings with '無'
      List<String> newValue =
          value.map((item) => item.isEmpty ? '無' : item).toList();

      // Add the modified list to the new map
      newPwer[key] = newValue;
    });

    return newPwer;
  }

  // 星星旺度
  static Map<int, List<String>> starBrightness(
      Map<int, List<String>> startMapping) {
    // Define your mapping dictionary directly
    Map<int, Map<String, String>> mappingDict = _getMappingDict();

    // Initialize resultMap with empty lists
    Map<int, List<String>> resultMap = {};

    // Iterate over each key in startMapping
    startMapping.forEach((key, values) {
      // Initialize an empty list for the resultMap at the current key
      List<String> resultList = [];

      // Iterate over each value in the list for the current key
      for (String value in values) {
        // Retrieve the mapped value from the mapping dictionary based on the position
        if (mappingDict.containsKey(key) &&
            mappingDict[key]!.containsKey(value)) {
          String mappedValue = mappingDict[key]![value]!;
          if (mappedValue.isNotEmpty) {
            resultList.add(mappedValue);
          }
        }
      }

      // Update resultMap with the resultList for the current key
      resultMap[key] = resultList;
    });

    return resultMap;
  }

  static Map<int, Map<String, String>> _getMappingDict() {
    // Define your mapping dictionaries directly here
    return {
      1: {
        "廉貞": "廟",
        "天府": "廟",
        "巨門": "廟",
        "天相": "廟",
        "天梁": "廟",
        "七殺": "廟",
        "祿存": "廟",
        "火星": "廟",
        "鈴星": "廟",
        '天同': '利',
        '紫薇': '旺',
        '天機': '得',
        '太陰': '旺',
        '太陽': '旺',
        '武曲': '得',
        '破軍': '得',
        '貪狼': '平',
        '文曲': '平',
        '文昌': '平',
        '陀羅': '平',
        '右弼': '旺',
        '恩光': '平',
        '天月': '無',
        '封誥': '無',
        '陰煞': '無',
        '孤辰': '平',
        '解神': '廟',
        '八座': '廟',
        '天福': '旺',
        '天巫': '無',
        '天官': '平',
        '地劫': '平',
        '天才': '廟',
        '截空': '陷',
        '龍池': '平',
        '天刑': '廟',
        '三臺': '平',
        '天壽': '旺',
        '天廚': '無',
        '蜚廉': '無',
        '天德': '旺',
        '天貴': '平',
        '地空': '陷',
        '天姚': '旺',
      },

      //  太陰 不確定
      2: {
        "太陽": "廟",
        "巨門": "廟",
        "天梁": "廟",
        "祿存": "廟",
        "紫薇": "旺",
        "天機": "旺",
        "七殺": "旺",
        "文曲": "旺",
        "天府": "得",
        "武曲": "利",
        "貪狼": "利",
        "文昌": "利",
        "火星": "利",
        "鈴星": "利",
        "廉貞": "平",
        '天相': '陷',
        '破軍': '陷',
        '擎羊': '陷',
        '太陰': '陷',
        '八座': '旺',
        '天官': '旺',
        '天福': '平',
        '咸池': '平',
        '天刑': '廟',
        '龍池': '廟',
        '天貴': '旺',
        '天哭': '廟',
        '天姚': '廟',
        '天魁': '廟',
        '截空': '平',
        '天月': '無',
        '天德': '平',
        '恩光': '廟',
        '天喜': '旺',
        '左輔': '陷',
        '臺輔': '無',
      },
      3: {
        '武曲': '廟',
        '天府': '廟',
        '貪狼': '廟',
        '天梁': '廟',
        '七殺': '廟',
        '擎羊': '廟',
        '陀羅': '廟',
        '太陽': '旺',
        '破軍': '旺',
        '紫薇': '得',
        '天相': '得',
        '文昌': '得',
        '文曲': '得',
        '天機': '利',
        '廉貞': '利',
        '天同': '平',
        '太陰': '陷',
        '巨門': '陷',
        '火星': '陷',
        '鈴星': '陷',
        '神解': '廟',
        '天哭': '平',
        '天壽': '廟',
        '天才': '陷',
        '右弼': '廟',
        '紅鸞': '廟',
        '旬空': '陷',
        '臺輔': '無',
        '天貴': '旺',
        '天虛': '陷',
        '地空': '陷',
        '陰煞': '無',
        '天喜': '陷',
        '八座': '旺',
        '寡宿': '陷',
        '鳳閣': '陷',
        '封誥': '無',
        '年解': '廟',
        '天月': '無',
      },
      4: {
        '天同': '廟',
        '文昌': '廟',
        '文曲': '廟',
        '祿存': '廟',
        '紫薇': '旺',
        '太陽': '旺',
        '巨門': '旺',
        '天府': '得',
        '天相': '得',
        '火星': '得',
        '鈴星': '得',
        '天機': '平',
        '武曲': '平',
        '七殺': '平',
        '破軍': '平',
        '廉貞': '陷',
        '太陰': '陷',
        '貪狼': '陷',
        '天梁': '陷',
        '陀羅': '陷',
        '地劫': '不',
        '地空': '廟',
        '天刑': '陷',
        '天巫': '無',
        '孤辰': '陷',
        '天馬': '平',
        '天壽': '平',
        '天虛': '旺',
        '破碎': '陷',
        '蜚廉': '無',
        '天才': '廟',
        '天哭': '不',
        '封誥': '無',
        '天廚': '無',
        '龍池': '陷',
        '天魁': '無',
        '天鉞': '旺',
        '紅鸞': '旺',
        '天姚': '平',
        '鳳閣': '廟',
        '年解': '旺',
        '截空': '廟',
        '右弼': '平',
        '天福': '旺',
      },
      5: {
        '紫薇': '廟',
        '天機': '廟',
        '天相': '廟',
        '天梁': '廟',
        '破軍': '廟',
        '火星': '廟',
        '鈴星': '廟',
        '太陽': '旺',
        '武曲': '旺',
        '天府': '旺',
        '貪狼': '旺',
        '巨門': '旺',
        '七殺': '旺',
        '廉貞': '平',
        '太陰': '不',
        '天同': '陷',
        '文昌': '陷',
        '文曲': '陷',
        '擎羊': '陷',
        '天壽': '平',
        '龍池': '陷',
        '天才': '旺',
        '八座': '旺',
        '祿存': '廟',
        '天喜': '廟',
        '天貴': '廟',
        '左輔': '旺',
        '咸池': '陷',
        '天姚': '平',
        '天福': '平',
        '天空': '廟',
        '地劫': '廟',
        '右弼': '旺',
        '陰煞': '無',
        '三臺': '旺',
        '天廚': '無',
        '天鉞': '無',
      },
      6: {
        '紫薇': '廟',
        '武曲': '廟',
        '天府': '廟',
        '貪狼': '廟',
        '七殺': '廟',
        '擎羊': '廟',
        '陀羅': '廟',
        '天梁': '旺',
        '破軍': '旺',
        '文曲': '旺',
        '太陽': '得',
        '天相': '得',
        '廉貞': '利',
        '火星': '利',
        '文昌': '利',
        '鈴星': '利',
        '太陰': '不',
        '天同': '不',
        '巨門': '不',
        '天機': '陷',
        '天鉞': '旺',
        '天喜': '陷',
        '天貴': '旺',
        '天姚': '旺',
        '天哭': '平',
        '華蓋': '陷',
        '鳳閣': '陷',
        '三臺': '廟',
        '龍池': '廟',
        '八座': '平',
        '年解': '得',
        '天虛': '陷',
        '寡宿': '不',
        '恩光': '旺',
        '天德': '廟',
        '天月': '無',
        '蜚廉': '無',
        '天才': '平',
        '截空': '無',
        '天空': '陷',
      },
      7: {
        '廉貞': '廟',
        '巨門': '廟',
        '天相': '廟',
        '七殺': '廟',
        '祿存': '廟',
        '紫薇': '旺',
        '天機': '得',
        '太陽': '得',
        '武曲': '得',
        '天府': '得',
        '破軍': '得',
        '文昌': '得',
        '文曲': '得',
        '太陰': '得',
        '貪狼': '平',
        '陀羅': '陷',
        '火星': '陷',
        '鈴星': '陷',
        '天馬': '旺',
        '天貴': '陷',
        '鳳閣': '不',
        '天同': '旺',
        '天梁': '陷',
        '旬空': '廟',
        '天虛': '廟',
        '封誥': '無',
        '年解': '利',
        '三臺': '旺',
        '解神': '不',
        '天鉞': '廟',
        '華蓋': '無',
        '天廚': '無',
        '天壽': '旺',
        '地空': '廟',
        '天喜': '旺',
        '右弼': '不',
        '天哭': '廟',
        '天巫': '無',
        '左輔': '平',
        '地劫': '廟',
        '孤辰': '平',
        '八座': '廟',
        '臺輔': '不',
      },
      8: {
        '巨門': '廟',
        '文昌': '廟',
        '文曲': '廟',
        '祿存': '廟',
        '紫薇': '旺',
        '天機': '旺',
        '天府': '旺',
        '太陰': '旺',
        '七殺': '旺',
        '天梁': '得',
        '火星': '得',
        '鈴星': '得',
        '貪狼': '利',
        '武曲': '利',
        '太陽': '平',
        '天同': '平',
        '廉貞': '平',
        '天相': '陷',
        '破軍': '陷',
        '擎羊': '陷',
        '天姚': '廟',
        '破碎': '平',
        '大耗': '不',
        '天刑': '廟',
        '天才': '旺',
        '天官': '平',
        '截空': '廟',
        '地劫': '平',
        '天虛': '旺',
        '鳳閣': '廟',
        '天鉞': '廟',
        '年解': '旺',
        '蜚廉': '無',
        '臺輔': '無',
        '龍池': '廟',
        '左輔': '陷',
        '紅鸞': '旺',
        '地空': '廟',
        '右弼': '陷',
        // '解神': '陷',
      },
      9: {
        '武曲': '廟',
        '天府': '廟',
        '貪狼': '廟',
        '天梁': '廟',
        '七殺': '廟',
        '擎羊': '廟',
        '陀羅': '廟',
        '火星': '廟',
        '鈴星': '廟',
        '太陰': '旺',
        '破軍': '旺',
        '紫薇': '得',
        '天相': '得',
        '天機': '利',
        '廉貞': '利',
        '天同': '平',
        '太陽': '不',
        '巨門': '陷',
        '文曲': '陷',
        '文昌': '陷',
        '陰煞': '無',
        '蜚廉': '無',
        '華蓋': '平',
        '右弼': '廟',
        '天月': '無',
        '左輔': '廟',
        '天喜': '陷',
        '寡宿': '陷',
        '解神': '廟',
        '天官': '平',
        '天才': '陷',
        '三臺': '旺',
        '紅鸞': '陷',
        '旬空': '陷',
        '天刑': '廟',
        '龍池': '陷',
        '天貴': '旺',
      },
      10: {
        '天同': '廟',
        '太陰': '廟',
        '祿存': '廟',
        '紫薇': '旺',
        '巨門': '旺',
        '文曲': '旺',
        '天相': '得',
        '天府': '得',
        '文昌': '得',
        '火星': '利',
        '鈴星': '利',
        '天機': '平',
        '武曲': '平',
        '七殺': '平',
        '破軍': '平',
        '太陽': '陷',
        '廉貞': '陷',
        '貪狼': '陷',
        '天梁': '陷,',
        '陀羅': '陷',
        '三臺': '平',
        '劫煞': '無',
        '地空': '陷',
        '天月': '無',
        '年解': '得',
        '鳳閣': '旺',
        '截空': '陷',
        '天刑': '陷',
        '天福': '廟',
        '天馬': '平',
        '天魁': '旺',
        '天喜': '旺',
        '孤辰': '陷',
        '天虛': '平',
        '封誥': '無',
        '天官': '旺',
        '天壽': '旺',
      },
      11: {
        '天機': '廟',
        '天府': '廟',
        '太陰': '廟',
        '天相': '廟',
        '天梁': '廟',
        '破軍': '廟',
        '祿存': '廟',
        '武曲': '旺',
        '天同': '旺',
        '文昌': '得',
        '文曲': '得',
        '貪狼': '旺',
        '巨門': '旺',
        '七殺': '旺',
        '紫薇': '平',
        '廉貞': '平',
        '太陽': '陷',
        '擎羊': '陷',
        '火星': '陷',
        '火鈴': '陷',
        '臺輔': '無',
        '左輔': '旺',
        '截空': '陷',
        '咸池': '陷',
        '封誥': '無',
        '三臺': '平',
        '天魁': '旺',
        '紅鸞': '廟',
        '恩光': '平',
        '天貴': '廟',
        '八座': '陷',
        '鳳閣': '廟',
        '天壽': '平',
        '旬空': '陷',
        '解神': '廟',
        '蜚廉': '無',
        '年解': '廟',
        '天虛': '陷',
        '陰煞': '無',
        '天哭': '平',
      },
      12: {
        '紫薇': '廟',
        '武曲': '廟',
        '天府': '廟',
        '太陰': '廟',
        '貪狼': '廟',
        '天相': '廟',
        '七殺': '廟',
        '文昌': '廟',
        '文曲': '廟',
        '擎羊': '廟',
        '陀羅': '廟',
        '天梁': '旺',
        '破軍': '旺',
        '火星': '得',
        '鈴星': '得',
        '廉貞': '利',
        '太陽': '不',
        '天同': '不',
        '巨門': '不',
        '天機': '陷',
        '紅鸞': '陷',
        '寡宿': '平',
        '天魁': '旺',
        '天姚': '平',
        '恩光': '廟',
        '地空': '陷',
        '華蓋': '陷',
        '破碎': '陷',
        '臺輔': '無',
        '天刑': '陷',
        '天哭': '廟',
        '地劫': '陷',
      }
    };
  }

  // 算小線與流年之前 大限必須準 大限的func 'yunStart'
  static List<String> generateSequence(String input, bool forward) {
    List<String> sequence = [
      '1,13,25,37,49,61,73',
      '2,14,26,38,50,62,74',
      '3,15,27,39,51,63,75',
      '4,16,28,40,52,64,76',
      '5,17,29,41,53,65,77',
      '6,18,30,42,54,66,78',
      '7,19,31,43,55,67,79',
      '8,20,32,44,56,68,80',
      '9,21,33,45,57,69,81',
      '10,22,34,46,58,70,82',
      '11,23,35,47,59,71,83',
      '12,24,36,48,60,72,84',
    ];

    List<String> result =
        List.filled(12, ''); // Initialize list with 12 empty strings
    int startIndex;

    // Map input to starting index
    switch (input) {
      case '巳':
      case '酉':
      case '丑':
        startIndex = 6;
        break;
      case '亥':
      case '卯':
      case '未':
        startIndex = 12;
        break;
      case '寅':
      case '午':
      case '戌':
        startIndex = 3;
        break;
      case '申':
      case '子':
      case '辰':
        startIndex = 9;
        break;
      default:
        throw Exception("Invalid input");
    }

    // Subtract 1 to correct the starting position offset
    startIndex = (startIndex - 1) % 12;

    if (forward) {
      for (int i = 0; i < 12; i++) {
        int pos = (startIndex + i) % 12;
        result[pos] = sequence[i];
      }
    } else {
      for (int i = 0; i < 12; i++) {
        int pos = (startIndex - i + 12) % 12;
        result[pos] = sequence[i];
      }
    }

    return result;
  }

  // 大限
  static List<String> dayuncombine(List<String> list1, List<String> list2) {
    List<String> combinedList = [];

    for (int i = 0; i < list1.length && i < list2.length; i++) {
      combinedList.add('${list2[i]}${list1[i]}');
    }

    return combinedList;
  }

  // // 大限
  // static List<String> daxianeList(List<String> originalList, String target) {
  //   int targetIndex = originalList.indexOf(target);
  //   if (targetIndex == -1) {
  //     // If target not found, return the list unchanged
  //     return originalList;
  //   }

  //   // Split the list into two parts: from the target to the end, and from the start to just before the target
  //   List<String> rearrangedList = [
  //     ...originalList.sublist(targetIndex),
  //     ...originalList.sublist(0, targetIndex)
  //   ];

  //   return rearrangedList;
  // }

  static List<String> daxianeList(
      List<String> originalList, String target, String type) {
    int targetIndex = originalList.indexOf(target);
    if (targetIndex == -1) {
      // If target not found, return the list unchanged
      return originalList;
    }

    // Case 1: If type is '陽男' or '陰女', rearrange the list from the target to the end in normal order
    if (type == '陽男' || type == '陰女') {
      List<String> rearrangedList = [
        ...originalList.sublist(targetIndex), // From target to end
        ...originalList.sublist(
            0, targetIndex) // From start to just before target
      ];
      return rearrangedList;
    }

    // Case 2: If type is '陰男' or '陽女', rearrange the list from the target to the start in reverse order
    else {
      List<String> rearrangedList = [
        ...originalList
            .sublist(0, targetIndex + 1)
            .reversed, // From start to target, in reverse order
        ...originalList
            .sublist(targetIndex + 1)
            .reversed // From target to end, in reverse order
      ];
      return rearrangedList;
    }
  }

  // daxianIndex
  // daxianIndex
  static List<int> daxianIndex(List<String> items, String target, String type) {
    // Find the index of the target string
    int startIndex = items.indexOf(target);

    // If the target is not found, return an empty list or handle it as needed
    if (startIndex == -1) {
      return [];
    }

    List<int> result = [];

    // Case 1: If type is '陽男' or '陰女', generate the index list in normal order
    if (type == '陽男' || type == '陰女') {
      for (int i = 0; i < items.length; i++) {
        result.add(
            (startIndex + i) % items.length); // Normal order, wrapping around
      }
    }
    // Case 2: If type is '陰男' or '陽女', generate the index list in reverse order
    else {
      for (int i = 0; i < items.length; i++) {
        result.add((startIndex - i + items.length) %
            items.length); // Reverse order, wrapping around
      }
    }

    return result;
  }

  // Define the zhiMap as a constant
  static const Map<String, int> dex = {
    '寅': 0,
    '卯': 1,
    '辰': 2,
    '巳': 3,
    '午': 4,
    '未': 5,
    '申': 6,
    '酉': 7,
    '戌': 8,
    '亥': 9,
    '子': 10,
    '丑': 11,
  };

// Function to get the index of the last character from zhiMap
  static int getZhiIndex(String input) {
    // Get the last character of the input string
    String lastChar = input[input.length - 1];

    // Return the corresponding value from the zhiMap or -1 if not found
    return dex[lastChar] ?? -1;
  }

  // 算流月用
  // Function to count steps from '命宮' within a list, moving from left to right
  static int countStepsFromMingGong(List<String> rearrangeList) {
    int mingGongIndex = rearrangeList.indexOf('命宮');
    if (mingGongIndex == -1) {
      throw Exception('命宮 not found in the list');
    }

    // Count steps from '命宮' to the beginning (which is index 0)
    int steps = (rearrangeList.length - mingGongIndex) % rearrangeList.length;
    return steps;
  }

  // // Second function: Insert predefinedList starting from '戌' position + steps
  // static List<String> insertPredefinedList(int steps, String zhi) {
  //   List<String> predefinedList = [
  //     '正月',
  //     '二月',
  //     '三月',
  //     '四月',
  //     '五月',
  //     '六月',
  //     '七月',
  //     '八月',
  //     '九月',
  //     '十月',
  //     '冬月',
  //     '臘月',
  //   ];

  //   int zhiIndex = zhiList.indexOf(zhi);
  //   if (zhiIndex == -1) {
  //     throw Exception('$zhi not found in the zhiList');
  //   }

  //   // Create a new list to hold the result
  //   List<String> result = List.from(zhiList);

  //   // Start inserting from the position (zhiIndex + steps) and wrap around
  //   for (int i = 0; i < predefinedList.length; i++) {
  //     int insertIndex = (zhiIndex + steps + i) % zhiList.length;
  //     result[insertIndex] = predefinedList[i];
  //   }

  //   return result;
  // }

  static List<String> insertPredefinedList(int steps, String zhi) {
    // Check if zhi is empty
    if (zhi.isEmpty) {
      return List.filled(12, ''); // Return a list of 12 empty strings
    }

    List<String> predefinedList = [
      '正月',
      '二月',
      '三月',
      '四月',
      '五月',
      '六月',
      '七月',
      '八月',
      '九月',
      '十月',
      '冬月',
      '臘月',
    ];

    int zhiIndex = zhiList.indexOf(zhi);
    if (zhiIndex == -1) {
      throw Exception('$zhi not found in the zhiList');
    }

    // Create a new list to hold the result
    List<String> result = List.from(zhiList);

    // Start inserting from the position (zhiIndex + steps) and wrap around
    for (int i = 0; i < predefinedList.length; i++) {
      int insertIndex = (zhiIndex + steps + i) % zhiList.length;
      result[insertIndex] = predefinedList[i];
    }

    return result;
  }

  //換宮位
  //example: 父之父
  static List<String> generateList(int index, List<String> inputList) {
    // Predefined list as mentioned
    List<String> predefinedList = [
      '',
      '父',
      '福',
      '田',
      '官',
      '友',
      '遷',
      '疾',
      '財',
      '子',
      '夫',
      '兄'
    ];

    // Initialize the new list to fill with results
    List<String> newList = List<String>.filled(12, '');

    // Get the first character of the string at the specified index
    String firstChar = inputList[index][0]; // '遷' from '遷移', for example

    // Loop for positions before the index (append from the end of predefinedList)
    int predefinedBackwardIndex = predefinedList.length - 1;
    for (int i = index - 1; i >= 0; i--) {
      if (predefinedList[predefinedBackwardIndex].isNotEmpty) {
        newList[i] = '$firstChar之${predefinedList[predefinedBackwardIndex]}';
      }
      predefinedBackwardIndex--;
    }

    // Loop for positions after the index (append from the beginning of predefinedList)
    int predefinedForwardIndex =
        1; // Start from '父' (ignoring the first empty string)
    for (int i = index + 1; i < newList.length; i++) {
      if (predefinedList[predefinedForwardIndex].isNotEmpty) {
        newList[i] = '$firstChar之${predefinedList[predefinedForwardIndex]}';
      }
      predefinedForwardIndex++;
    }

    return newList;
  }
}
