// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    String? policyUrl,
    int? freeDay,
    List<String>? paymentAlertText,
    String? paymentDetailImage,
    String? promotionDetailImage,
    List<String>? contact,
    int? maximumImageUpload,
    bool? isReview,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _policyUrl = policyUrl,
        _freeDay = freeDay,
        _paymentAlertText = paymentAlertText,
        _paymentDetailImage = paymentDetailImage,
        _promotionDetailImage = promotionDetailImage,
        _contact = contact,
        _maximumImageUpload = maximumImageUpload,
        _isReview = isReview,
        super(firestoreUtilData);

  // "policy_url" field.
  String? _policyUrl;
  String get policyUrl => _policyUrl ?? '';
  set policyUrl(String? val) => _policyUrl = val;

  bool hasPolicyUrl() => _policyUrl != null;

  // "free_day" field.
  int? _freeDay;
  int get freeDay => _freeDay ?? 0;
  set freeDay(int? val) => _freeDay = val;

  void incrementFreeDay(int amount) => freeDay = freeDay + amount;

  bool hasFreeDay() => _freeDay != null;

  // "payment_alert_text" field.
  List<String>? _paymentAlertText;
  List<String> get paymentAlertText => _paymentAlertText ?? const [];
  set paymentAlertText(List<String>? val) => _paymentAlertText = val;

  void updatePaymentAlertText(Function(List<String>) updateFn) {
    updateFn(_paymentAlertText ??= []);
  }

  bool hasPaymentAlertText() => _paymentAlertText != null;

  // "payment_detail_image" field.
  String? _paymentDetailImage;
  String get paymentDetailImage => _paymentDetailImage ?? '';
  set paymentDetailImage(String? val) => _paymentDetailImage = val;

  bool hasPaymentDetailImage() => _paymentDetailImage != null;

  // "promotion_detail_image" field.
  String? _promotionDetailImage;
  String get promotionDetailImage => _promotionDetailImage ?? '';
  set promotionDetailImage(String? val) => _promotionDetailImage = val;

  bool hasPromotionDetailImage() => _promotionDetailImage != null;

  // "contact" field.
  List<String>? _contact;
  List<String> get contact => _contact ?? const [];
  set contact(List<String>? val) => _contact = val;

  void updateContact(Function(List<String>) updateFn) {
    updateFn(_contact ??= []);
  }

  bool hasContact() => _contact != null;

  // "maximum_image_upload" field.
  int? _maximumImageUpload;
  int get maximumImageUpload => _maximumImageUpload ?? 0;
  set maximumImageUpload(int? val) => _maximumImageUpload = val;

  void incrementMaximumImageUpload(int amount) =>
      maximumImageUpload = maximumImageUpload + amount;

  bool hasMaximumImageUpload() => _maximumImageUpload != null;

  // "isReview" field.
  bool? _isReview;
  bool get isReview => _isReview ?? false;
  set isReview(bool? val) => _isReview = val;

  bool hasIsReview() => _isReview != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        policyUrl: data['policy_url'] as String?,
        freeDay: castToType<int>(data['free_day']),
        paymentAlertText: getDataList(data['payment_alert_text']),
        paymentDetailImage: data['payment_detail_image'] as String?,
        promotionDetailImage: data['promotion_detail_image'] as String?,
        contact: getDataList(data['contact']),
        maximumImageUpload: castToType<int>(data['maximum_image_upload']),
        isReview: data['isReview'] as bool?,
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'policy_url': _policyUrl,
        'free_day': _freeDay,
        'payment_alert_text': _paymentAlertText,
        'payment_detail_image': _paymentDetailImage,
        'promotion_detail_image': _promotionDetailImage,
        'contact': _contact,
        'maximum_image_upload': _maximumImageUpload,
        'isReview': _isReview,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'policy_url': serializeParam(
          _policyUrl,
          ParamType.String,
        ),
        'free_day': serializeParam(
          _freeDay,
          ParamType.int,
        ),
        'payment_alert_text': serializeParam(
          _paymentAlertText,
          ParamType.String,
          isList: true,
        ),
        'payment_detail_image': serializeParam(
          _paymentDetailImage,
          ParamType.String,
        ),
        'promotion_detail_image': serializeParam(
          _promotionDetailImage,
          ParamType.String,
        ),
        'contact': serializeParam(
          _contact,
          ParamType.String,
          isList: true,
        ),
        'maximum_image_upload': serializeParam(
          _maximumImageUpload,
          ParamType.int,
        ),
        'isReview': serializeParam(
          _isReview,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        policyUrl: deserializeParam(
          data['policy_url'],
          ParamType.String,
          false,
        ),
        freeDay: deserializeParam(
          data['free_day'],
          ParamType.int,
          false,
        ),
        paymentAlertText: deserializeParam<String>(
          data['payment_alert_text'],
          ParamType.String,
          true,
        ),
        paymentDetailImage: deserializeParam(
          data['payment_detail_image'],
          ParamType.String,
          false,
        ),
        promotionDetailImage: deserializeParam(
          data['promotion_detail_image'],
          ParamType.String,
          false,
        ),
        contact: deserializeParam<String>(
          data['contact'],
          ParamType.String,
          true,
        ),
        maximumImageUpload: deserializeParam(
          data['maximum_image_upload'],
          ParamType.int,
          false,
        ),
        isReview: deserializeParam(
          data['isReview'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigDataStruct &&
        policyUrl == other.policyUrl &&
        freeDay == other.freeDay &&
        listEquality.equals(paymentAlertText, other.paymentAlertText) &&
        paymentDetailImage == other.paymentDetailImage &&
        promotionDetailImage == other.promotionDetailImage &&
        listEquality.equals(contact, other.contact) &&
        maximumImageUpload == other.maximumImageUpload &&
        isReview == other.isReview;
  }

  @override
  int get hashCode => const ListEquality().hash([
        policyUrl,
        freeDay,
        paymentAlertText,
        paymentDetailImage,
        promotionDetailImage,
        contact,
        maximumImageUpload,
        isReview
      ]);
}

ConfigDataStruct createConfigDataStruct({
  String? policyUrl,
  int? freeDay,
  String? paymentDetailImage,
  String? promotionDetailImage,
  int? maximumImageUpload,
  bool? isReview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      policyUrl: policyUrl,
      freeDay: freeDay,
      paymentDetailImage: paymentDetailImage,
      promotionDetailImage: promotionDetailImage,
      maximumImageUpload: maximumImageUpload,
      isReview: isReview,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigDataStruct? updateConfigDataStruct(
  ConfigDataStruct? configData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigDataStructData(
  Map<String, dynamic> firestoreData,
  ConfigDataStruct? configData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configData == null) {
    return;
  }
  if (configData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configDataData = getConfigDataFirestoreData(configData, forFieldValue);
  final nestedData = configDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigDataFirestoreData(
  ConfigDataStruct? configData, [
  bool forFieldValue = false,
]) {
  if (configData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configData.toMap());

  // Add any Firestore field values
  configData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigDataListFirestoreData(
  List<ConfigDataStruct>? configDatas,
) =>
    configDatas?.map((e) => getConfigDataFirestoreData(e, true)).toList() ?? [];
