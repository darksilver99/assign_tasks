import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_view/member_view/member_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_member_list_view_widget.dart' show SelectMemberListViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectMemberListViewModel
    extends FlutterFlowModel<SelectMemberListViewWidget> {
  ///  Local state fields for this component.

  bool isSelectedAll = false;

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MemberListRecord>? memberListResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
