import 'package:ev_charging_app/pages/ev_charge_page.dart';
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
        home: const EvChargePage());
  }
}
