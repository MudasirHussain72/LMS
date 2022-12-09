import 'package:firebase_auth/firebase_auth.dart';

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
