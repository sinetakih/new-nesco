import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nesco/firebase_options.dart';
import 'package:nesco/provider/vin_provider.dart';
import 'package:nesco/repository/vin_repository.dart';
import 'package:nesco/screens/addvehicle.dart';
import 'package:nesco/screens/onboarding/onboarding_one.dart';
import 'package:nesco/screens/signin.dart';
import 'package:nesco/screens/signup.dart';
import 'package:nesco/screens/homescreen.dart';
import 'package:nesco/screens/garage.dart';
import 'package:nesco/service/api/api.client.dart';
import 'package:nesco/service/api/vin.service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const NescoHome());
}

class NescoHome extends StatefulWidget {
  const NescoHome({super.key});

  @override
  State<NescoHome> createState() => _NescoHomeState();
}

class _NescoHomeState extends State<NescoHome> {
  ApiClient apiClient = ApiClient();

  late final VinService vinService;

  late final VinRepository vinRepository;

  @override
  void initState() {
    super.initState();
    vinService = VinService(client: apiClient);
    vinRepository = VinRepository(vinService: vinService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VinProvider>(
            create: (context) => VinProvider(vinRepository: vinRepository))
      ],
      child: MaterialApp(home: addvehicle()),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
