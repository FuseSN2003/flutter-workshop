import 'package:ev_charging_app/pages/about_page.dart';
import 'package:ev_charging_app/pages/ev_charge_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String _output = "";

  // final _name = TextEditingController();

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
              // ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         _output = Random().nextInt(100).toString();
              //       });
              //     },
              //     child: const Text("Random Number")),
              // Text(_output),
              // TextField(
              //   controller: _name,
              //   decoration: const InputDecoration(
              //       hintText: "Enter your name", labelText: "Name"),
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         _output = "Hi, ${_name.text}";
              //       });
              //     },
              //     child: const Text("Say Hi")),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child: const Text("Go to about page"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EvChargePage()));
                },
                child: const Text("Charge"),
              )
            ],
          ),
        ));
  }
}
