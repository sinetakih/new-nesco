import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/provider/vin_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> items = const ["ereuyryer", "erefrerferfe", "erfefref"];

  @override
  Widget build(BuildContext context) {
    return Consumer<VinProvider>(builder: (context, vinData, child) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Hi Danny,",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
            ),
            const Text(
              "Let’s keep your vehicle in shape,",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            Container(
              width: 400,
              height: 156,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.car_crash),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            "   My Garage",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Image.asset("assets/image/venza3.png")
                    ],
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Manage",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      const Text(
                        "Currently requesting for :",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${vinData.vinResponse.year} ${vinData.vinResponse.make} ${vinData.vinResponse.model}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        vinData.vinResponse.trim,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "What would you want today?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                          child: const Text("montero"),
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        child: const Text("montero"),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                          child: const Text("montero"),
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        child: const Text("montero"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
