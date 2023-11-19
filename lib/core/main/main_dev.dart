import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeoru_blog/core/firebase/dev_firebase_options.dart';
import 'package:myeoru_blog/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DevFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: App()));
}
