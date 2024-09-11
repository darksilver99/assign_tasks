import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_view/select_member_list_view/select_member_list_view_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'task_form_view_widget.dart' show TaskFormViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskFormViewModel extends FlutterFlowModel<TaskFormViewWidget> {
  ///  Local state fields for this component.

  int memberIndex = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for subject widget.
  FocusNode? subjectFocusNode;
  TextEditingController? subjectTextController;
  String? Function(BuildContext, String?)? subjectTextControllerValidator;
  String? _subjectTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;
  String? _detailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - generateRandomString] action in Button widget.
  String? taskID;

  @override
  void initState(BuildContext context) {
    subjectTextControllerValidator = _subjectTextControllerValidator;
    detailTextControllerValidator = _detailTextControllerValidator;
  }

  @override
  void dispose() {
    subjectFocusNode?.dispose();
    subjectTextController?.dispose();

    detailFocusNode?.dispose();
    detailTextController?.dispose();
  }
}
