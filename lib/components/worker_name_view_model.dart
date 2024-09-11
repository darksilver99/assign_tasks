import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'worker_name_view_widget.dart' show WorkerNameViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkerNameViewModel extends FlutterFlowModel<WorkerNameViewWidget> {
  ///  Local state fields for this component.

  MemberListRecord? memberDocument;

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in workerNameView widget.
  MemberListRecord? memberDocumentResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
