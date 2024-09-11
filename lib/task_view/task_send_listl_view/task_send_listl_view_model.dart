import '/backend/backend.dart';
import '/components/worker_name_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_view/task_send_view/task_send_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_send_listl_view_widget.dart' show TaskSendListlViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskSendListlViewModel extends FlutterFlowModel<TaskSendListlViewWidget> {
  ///  Local state fields for this component.

  int memberIndex = 0;

  DocumentReference? workerReference;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
