import 'package:ev_charging_app/pages/display_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _output = "";

  final _name = TextEditingController();
  final _age = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    super.dispose();
  }

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
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                    hintText: "Enter your name", labelText: "Name"),
              ),
              TextField(
                controller: _age,
                decoration: const InputDecoration(
                    hintText: "Enter your age", labelText: "Age"),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _output = "Hi, ${_name.text}";
                    });
                  },
                  child: const Text("Say Hi")),
              Text(_output),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/about");
                },
                child: const Text("Go to about page"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/ev_charge");
                },
                child: const Text("Charge"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/display",
                      arguments: DisplayPageArguments(
                          name: _name.text, age: int.parse(_age.text)),
                    );
                  },
                  child: const Text("Display Info")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/list_view");
                  },
                  child: const Text("List View Page")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/future");
                  },
                  child: const Text("Go to the future"))
            ],
          ),
        ));
  }
}
