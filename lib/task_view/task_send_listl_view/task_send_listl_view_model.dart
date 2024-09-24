import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_view/task_send_view/task_send_view_widget.dart';
import '/task_view/worker_name_view/worker_name_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_send_listl_view_widget.dart' show TaskSendListlViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TaskSendListlViewModel extends FlutterFlowModel<TaskSendListlViewWidget> {
  ///  Local state fields for this component.

  int memberIndex = 0;

  DocumentReference? workerReference;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
