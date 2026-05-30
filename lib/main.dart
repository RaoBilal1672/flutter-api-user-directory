import 'package:flutter/material.dart';
import 'screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'User Directory',

      theme: ThemeData(

        //Color scheme

        primarySwatch: Colors.blue,
        brightness: Brightness.light,

        colorScheme: const ColorScheme.light(

          primary: Color(0xFF2563EB),
          secondary: Color(0xFF3B82F6),

          surface: Color(0xFFF8FAFC),
        ),

        //AppBar theme

        appBarTheme: const AppBarTheme(

          elevation: 0,
          centerTitle: false,

          backgroundColor: Color(0xFF2563EB),
          foregroundColor: Colors.white,

          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
        ),

        //Card theme

        cardTheme: CardThemeData(

          elevation: 2,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),

          clipBehavior: Clip.antiAlias,
        ),

        //ListTile theme

        listTileTheme: const ListTileThemeData(

          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),

          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(12)),
          ),
        ),

        //Text theme

        textTheme: const TextTheme(

          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF1E293B),
          ),

          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFF334155),
          ),

          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        //Scaffold background

        scaffoldBackgroundColor:
        const Color(0xFFF8FAFC),

        //Icon theme

        iconTheme: const IconThemeData(
          color: Color(0xFF475569),
        ),
      ),

      home: const UserScreen(),
    );
  }
}