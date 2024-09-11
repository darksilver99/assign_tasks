// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

Future<String> generateRandomString() async {
  // Add your function code here!

  String currentDateTime = DateTime.now().toIso8601String();
  List<int> bytes = utf8.encode(currentDateTime);
  String md5Hash = md5.convert(bytes).toString();

  // Generate a random alphanumeric string (a-z, 0-9)
  const String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  String randomString =
      List.generate(16, (index) => chars[random.nextInt(chars.length)]).join();

  // Concatenate MD5 hash and random string, then trim to 32 characters
  String result = (md5Hash + randomString).substring(0, 32);

  return result;
}
