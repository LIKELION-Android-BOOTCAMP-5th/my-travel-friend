import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  // 2. Firebase App 초기화
  @preResolve
  @LazySingleton()
  Future<FirebaseApp> initializeFirebaseApp() async {
    return await Firebase.initializeApp();
  }

  // 3. SupabaseClient 초기화
  @preResolve
  @LazySingleton()
  // 매개변수에서 DotEnv dotEnv를 제거하고 dotenv.get()을 직접 사용합니다.
  Future<SupabaseClient> initializeSupabaseClient() async {
    // main.dart에서 dotenv.load()가 완료되었음을 가정
    await Supabase.initialize(
      url: dotenv.get('SUPABASE_URL'),
      anonKey: dotenv.get('SUPABASE_ANONKEY'),
    );
    return Supabase.instance.client;
  }

  // 4. Firebase Messaging 등록
  @LazySingleton()
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
}
