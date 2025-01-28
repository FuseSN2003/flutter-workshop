import 'package:ev_charging_app/pages/about_page.dart';
import 'package:ev_charging_app/pages/display_page.dart';
import 'package:ev_charging_app/pages/ev_charge_page.dart';
import 'package:ev_charging_app/pages/list_view_page.dart';
import 'package:ev_charging_app/pages/my_futurebuilder_page.dart';
import 'package:ev_charging_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EV Charging App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red),
      ),
      routes: {
        '/': (context) => const WelcomePage(),
        '/display': (context) => const DisplayPage(),
        '/about': (context) => const AboutPage(),
        '/ev_charge': (context) => const EvChargePage(),
        '/list_view': (context) => const ListViewPage(),
        '/future': (context) => const MyFutureBuilderPage()
      },
    );
  }
}
