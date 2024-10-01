import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/task_view/task_send_listl_view/task_send_listl_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'task_to_check_history_listl_view_model.dart';
export 'task_to_check_history_listl_view_model.dart';

class TaskToCheckHistoryListlViewWidget extends StatefulWidget {
  const TaskToCheckHistoryListlViewWidget({super.key});

  @override
  State<TaskToCheckHistoryListlViewWidget> createState() =>
      _TaskToCheckHistoryListlViewWidgetState();
}

class _TaskToCheckHistoryListlViewWidgetState
    extends State<TaskToCheckHistoryListlViewWidget> {
  late TaskToCheckHistoryListlViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskToCheckHistoryListlViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.startDate = functions.getFirstDayOfMonth(getCurrentTimestamp);
      _model.endDate = functions.getLastDayOfMonth(getCurrentTimestamp);
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
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'ประวัติงานที่มอบหมาย',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Kanit',
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController1 ??=
                            FormFieldController<String>(
                          _model.dropDownValue1 ??=
                              (DateTime.now().year + 543).toString(),
                        ),
                        options: functions.getYearFromCurrent(4),
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue1 = val);
                          _model.startDate = functions.getFirstDayOfMonth(
                              functions.getDateByMonthAndYear(
                                  _model.dropDownValue2!,
                                  _model.dropDownValue1!));
                          _model.endDate = functions.getLastDayOfMonth(
                              functions.getDateByMonthAndYear(
                                  _model.dropDownValue2!,
                                  _model.dropDownValue1!));
                          safeSetState(
                              () => _model.firestoreRequestCompleter2 = null);
                          safeSetState(
                              () => _model.firestoreRequestCompleter1 = null);
                          await _model.waitForFirestoreRequestCompleted1();
                        },
                        width: double.infinity,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Kanit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'เลือกปี',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: FlutterFlowTheme.of(context).info,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<String>(
                          _model.dropDownValue2 ??=
                              DateTime.now().month.toString(),
                        ),
                        options: List<String>.from(
                            FFAppState().monthList.map((e) => e.val).toList()),
                        optionLabels:
                            FFAppState().monthList.map((e) => e.name).toList(),
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue2 = val);
                          _model.startDate = functions.getFirstDayOfMonth(
                              functions.getDateByMonthAndYear(
                                  _model.dropDownValue2!,
                                  _model.dropDownValue1!));
                          _model.endDate = functions.getLastDayOfMonth(
                              functions.getDateByMonthAndYear(
                                  _model.dropDownValue2!,
                                  _model.dropDownValue1!));
                          safeSetState(
                              () => _model.firestoreRequestCompleter2 = null);
                          safeSetState(
                              () => _model.firestoreRequestCompleter1 = null);
                          await _model.waitForFirestoreRequestCompleted1();
                        },
                        width: 300.0,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Kanit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'เลือกเดือน',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: FlutterFlowTheme.of(context).info,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!_model.isLoading)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FutureBuilder<int>(
                  future:
                      (_model.firestoreRequestCompleter2 ??= Completer<int>()
                            ..complete(queryTaskListRecordCount(
                              parent: FFAppState().customerData.customerRef,
                              queryBuilder: (taskListRecord) => taskListRecord
                                  .where(
                                    'create_by',
                                    isEqualTo: FFAppState().memberReference,
                                  )
                                  .where(
                                    'status',
                                    isEqualTo: 1,
                                  )
                                  .where(
                                    'create_date',
                                    isGreaterThanOrEqualTo: _model.startDate,
                                  )
                                  .where(
                                    'create_date',
                                    isLessThanOrEqualTo: _model.endDate,
                                  )
                                  .orderBy('create_date', descending: true),
                            )))
                          .future,
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
                    int rowCount = snapshot.data!;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${rowCount.toString()} รายการ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Kanit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            if (!_model.isLoading)
              Expanded(
                child: FutureBuilder<List<TaskListRecord>>(
                  future: (_model.firestoreRequestCompleter1 ??=
                          Completer<List<TaskListRecord>>()
                            ..complete(queryTaskListRecordOnce(
                              parent: FFAppState().customerData.customerRef,
                              queryBuilder: (taskListRecord) => taskListRecord
                                  .where(
                                    'create_by',
                                    isEqualTo: FFAppState().memberReference,
                                  )
                                  .where(
                                    'status',
                                    isEqualTo: 1,
                                  )
                                  .where(
                                    'create_date',
                                    isGreaterThanOrEqualTo: _model.startDate,
                                  )
                                  .where(
                                    'create_date',
                                    isLessThanOrEqualTo: _model.endDate,
                                  )
                                  .orderBy('create_date', descending: true),
                            )))
                      .future,
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
                    List<TaskListRecord> listViewTaskListRecordList =
                        snapshot.data!;
                    if (listViewTaskListRecordList.isEmpty) {
                      return Center(
                        child: Container(
                          height: double.infinity,
                          child: NoDataViewWidget(),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        8.0,
                        0,
                        32.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTaskListRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewTaskListRecord =
                            listViewTaskListRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().tmpTaskReference =
                                  listViewTaskListRecord.reference;
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: TaskSendListlViewWidget(
                                        taskDocument: listViewTaskListRecord,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.paste,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 32.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    listViewTaskListRecord
                                                        .subject,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '(วันที่มอบหมายงาน ${functions.dateTh(listViewTaskListRecord.createDate)} | กำหนดส่ง ${functions.dateTh(listViewTaskListRecord.endDate)})',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.navigate_next_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 32.0)),
        ),
      ),
    );
  }
}
