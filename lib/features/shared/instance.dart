

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseInstance{
  static final fireAuth = FirebaseAuth.instance;
  static final userDb = FirebaseFirestore.instance.collection('users');
}