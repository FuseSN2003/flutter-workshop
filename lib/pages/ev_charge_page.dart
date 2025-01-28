import 'package:flutter/material.dart';

class EvChargePage extends StatefulWidget {
  const EvChargePage({super.key});

  @override
  State<EvChargePage> createState() => _EvChargePageState();
}

class _EvChargePageState extends State<EvChargePage> {
  final _currentSoc = TextEditingController();
  final _targetSoc = TextEditingController();
  final _chargingRate = TextEditingController();
  final _volt = TextEditingController();
  final _batCapacity = TextEditingController();
  final _efficiency = TextEditingController();

  String _chargingPower = "";
  String _chargingTime = "";

  @override
  void dispose() {
    _currentSoc.dispose();
    _targetSoc.dispose();
    _chargingRate.dispose();
    _volt.dispose();
    _batCapacity.dispose();
    _efficiency.dispose();
    super.dispose();
  }

  void calculate() {
    final currentSoc = double.parse(_currentSoc.text);
    final targetSoc = double.parse(_targetSoc.text);
    final chargingRate = double.parse(_chargingRate.text);
    final volt = double.parse(_volt.text);
    final chargingPower = chargingRate * volt;
    final batCapacity = double.parse(_batCapacity.text);
    final efficiency = double.parse(_efficiency.text);

    final batCapacityAh = (batCapacity * 1000) / volt;
    final chargingTime = batCapacityAh *
        (targetSoc - currentSoc) /
        100 /
        (chargingRate * efficiency);

    setState(() {
      _chargingPower = chargingPower.toStringAsFixed(2);
      _chargingTime = chargingTime.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("EV Charging App",
              style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [
            Image.network(
                "https://blog.evbox.com/hs-fs/hubfs/electric-car-power-charging.jpg?width=1920&name=electric-car-power-charging.jpg"),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                      surfaceTintColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text("Current SOC (%)"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: _currentSoc,
                                    decoration: const InputDecoration(
                                        hintText: "Enter SOC %",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                  ),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Target SOC (%)"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: _targetSoc,
                                    decoration: const InputDecoration(
                                        hintText: "Enter SOC %"),
                                  ),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Charging Rate (A)"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: _chargingRate,
                                    decoration: const InputDecoration(
                                        hintText: "Enter Charging Rate (A)"),
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: 10),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("Voltage (V)"),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: SizedBox(
                              width: 250,
                              child: TextField(
                                controller: _volt,
                                decoration: const InputDecoration(
                                    hintText: "Enter Voltage (V)"),
                              ),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Charging Power (W):"),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: SizedBox(
                              width: 250,
                              child: Text(_chargingPower.toString()),
                            ))
                          ],
                        )
                      ],
                    ),
                  )),
                  const SizedBox(height: 10),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("Battery Capacity (kWh)"),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: SizedBox(
                              width: 250,
                              child: TextField(
                                controller: _batCapacity,
                                decoration: const InputDecoration(
                                    hintText: "Enter Battery Capacity (kWh)"),
                              ),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Efficiency (%)"),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: SizedBox(
                              width: 250,
                              child: TextField(
                                controller: _efficiency,
                                decoration: const InputDecoration(
                                    hintText: "Enter Efficiency (%)"),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  )),
                  ElevatedButton(
                      onPressed: calculate, child: const Text("Calculate")),
                  Text("Charging Time: $_chargingTime")
                ],
              ),
            )
          ],
        ));
  }
}
