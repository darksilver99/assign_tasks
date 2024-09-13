import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/task_view/task_detail_view/task_detail_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_to_do_history_listl_view_model.dart';
export 'task_to_do_history_listl_view_model.dart';

class TaskToDoHistoryListlViewWidget extends StatefulWidget {
  const TaskToDoHistoryListlViewWidget({super.key});

  @override
  State<TaskToDoHistoryListlViewWidget> createState() =>
      _TaskToDoHistoryListlViewWidgetState();
}

class _TaskToDoHistoryListlViewWidgetState
    extends State<TaskToDoHistoryListlViewWidget> {
  late TaskToDoHistoryListlViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskToDoHistoryListlViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      await _model.iniTaskList(context);
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
                      'ประวัติงาน',
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
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                          _model.isLoading = true;
                          safeSetState(() {});
                          await _model.iniTaskList(context);
                          _model.isLoading = false;
                          safeSetState(() {});
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
                          _model.isLoading = true;
                          safeSetState(() {});
                          await _model.iniTaskList(context);
                          _model.isLoading = false;
                          safeSetState(() {});
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
            Expanded(
              child: Builder(
                builder: (context) {
                  final taskList = _model.myTaskToDoList.toList();
                  if (taskList.isEmpty) {
                    return Center(
                      child: NoDataViewWidget(),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      16.0,
                      0,
                      32.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: taskList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 8.0),
                    itemBuilder: (context, taskListIndex) {
                      final taskListItem = taskList[taskListIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.taskDocument =
                                await TaskListRecord.getDocumentOnce(
                                    taskListItem.taskReference!);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: TaskDetailViewWidget(
                                    taskDocument: _model.taskDocument!,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            safeSetState(() {});
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
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.paste,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 32.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        taskListItem.subject,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Kanit',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions.getStatusText(
                                                                    taskListItem
                                                                        .status,
                                                                    FFAppState()
                                                                        .taskWorkerStatusList
                                                                        .toList()),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Kanit',
                                                                    color: () {
                                                                      if (taskListItem
                                                                              .status ==
                                                                          0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent1;
                                                                      } else if (taskListItem
                                                                              .status ==
                                                                          1) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if (taskListItem
                                                                              .status ==
                                                                          3) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if (taskListItem
                                                                              .status ==
                                                                          4) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      }
                                                                    }(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              ' (กำหนดส่ง ${functions.dateTh(taskListItem.endDate)} ${functions.compareDates(getCurrentTimestamp, taskListItem.endDate!)})',
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    color: taskListItem
                                                                .endDate! <=
                                                            getCurrentTimestamp
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .error
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w200,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
