import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_detail_view_widget.dart' show TaskDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskDetailViewModel extends FlutterFlowModel<TaskDetailViewWidget> {
  ///  Local state fields for this component.

  int memberIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for remark widget.
  FocusNode? remarkFocusNode;
  TextEditingController? remarkTextController;
  String? Function(BuildContext, String?)? remarkTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    remarkFocusNode?.dispose();
    remarkTextController?.dispose();
  }
}
