import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/model/onboard.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demo_data.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnboardContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  demo_data.length,
                  (index) => Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                  // Add your onPressed function here
                },
                child: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),

                  primary: kSecondaryColor, // Set button color
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ), // Set text style
                ),
              ),
            ),
            const SizedBox(
              height: 106,
            )
          ],
        ),
      ),
    ));
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Image.asset(
            image,
            height: 215,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const Spacer()
      ],
    );
  }
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/image/onboarding 1.png",
    title: "Select Your Vehicle",
    description:
        "  You can select or add up to 5 cars of yours,your family and friends.",
  ),
  Onboard(
    image: "assets/image/time management.png",
    title: "Request a service",
    description:
        "You can schedule a service or you can locate our nearby service center",
  ),
  Onboard(
    image: "assets/image/Car rental-rafiki.png",
    title: "Relax Let’s Do The Job!",
    description: "We take pride in delivering quality services to our clients.",
  ),
];

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: isActive ? 12 : 6,
          width: 6,
          decoration: BoxDecoration(
              color:
                  isActive ? kSecondaryColor : kSecondaryColor.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
        ),
      ],
    );
  }
}
