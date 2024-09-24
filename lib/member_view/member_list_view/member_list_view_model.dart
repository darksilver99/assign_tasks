import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/member_view/member_detail_view/member_detail_view_widget.dart';
import 'member_list_view_widget.dart' show MemberListViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MemberListViewModel extends FlutterFlowModel<MemberListViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in MemberListView widget.
  CustomerNameRecord? customerResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
