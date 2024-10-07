import 'dart:io';
import 'dart:typed_data';

import 'package:assign_tasks/auth/firebase_auth/auth_util.dart';
import 'package:assign_tasks/flutter_flow/flutter_flow_util.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List> compressFile(Uint8List list) async {
  var result = await FlutterImageCompress.compressWithList(list, quality: 70, minWidth: 500);
  return result;
}

String firebasePathPrefix() => 'users/$currentUserUid/uploads';

String? removeTrailingSlash(String? path) => path != null && path.endsWith('/') ? path.substring(0, path.length - 1) : path;

String getStoragePath(
  String? pathPrefix,
  String filePath,
  bool isVideo, [
  int? index,
]) {
  pathPrefix ??= firebasePathPrefix();
  pathPrefix = removeTrailingSlash(pathPrefix);
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final ext = isVideo ? 'mp4' : filePath.split('.').last;
  final indexStr = index != null ? '_$index' : '';
  return '$pathPrefix/$timestamp$indexStr.$ext';
}

Future<bool> isAndroid13OrLater() async {
  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final info = await deviceInfo.androidInfo;
    return int.parse(info.version.release) >= 13;
  }
  return false;
}