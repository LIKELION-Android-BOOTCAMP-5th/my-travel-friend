import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @preResolve
  @LazySingleton()
  Future<FirebaseApp> initializeFirebaseApp() async {
    return await Firebase.initializeApp();
  }

  @preResolve
  @LazySingleton()
  Future<SupabaseClient> initializeSupabaseClient() async {
    await Supabase.initialize(
      url: dotenv.get('SUPABASE_URL'),
      anonKey: dotenv.get('SUPABASE_ANONKEY'),
    );
    return Supabase.instance.client;
  }

  @LazySingleton()
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @preResolve
  @LazySingleton()
  Future<GoogleSignIn> initializeGoogleSignIn() async {
    String? clientId;

    if (Platform.isIOS) {
      clientId = dotenv.get("iOS_Client_Id");
    } else {
      clientId = dotenv.get("Client_Id");
    }

    await GoogleSignIn.instance.initialize(
      serverClientId: dotenv.get("Web_Client_Id"),
      clientId: clientId,
    );
    return GoogleSignIn.instance;
  }
}
