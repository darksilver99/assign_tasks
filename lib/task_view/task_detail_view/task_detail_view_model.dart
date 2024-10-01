import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/task_view/own_task_name_view/own_task_name_view_widget.dart';
import '/task_view/reply_detail_view/reply_detail_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_detail_view_widget.dart' show TaskDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TaskDetailViewModel extends FlutterFlowModel<TaskDetailViewWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> tmpImageList = [];
  void addToTmpImageList(FFUploadedFile item) => tmpImageList.add(item);
  void removeFromTmpImageList(FFUploadedFile item) => tmpImageList.remove(item);
  void removeAtIndexFromTmpImageList(int index) => tmpImageList.removeAt(index);
  void insertAtIndexInTmpImageList(int index, FFUploadedFile item) =>
      tmpImageList.insert(index, item);
  void updateTmpImageListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpImageList[index] = updateFn(tmpImageList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in TaskDetailView widget.
  WorkerListRecord? workerReferenceResult;
  // Stores action output result for [Action Block - confirmBlock] action in Text widget.
  bool? isConfirm2;
  // Model for OwnTaskNameView component.
  late OwnTaskNameViewModel ownTaskNameViewModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  SendListRecord? sendDocumentResult;
  // State field(s) for remark widget.
  FocusNode? remarkFocusNode;
  TextEditingController? remarkTextController;
  String? Function(BuildContext, String?)? remarkTextControllerValidator;
  // Stores action output result for [Action Block - confirmBlock] action in Icon widget.
  bool? isConfirm;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlList;

  @override
  void initState(BuildContext context) {
    ownTaskNameViewModel = createModel(context, () => OwnTaskNameViewModel());
  }

  @override
  void dispose() {
    ownTaskNameViewModel.dispose();
    remarkFocusNode?.dispose();
    remarkTextController?.dispose();
  }
}
