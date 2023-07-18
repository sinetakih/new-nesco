import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/model/api/vin.model.dart';
import 'package:nesco/provider/vin_provider.dart';
import 'package:nesco/screens/HomeNavigation.dart';
import 'package:nesco/screens/homescreen.dart';
import 'package:provider/provider.dart';

import '../core/enums.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final TextEditingController regNumberController = TextEditingController();

  final TextEditingController vinController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    regNumberController.dispose();
    vinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VinProvider>(builder: (context, vinData, child) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Add Vehicle",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Please input your vehicle details",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 34),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Vehicle Reg No."),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: regNumberController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kBgColor,
                      hintText: 'Ex. NW 905 AG',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("VIN Number / Chassis Number"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: vinController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kBgColor,
                      hintText: 'Ex. SV30-0169266',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 55,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (vinData.state == AppState.submitting) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Submitting")));
                      } else if (vinData.state == AppState.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Success")));
                      } else if (vinData.state == AppState.error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                vinData.errorMessage ?? "An error occurred")));
                      }

                      VinRequest vinRequest =
                          VinRequest(vin: vinController.text.trim());
                      try {
                        VinResponse vinR = await vinRequest.getVin();
                        vinR.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeNavigation()));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.toString().substring(
                                    11) // to remove the Exception: part
                                )));
                        print(e);
                      }
                      // await vinData.getVin(parameters).then((value) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const HomeScreen()));
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Add Vehicle'),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have your details handy?"),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeNavigation()));
                        },
                        child: const Text(
                          " Skip Now",
                          style: TextStyle(color: kPrimaryColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
