import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/customer_view/create_customer_view/create_customer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_view/task_detail_view/task_detail_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_to_do_page_widget.dart' show TaskToDoPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskToDoPageModel extends FlutterFlowModel<TaskToDoPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  List<TaskListRecord> myTaskToDoList = [];
  void addToMyTaskToDoList(TaskListRecord item) => myTaskToDoList.add(item);
  void removeFromMyTaskToDoList(TaskListRecord item) =>
      myTaskToDoList.remove(item);
  void removeAtIndexFromMyTaskToDoList(int index) =>
      myTaskToDoList.removeAt(index);
  void insertAtIndexInMyTaskToDoList(int index, TaskListRecord item) =>
      myTaskToDoList.insert(index, item);
  void updateMyTaskToDoListAtIndex(
          int index, Function(TaskListRecord) updateFn) =>
      myTaskToDoList[index] = updateFn(myTaskToDoList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future initMyTaskToDoList(BuildContext context) async {
    List<TaskListRecord>? taskListResult;
    List<WorkerListRecord>? myTaskToDoListResult;

    taskListResult = await queryTaskListRecordOnce(
      parent: FFAppState().customerData.customerRef,
      queryBuilder: (taskListRecord) => taskListRecord
          .where(
            'worker_list',
            arrayContains: FFAppState().memberReference,
          )
          .orderBy('create_date', descending: true),
    );
    myTaskToDoListResult = await queryWorkerListRecordOnce(
      queryBuilder: (workerListRecord) => workerListRecord
          .where(
        'member_ref',
        isEqualTo: FFAppState().memberReference,
      )
          .whereIn('status', [0, 1, 4]),
    );
    myTaskToDoList = functions
        .getStillWorkTaskList(taskListResult!.toList())
        .toList()
        .cast<TaskListRecord>();
  }
}
