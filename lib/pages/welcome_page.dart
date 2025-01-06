import 'dart:math';

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _output = "";

  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("EV Charging App",
              style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Welcome to the EV Charging App",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _output = Random().nextInt(100).toString();
                    });
                  },
                  child: const Text("Random Number")),
              Text(_output),
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                    hintText: "Enter your name", labelText: "Name"),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _output = "Hi, ${_name.text}";
                    });
                  },
                  child: const Text("Say Hi"))
            ],
          ),
        ));
  }
}
