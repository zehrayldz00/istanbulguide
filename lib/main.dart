import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/core/config/theme/app_theme.dart';
import 'package:istanbulguidetwo/core/config/utils/size_config.dart';
import 'package:istanbulguidetwo/firebase_options.dart';
import 'package:istanbulguidetwo/presentation/splash/bloc/splash_cubit.dart';
import 'package:istanbulguidetwo/presentation/splash/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase initializing
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  // only vertical using
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: SplashPage()),
    );
  }
}
