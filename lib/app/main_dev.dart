import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeoru_blog/core/firebase/options/dev_firebase_options.dart';
import 'package:myeoru_blog/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DevFirebaseOptions.currentPlatform,
  );

  usePathUrlStrategy();
  runApp(const ProviderScope(child: App()));
}
