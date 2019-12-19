import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static final FirebaseOptions development = FirebaseOptions(
    apiKey: 'AIzaSyAtEbi_eq3AtSzw7Skp0ZnwbKRemoF_Qx4',
    bundleID: 'io.bjarkan.diple.dev',
    clientID: '904946811842-prg0q57j8gk8guko1t4p3p6btqv1i42n.apps.googleusercontent.com',
    gcmSenderID: '904946811842',
    projectID: 'diple-app-dev',
    androidClientID: '904946811842-88rtpdotjoehev09bam91jar83oesqmu.apps.googleusercontent.com',
    googleAppID: '1:904946811842:ios:86855735e95596d634cc5b',
    databaseURL: 'https://diple-app-dev.firebaseio.com',
    deepLinkURLScheme: 'com.googleusercontent.apps.904946811842-prg0q57j8gk8guko1t4p3p6btqv1i42n',
    storageBucket: 'diple-app-dev.appspot.com',
  );

  static final FirebaseOptions production = FirebaseOptions(
    apiKey: 'AIzaSyAtEbi_eq3AtSzw7Skp0ZnwbKRemoF_Qx4',
    bundleID: 'io.bjarkan.diple.dev',
    clientID: '904946811842-prg0q57j8gk8guko1t4p3p6btqv1i42n.apps.googleusercontent.com',
    gcmSenderID: '904946811842',
    projectID: 'diple-app-dev',
    androidClientID: '904946811842-88rtpdotjoehev09bam91jar83oesqmu.apps.googleusercontent.com',
    googleAppID: '1:904946811842:ios:86855735e95596d634cc5b',
    databaseURL: 'https://diple-app-dev.firebaseio.com',
    deepLinkURLScheme: 'com.googleusercontent.apps.904946811842-prg0q57j8gk8guko1t4p3p6btqv1i42n',
    storageBucket: 'diple-app-dev.appspot.com',
  );
}
