import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/member_view/member_promote_list_view/member_promote_list_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'member_detail_view_widget.dart' show MemberDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MemberDetailViewModel extends FlutterFlowModel<MemberDetailViewWidget> {
  ///  Local state fields for this component.

  int taskIndex = 0;

  int taskIndex2 = 0;

  int totalWorking = 0;

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in MemberDetailView widget.
  List<TaskListRecord>? taskListResult2;
  // Stores action output result for [Firestore Query - Query a collection] action in MemberDetailView widget.
  WorkerListRecord? workResult;
  // Stores action output result for [Action Block - confirmBlock] action in Text widget.
  bool? isConfirm;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<TaskListRecord>? taskListResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
