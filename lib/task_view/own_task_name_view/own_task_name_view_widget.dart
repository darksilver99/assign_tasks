import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'own_task_name_view_model.dart';
export 'own_task_name_view_model.dart';

class OwnTaskNameViewWidget extends StatefulWidget {
  const OwnTaskNameViewWidget({
    super.key,
    required this.memberReference,
  });

  final DocumentReference? memberReference;

  @override
  State<OwnTaskNameViewWidget> createState() => _OwnTaskNameViewWidgetState();
}

class _OwnTaskNameViewWidgetState extends State<OwnTaskNameViewWidget> {
  late OwnTaskNameViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OwnTaskNameViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isMemberResult = await actions.checkIsStillMember(
        widget!.memberReference!,
      );
      _model.isMember = _model.isMemberResult!;
      _model.isLoading = false;
      safeSetState(() {});
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
      child: Builder(
        builder: (context) {
          if (_model.isMember) {
            return StreamBuilder<MemberListRecord>(
              stream: MemberListRecord.getDocument(widget!.memberReference!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }

                final textMemberListRecord = snapshot.data!;

                return Text(
                  'ผู้มอบหมาย : ${textMemberListRecord.displayName}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Kanit',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                );
              },
            );
          } else {
            return Text(
              'ผู้มอบหมาย : ไม่มีสมาชิกคนนี้แล้ว',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Kanit',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                  ),
            );
          }
        },
      ),
    );
  }
}
