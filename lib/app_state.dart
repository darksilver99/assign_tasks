import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
  }

  CustomerDataStruct _customerData = CustomerDataStruct();
  CustomerDataStruct get customerData => _customerData;
  set customerData(CustomerDataStruct value) {
    _customerData = value;
  }

  void updateCustomerDataStruct(Function(CustomerDataStruct) updateFn) {
    updateFn(_customerData);
  }

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  DocumentReference? _memberReference;
  DocumentReference? get memberReference => _memberReference;
  set memberReference(DocumentReference? value) {
    _memberReference = value;
  }

  List<DocumentReference> _memberReferenceSelected = [];
  List<DocumentReference> get memberReferenceSelected =>
      _memberReferenceSelected;
  set memberReferenceSelected(List<DocumentReference> value) {
    _memberReferenceSelected = value;
  }

  void addToMemberReferenceSelected(DocumentReference value) {
    memberReferenceSelected.add(value);
  }

  void removeFromMemberReferenceSelected(DocumentReference value) {
    memberReferenceSelected.remove(value);
  }

  void removeAtIndexFromMemberReferenceSelected(int index) {
    memberReferenceSelected.removeAt(index);
  }

  void updateMemberReferenceSelectedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    memberReferenceSelected[index] = updateFn(_memberReferenceSelected[index]);
  }

  void insertAtIndexInMemberReferenceSelected(
      int index, DocumentReference value) {
    memberReferenceSelected.insert(index, value);
  }
}
