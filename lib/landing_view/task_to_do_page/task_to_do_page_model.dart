import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/customer_view/create_customer_view/create_customer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/landing_view/task_to_do_history_listl_view/task_to_do_history_listl_view_widget.dart';
import '/task_view/task_detail_view/task_detail_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_to_do_page_widget.dart' show TaskToDoPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskToDoPageModel extends FlutterFlowModel<TaskToDoPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

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

  int taskIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TaskListRecord? taskDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future initMyTaskToDoList(BuildContext context) async {
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
            'status',
            isEqualTo: 0,
          )
          .orderBy('end_date'),
    );
    while (taskIndex < taskListResult!.length) {
      FFAppState().tmpTaskReference = taskListResult?[taskIndex]?.reference;
      myTaskToDoListResult = await queryWorkerListRecordOnce(
        queryBuilder: (workerListRecord) => workerListRecord
            .where(
          'member_ref',
          isEqualTo: FFAppState().memberReference,
        )
            .whereIn('status', [0, 1, 4]),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (myTaskToDoListResult != null) {
        addToMyTaskToDoList(TaskAndWorkerStatusDataStruct(
          taskReference: taskListResult?[taskIndex]?.reference,
          subject: taskListResult?[taskIndex]?.subject,
          detail: taskListResult?[taskIndex]?.detail,
          status: myTaskToDoListResult?.status,
          endDate: taskListResult?[taskIndex]?.endDate,
        ));
      }
      taskIndex = taskIndex + 1;
    }
  }
}
