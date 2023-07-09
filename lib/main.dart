import 'dart:ffi';

import 'package:firebase/firebase_options.dart';
import 'package:firebase/pages/home_page.dart';
import 'package:firebase/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/bloc/auth_bloc.dart';
import 'core/utils/app_string.dart';
import 'repositories/user_repositories.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is UnAuthenticateState) {
          return const SplashScreen();
        } else if (state is AuthenticateState) {
          return const HomePage();
        }
        return Scaffold(
          body: Center(
            child: Container(
              child: Text('suck it'),
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
