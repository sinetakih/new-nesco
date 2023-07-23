import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/model/api/vin.model.dart';
import 'package:nesco/provider/vin_provider.dart';
import 'package:nesco/screens/schedule_details.dart';
import 'package:nesco/screens/service_details.dart';

import 'package:nesco/screens/widgets/home_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = const ["ereuyryer", "erefrerferfe", "erfefref"];
  late VinResponse? vin1;
  bool hasData = false;

  getvini() async {
    VinResponse? v = await VinResponse.getFirstVin();
    if (v!.isNotEmpty) {
      setState(() {
        hasData = true;
        vin1 = v;
      });
    }
  }

  @override
  void initState() {
    getvini();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VinProvider>(builder: (context, vinData, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 55,
                        ),
                        Text(
                          "Hi Danny!",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Let’s keep your vehicle in shape",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Icon(
                          CupertinoIcons.bell_fill,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 360,
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
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                CupertinoIcons.car_detailed,
                                size: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              "   My Garage",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato-Bold',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/image/venza3.png",
                            width: 135,
                            height: 84,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 60,
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
                        hasData
                            ? Text(
                                "${vin1!.make}", // ${vin1.year} ${vin1.make}: adding all here won't display well
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )
                            : const Text(
                                "No Vehicle added",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'What',
                          style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' would you want today?',
                                style: TextStyle(
                                    fontFamily: 'Lato-Regular',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal))
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceDetails(),
                          ),
                        );
                      },
                      child: HomeCard(
                        inspectionText: "Inspection",
                        amount: "10,000XAF",
                        icon: CupertinoIcons.text_badge_checkmark,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScheduleDetails(),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScheduleDetails(),
                            ),
                          );
                        },
                        child: HomeCard(
                          inspectionText: "Oil Change",
                          amount: "12,000XAF",
                          icon: CupertinoIcons.drop,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScheduleDetails(),
                          ),
                        );
                      },
                      child: HomeCard(
                          inspectionText: "Diagnostics",
                          amount: "25,000XAF",
                          icon: CupertinoIcons.graph_circle),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScheduleDetails(),
                          ),
                        );
                      },
                      child: HomeCard(
                        inspectionText: "Washing",
                        amount: "5,000XAF",
                        icon: CupertinoIcons.sparkles,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
