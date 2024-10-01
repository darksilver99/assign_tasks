import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'member_view_model.dart';
export 'member_view_model.dart';

class MemberViewWidget extends StatefulWidget {
  const MemberViewWidget({
    super.key,
    required this.memberDocument,
    bool? isSelected,
  }) : this.isSelected = isSelected ?? false;

  final MemberListRecord? memberDocument;
  final bool isSelected;

  @override
  State<MemberViewWidget> createState() => _MemberViewWidgetState();
}

class _MemberViewWidgetState extends State<MemberViewWidget> {
  late MemberViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isSelected = widget!.isSelected;
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.isSelected = !_model.isSelected;
                  safeSetState(() {});
                  if (_model.isSelected) {
                    if (!FFAppState()
                        .memberReferenceSelected
                        .contains(widget!.memberDocument?.reference)) {
                      FFAppState().addToMemberReferenceSelected(
                          widget!.memberDocument!.reference);
                    }
                  } else {
                    if (FFAppState()
                        .memberReferenceSelected
                        .contains(widget!.memberDocument?.reference)) {
                      FFAppState().removeFromMemberReferenceSelected(
                          widget!.memberDocument!.reference);
                    }
                  }
                },
                child: Builder(
                  builder: (context) {
                    if (_model.isSelected) {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(
                          Icons.check_circle,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                      );
                    } else {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(
                          Icons.circle_outlined,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 32.0,
                        ),
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Text(
                  valueOrDefault<String>(
                    widget!.memberDocument?.displayName,
                    '-',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Kanit',
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
      ],
    );
  }
}
