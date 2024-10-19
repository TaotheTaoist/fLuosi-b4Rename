

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Isar using NewMemberDatabase
//   final isar = await NewMemberDatabase.initialize();

//   runApp(MainApp(isar: isar));
// }

// class MainApp extends StatelessWidget {
//   final Isar isar;

//   const MainApp({super.key, required this.isar});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: const Color.fromARGB(
//             255, 240, 240, 240), // Set your desired scaffold background color
//         primaryColor: const Color.fromARGB(
//             255, 127, 189, 218), // Set your desired primary color
//         appBarTheme: const AppBarTheme(
//           backgroundColor:
//               Color.fromARGB(255, 78, 164, 255), // Set AppBar background color
//           titleTextStyle: TextStyle(
//             color: Colors.white, // Set title text color
//             fontSize: 20,
//           ),
//         ),
//       ),
//       builder: (context, child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(
//             textScaler:
//                 TextScaler.linear(1.0), // Fix text scaling to 1.0 (no scaling)
//           ),
//           child: child!,
//         );
//       },
//       home: SplashScreen(), // Set the splash screen as the home screen
//       routes: {
//         '/home': (context) => HomePage(isar: isar), // Your actual home screen
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart';
// import 'package:learn1/splash_screent.dart';
// import 'new_member.dart';
// import 'package:learn1/lunarCal/lunar_date_screen.dart';
// import 'home_page.dart';
// import 'package:learn1/lang/languageProvider.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Isar using NewMemberDatabase
//   final isar = await NewMemberDatabase.initialize();

//   runApp(MainApp(isar: isar));
// }

// class MainApp extends StatelessWidget {
//   final Isar isar;

//   const MainApp({super.key, required this.isar});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => LanguageProvider(), // Provide the LanguageProvider
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           scaffoldBackgroundColor: const Color.fromARGB(
//               255, 240, 240, 240), // Set your desired scaffold background color
//           primaryColor: const Color.fromARGB(
//               255, 127, 189, 218), // Set your desired primary color
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Color.fromARGB(
//                 255, 78, 164, 255), // Set AppBar background color
//             titleTextStyle: TextStyle(
//               color: Colors.white, // Set title text color
//               fontSize: 20,
//             ),
//           ),
//         ),
//         builder: (context, child) {
//           return MediaQuery(
//             data: MediaQuery.of(context).copyWith(
//               textScaler: TextScaler.linear(
//                   1.0), // Fix text scaling to 1.0 (no scaling)
//             ),
//             child: child!,
//           );
//         },
//         home: SplashScreen(), // Set the splash screen as the home screen
//         routes: {
//           '/home': (context) => HomePage(isar: isar), // Your actual home screen
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:learn1/splash_screent.dart';
import 'new_member.dart';

import 'home_page.dart';
import 'package:learn1/lang/languageProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar using NewMemberDatabase
  final isar = await NewMemberDatabase.initialize();

  runApp(MainApp(isar: isar));
}

class MainApp extends StatelessWidget {
  final Isar isar;

  const MainApp({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(), // Provide the LanguageProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(
              255, 240, 240, 240), // Set your desired scaffold background color
          primaryColor: const Color.fromARGB(
              255, 127, 189, 218), // Set your desired primary color
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(
                255, 78, 164, 255), // Set AppBar background color
            titleTextStyle: TextStyle(
              color: Colors.white, // Set title text color
              fontSize: 20,
            ),
          ),
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(
                  1.0), // Fix text scaling to 1.0 (no scaling)
            ),
            child: child!,
          );
        },
        home: SplashScreen(), // Set the splash screen as the home screen
        routes: {
          '/home': (context) => HomePage(isar: isar), // Your actual home screen
        },
      ),
    );
  }
}
