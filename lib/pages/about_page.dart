import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("EV Charging App",
              style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [
            Text(
              "About the EV Charging App",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
