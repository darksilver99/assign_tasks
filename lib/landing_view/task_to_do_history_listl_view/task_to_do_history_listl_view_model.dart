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
import 'task_to_do_history_listl_view_widget.dart'
    show TaskToDoHistoryListlViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskToDoHistoryListlViewModel
    extends FlutterFlowModel<TaskToDoHistoryListlViewWidget> {
  ///  Local state fields for this component.

  DateTime? startDate;

  DateTime? endDate;

  int taskIndex = 0;

  List<TaskAndWorkerStatusDataStruct> myTaskToDoList = [];
  void addToMyTaskToDoList(TaskAndWorkerStatusDataStruct item) =>
      myTaskToDoList.add(item);
  void removeFromMyTaskToDoList(TaskAndWorkerStatusDataStruct item) =>
      myTaskToDoList.remove(item);
  void removeAtIndexFromMyTaskToDoList(int index) =>
      myTaskToDoList.removeAt(index);
  void insertAtIndexInMyTaskToDoList(
          int index, TaskAndWorkerStatusDataStruct item) =>
      myTaskToDoList.insert(index, item);
  void updateMyTaskToDoListAtIndex(
          int index, Function(TaskAndWorkerStatusDataStruct) updateFn) =>
      myTaskToDoList[index] = updateFn(myTaskToDoList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TaskListRecord? taskDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future iniTaskList(BuildContext context) async {
    List<TaskListRecord>? taskListResult;
    WorkerListRecord? myTaskToDoListResult;

    taskListResult = await queryTaskListRecordOnce(
      parent: FFAppState().customerData.customerRef,
      queryBuilder: (taskListRecord) => taskListRecord
          .where(
            'worker_list',
            arrayContains: FFAppState().memberReference,
          )
          .where(
            'end_date',
            isGreaterThanOrEqualTo: startDate,
          )
          .where(
            'end_date',
            isLessThanOrEqualTo: endDate,
          )
          .orderBy('end_date'),
    );
    while (taskIndex < taskListResult!.length) {
      FFAppState().tmpTaskReference = taskListResult?[taskIndex]?.reference;
      myTaskToDoListResult = await queryWorkerListRecordOnce(
        queryBuilder: (workerListRecord) => workerListRecord.where(
          'member_ref',
          isEqualTo: FFAppState().memberReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (myTaskToDoListResult != null) {
        addToMyTaskToDoList(TaskAndWorkerStatusDataStruct(
          status: myTaskToDoListResult?.status,
          taskReference: taskListResult?[taskIndex]?.reference,
          subject: taskListResult?[taskIndex]?.subject,
          detail: taskListResult?[taskIndex]?.detail,
          endDate: taskListResult?[taskIndex]?.endDate,
        ));
      }
      taskIndex = taskIndex + 1;
    }
  }
}
