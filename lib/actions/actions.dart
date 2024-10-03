import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/confirm_custom_view/confirm_custom_view_widget.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/customer_view/create_customer_view/create_customer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future<bool?> confirmBlock(
  BuildContext context, {
  required String? title,
  String? detail,
}) async {
  bool? isConfirm;

  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: ConfirmCustomViewWidget(
            title: title!,
            detail: detail,
          ),
        ),
      );
    },
  ).then((value) => isConfirm = value);

  if ((isConfirm != null) && isConfirm!) {
    return true;
  }

  return false;
}

Future initCustomer(BuildContext context) async {
  CustomerNameRecord? customerResult;

  if (currentUserDocument?.currentCustomerRef != null) {
    customerResult = await queryCustomerNameRecordOnce(
      queryBuilder: (customerNameRecord) => customerNameRecord.where(
        'customer_id',
        isEqualTo: currentUserDocument?.currentCustomerRef?.id,
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (customerResult != null) {
      if (customerResult?.customerName != null &&
          customerResult?.customerName != '') {
        FFAppState().customerData = CustomerDataStruct(
          customerName: customerResult?.customerName,
          expireDate: customerResult?.expireDate,
          customerRef: customerResult?.reference,
        );
      } else {
        await action_blocks.clearData(context);
      }
    } else {
      await action_blocks.clearData(context);
    }
  }
}

Future initConfig(BuildContext context) async {
  ConfigRecord? configResult;

  configResult = await queryConfigRecordOnce(
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  FFAppState().configData = ConfigDataStruct(
    policyUrl: configResult?.policyUrl,
    freeDay: configResult?.freeDay,
    paymentAlertText: configResult?.paymentAlertText,
    paymentDetailImage: configResult?.paymentDetailImage,
    promotionDetailImage: configResult?.promotionDetailImage,
    contact: configResult?.contact,
    maximumImageUpload: configResult?.maximumImageUpload,
    isReview: configResult?.isReview,
  );
}

Future initMember(BuildContext context) async {
  MemberListRecord? memberResult;

  if (FFAppState().customerData.customerRef != null) {
    memberResult = await queryMemberListRecordOnce(
      parent: FFAppState().customerData.customerRef,
      queryBuilder: (memberListRecord) => memberListRecord
          .where(
            'create_by',
            isEqualTo: currentUserReference,
          )
          .where(
            'status',
            isEqualTo: 1,
          ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (memberResult != null) {
      FFAppState().memberReference = memberResult?.reference;
    } else {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: InfoCustomViewWidget(
                title: 'ท่านไม่ได้อยู่ในองค์กรนี้แล้ว',
                detail: 'กรุณาติดต่อเจ้าหน้าองค์กรของท่าน',
                status: 'error',
              ),
            ),
          );
        },
      );

      await action_blocks.clearData(context);

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'current_customer_ref': FieldValue.delete(),
          },
        ),
      });
      await actions.pushReplacement(
        context,
        null,
      );
    }
  } else {
    await action_blocks.clearData(context);

    await currentUserReference!.update({
      ...mapToFirestore(
        {
          'current_customer_ref': FieldValue.delete(),
        },
      ),
    });
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: WebViewAware(
            child: CreateCustomerViewWidget(),
          ),
        );
      },
    );
  }
}

Future clearData(BuildContext context) async {
  FFAppState().memberReference = null;
  FFAppState().customerData = CustomerDataStruct();
}
