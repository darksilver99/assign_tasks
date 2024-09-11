import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_customer_view_widget.dart' show CreateCustomerViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCustomerViewModel
    extends FlutterFlowModel<CreateCustomerViewWidget> {
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

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CustomerNameRecord? insertedCustomer;
  // Stores action output result for [Action Block - qrCodeBlock] action in Button widget.
  String? qrCode;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MemberListRecord? memberDocumentResullt;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MemberListRecord? insertMember;

  @override
  void initState(BuildContext context) {
    subjectTextControllerValidator = _subjectTextControllerValidator;
  }

  @override
  void dispose() {
    subjectFocusNode?.dispose();
    subjectTextController?.dispose();
  }

  /// Action blocks.
  Future<String?> qrCodeBlock(BuildContext context) async {
    //context.pushNamed('ScanAndUploadQRCodePage');
    String qrcode = await context.pushNamed('ScanAndUploadQRCodePage') ?? '';

    return qrcode;
  }
}
