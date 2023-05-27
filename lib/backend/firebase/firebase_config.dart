import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyArOTSXsGVdPx8sW-BaaeL3LLHlPWHkIWw",
            authDomain: "migom-f6a91.firebaseapp.com",
            projectId: "migom-f6a91",
            storageBucket: "migom-f6a91.appspot.com",
            messagingSenderId: "190974051439",
            appId: "1:190974051439:web:be7c95e27acbd4b790799a",
            measurementId: "G-PJNKM1QQPH"));
  } else {
    await Firebase.initializeApp();
  }
}
