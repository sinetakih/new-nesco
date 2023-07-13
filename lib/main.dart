import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nesco/firebase_options.dart';
import 'package:nesco/provider/auth_provider.dart';
import 'package:nesco/provider/vin_provider.dart';
import 'package:nesco/repository/auth_repository.dart';
import 'package:nesco/repository/vin_repository.dart';
import 'package:nesco/screens/HomeNavigation.dart';
import 'package:nesco/screens/addvehicle.dart';
import 'package:nesco/screens/homescreen.dart';
import 'package:nesco/screens/onboarding/onboarding_one.dart';
import 'package:nesco/service/api/api.client.dart';
import 'package:nesco/service/api/vin.service.dart';
import 'package:nesco/service/firebase_auth_service.dart';
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
  final FirebaseAuthService _authService = FirebaseAuthService();
  late final AuthRepository _authRepository;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository(_authService);
    vinService = VinService(client: apiClient);
    vinRepository = VinRepository(vinService: vinService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VinProvider>(
            create: (context) => VinProvider(vinRepository: vinRepository)),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) =>
                AuthProvider(_authRepository)..authStateChanged()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Nesco",
          home: HomeNavigation()),
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
    return const Scaffold(
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
