import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'worker_name_view_model.dart';
export 'worker_name_view_model.dart';

class WorkerNameViewWidget extends StatefulWidget {
  const WorkerNameViewWidget({
    super.key,
    required this.memberReference,
  });

  final DocumentReference? memberReference;

  @override
  State<WorkerNameViewWidget> createState() => _WorkerNameViewWidgetState();
}

class _WorkerNameViewWidgetState extends State<WorkerNameViewWidget> {
  late WorkerNameViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkerNameViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isMemberResult = await actions.checkIsStillMember(
        widget!.memberReference!,
      );
      if (_model.isMemberResult!) {
        _model.memberDocumentResult =
            await MemberListRecord.getDocumentOnce(widget!.memberReference!);
        _model.memberDocument = _model.memberDocumentResult;
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        _model.isLoading = false;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_model.isLoading,
      child: Text(
        _model.memberDocument != null
            ? valueOrDefault<String>(
                _model.memberDocument?.displayName,
                '-',
              )
            : 'ไม่มีสมาชิกคนนี้แล้ว',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Kanit',
              fontSize: 18.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
