import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeoru_blog/core/const/env_key.dart';
import 'package:myeoru_blog/core/firebase/options/prod_firebase_options.dart';
import 'package:myeoru_blog/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: ProdFirebaseOptions.currentPlatform,
  );

  const reCaptchaSiteKey = String.fromEnvironment(EnvKey.reCaptchaSiteKey, defaultValue: '');
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider(reCaptchaSiteKey),
  );

  runApp(const ProviderScope(child: App()));
}
