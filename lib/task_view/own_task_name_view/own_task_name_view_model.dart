import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'own_task_name_view_widget.dart' show OwnTaskNameViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OwnTaskNameViewModel extends FlutterFlowModel<OwnTaskNameViewWidget> {
  ///  Local state fields for this component.

  bool isMember = false;

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkIsStillMember] action in OwnTaskNameView widget.
  bool? isMemberResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
