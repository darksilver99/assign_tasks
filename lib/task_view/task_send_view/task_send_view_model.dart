import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_send_view_widget.dart' show TaskSendViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TaskSendViewModel extends FlutterFlowModel<TaskSendViewWidget> {
  ///  Local state fields for this component.

  List<SendListRecord> sendList = [];
  void addToSendList(SendListRecord item) => sendList.add(item);
  void removeFromSendList(SendListRecord item) => sendList.remove(item);
  void removeAtIndexFromSendList(int index) => sendList.removeAt(index);
  void insertAtIndexInSendList(int index, SendListRecord item) =>
      sendList.insert(index, item);
  void updateSendListAtIndex(int index, Function(SendListRecord) updateFn) =>
      sendList[index] = updateFn(sendList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in TaskSendView widget.
  List<SendListRecord>? sendListResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}