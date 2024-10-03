import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_customer_view_model.dart';
export 'create_customer_view_model.dart';

class CreateCustomerViewWidget extends StatefulWidget {
  const CreateCustomerViewWidget({super.key});

  @override
  State<CreateCustomerViewWidget> createState() =>
      _CreateCustomerViewWidgetState();
}

class _CreateCustomerViewWidgetState extends State<CreateCustomerViewWidget>
    with TickerProviderStateMixin {
  late CreateCustomerViewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCustomerViewModel());

    _model.subjectTextController ??= TextEditingController();
    _model.subjectFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-5.0, -5.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
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
      padding: EdgeInsetsDirectional.fromSTEB(
          0.0,
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).height * 0.1,
            0.0,
          ),
          0.0,
          32.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
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
                              Navigator.pop(context, false);
                            },
                            child: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 32.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'เข้าร่วมองค์กร',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Kanit',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  'กรุณาสแกน QR Code จากเจ้าหน้าที่องค์กรของท่าน',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Kanit',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.qrCode =
                                              await _model.qrCodeBlock(context);
                                          if (_model.qrCode != null &&
                                              _model.qrCode != '') {
                                            _model.customerResult =
                                                await queryCustomerNameRecordOnce(
                                              queryBuilder:
                                                  (customerNameRecord) =>
                                                      customerNameRecord.where(
                                                'customer_id',
                                                isEqualTo: _model.qrCode,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            if (_model.customerResult != null) {
                                              _model.memberDocumentResullt =
                                                  await queryMemberListRecordOnce(
                                                parent: functions
                                                    .getCustomerReferenceFromDocID(
                                                        _model.qrCode!),
                                                queryBuilder:
                                                    (memberListRecord) =>
                                                        memberListRecord.where(
                                                  'create_by',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model
                                                      .memberDocumentResullt !=
                                                  null) {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child:
                                                            InfoCustomViewWidget(
                                                          title:
                                                              'เข้าร่วมองค์กร \"${_model.customerResult?.customerName}\" เรียบร้อยแล้ว',
                                                          status: 'success',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                var memberListRecordReference =
                                                    MemberListRecord.createDoc(
                                                        functions
                                                            .getCustomerReferenceFromDocID(
                                                                _model
                                                                    .qrCode!));
                                                await memberListRecordReference
                                                    .set(
                                                        createMemberListRecordData(
                                                  createDate:
                                                      getCurrentTimestamp,
                                                  createBy:
                                                      currentUserReference,
                                                  status: 1,
                                                  displayName:
                                                      '${valueOrDefault(currentUserDocument?.fullName, '')} (${currentUserDisplayName})',
                                                ));
                                                _model.insertMember = MemberListRecord
                                                    .getDocumentFromData(
                                                        createMemberListRecordData(
                                                          createDate:
                                                              getCurrentTimestamp,
                                                          createBy:
                                                              currentUserReference,
                                                          status: 1,
                                                          displayName:
                                                              '${valueOrDefault(currentUserDocument?.fullName, '')} (${currentUserDisplayName})',
                                                        ),
                                                        memberListRecordReference);

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  currentCustomerRef: functions
                                                      .getCustomerReferenceFromDocID(
                                                          _model.qrCode!),
                                                ));
                                                FFAppState().memberReference =
                                                    _model.insertMember
                                                        ?.reference;
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child:
                                                            InfoCustomViewWidget(
                                                          title:
                                                              'เข้าร่วมองค์กร \"${_model.customerResult?.customerName}\" เรียบร้อยแล้ว',
                                                          status: 'success',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }

                                              await actions.pushReplacement(
                                                context,
                                                null,
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child:
                                                          InfoCustomViewWidget(
                                                        title:
                                                            'ขออภัยไม่พบองค์กรนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าองค์กร',
                                                        status: 'warning',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: InfoCustomViewWidget(
                                                      title:
                                                          'ขออภัยไม่พบองค์กรนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าองค์กร',
                                                      status: 'warning',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'เข้าร่วมองค์กร',
                                        icon: Icon(
                                          Icons.qr_code_rounded,
                                          size: 28.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'หรือ สร้างองค์กรของคุณเอง',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Kanit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.subjectTextController,
                                        focusNode: _model.subjectFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'ชื่อองค์กร',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Kanit',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .subjectTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }

                                          var customerNameRecordReference =
                                              CustomerNameRecord.collection
                                                  .doc();
                                          await customerNameRecordReference
                                              .set(createCustomerNameRecordData(
                                            createDate: getCurrentTimestamp,
                                            createBy: currentUserReference,
                                            status: 1,
                                            expireDate: functions.getEndDayTime(
                                                functions.getNextDay(
                                                    1, getCurrentTimestamp)),
                                            customerName: _model
                                                .subjectTextController.text,
                                          ));
                                          _model.insertedCustomer =
                                              CustomerNameRecord.getDocumentFromData(
                                                  createCustomerNameRecordData(
                                                    createDate:
                                                        getCurrentTimestamp,
                                                    createBy:
                                                        currentUserReference,
                                                    status: 1,
                                                    expireDate: functions
                                                        .getEndDayTime(functions
                                                            .getNextDay(1,
                                                                getCurrentTimestamp)),
                                                    customerName: _model
                                                        .subjectTextController
                                                        .text,
                                                  ),
                                                  customerNameRecordReference);

                                          await _model
                                              .insertedCustomer!.reference
                                              .update(
                                                  createCustomerNameRecordData(
                                            customerId: _model
                                                .insertedCustomer?.reference.id,
                                          ));

                                          await MemberListRecord.createDoc(
                                                  _model.insertedCustomer!
                                                      .reference)
                                              .set(createMemberListRecordData(
                                            createDate: getCurrentTimestamp,
                                            createBy: currentUserReference,
                                            status: 1,
                                            displayName:
                                                '${valueOrDefault(currentUserDocument?.fullName, '')} (${currentUserDisplayName})',
                                          ));

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            currentCustomerRef: _model
                                                .insertedCustomer?.reference,
                                          ));
                                          if (!FFAppState()
                                              .configData
                                              .isReview) {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: InfoCustomViewWidget(
                                                      title:
                                                          'พิเศษสำหรับคุณทดลองการใช้งานฟรี ${FFAppState().configData.freeDay.toString()} วัน',
                                                      detail:
                                                          'ดูรายละเอียดเพิ่มเติมที่ เมนู \"เพิ่มเติม\" ​> \"ต่ออายุการใช้งาน\"',
                                                      status: 'success',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                          await actions.pushReplacement(
                                            context,
                                            null,
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'ยืนยัน',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                    ),
                  ],
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ],
        ),
      ),
    );
  }
}
