import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/customer_view/create_customer_view/create_customer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/landing_view/task_to_check_history_listl_view/task_to_check_history_listl_view_widget.dart';
import '/task_view/task_form_view/task_form_view_widget.dart';
import '/task_view/task_send_listl_view/task_send_listl_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_to_check_page_widget.dart' show TaskToCheckPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskToCheckPageModel extends FlutterFlowModel<TaskToCheckPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
