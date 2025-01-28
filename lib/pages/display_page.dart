import 'package:flutter/material.dart';

class DisplayPageArguments {
  DisplayPageArguments({required this.name, required this.age});

  final String name;
  final int age;
}

class DisplayPage extends StatefulWidget {
  final String? name;
  final int? age;

  const DisplayPage({super.key, this.name, this.age});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    final DisplayPageArguments args =
        ModalRoute.of(context)!.settings.arguments as DisplayPageArguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text("EV Charging App",
              style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Welcome ${args.name}, you are ${args.age} years old",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
