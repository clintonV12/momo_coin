import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/ycoin_api/constants.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../transfer_complete/transfer_complete_widget.dart';
import 'package:flutter/material.dart';
import '../backend/ycoin_api/models/account.dart';

class TransferFundsWidget extends StatefulWidget {
  const TransferFundsWidget({Key? key}) : super(key: key);

  @override
  _TransferFundsWidgetState createState() => _TransferFundsWidgetState();
}

class _TransferFundsWidgetState extends State<TransferFundsWidget>
    with TickerProviderStateMixin {
  TextEditingController? textControllerPhone;
  TextEditingController? textControllerAmount;

  late String phone = '';
  late Future<Account> futureAccount;

  String? dropDownValue1;
  String? dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 30),
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 47),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'dropDownOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 100,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'dropDownOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 140,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 170,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 80),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 270,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 82),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: -220,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, -0.0),
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: -220,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  void getStoredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('phone')) {
      phone = prefs.getString('phone')!;
    }
  }

  void doTransferRequest(rPhone, amount) async {
    try {
      Response response = await post(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint),
          body: {
            'senderPhone': 78679654,
            'receiverPhone': rPhone,
            "amount": amount
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data.toString());
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    textControllerPhone = TextEditingController();
    textControllerAmount = TextEditingController();
    getStoredValue();
    futureAccount = fetchAccount(7867954);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.84,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'pe3o18oh' /* Transfer Funds */,
                            ),
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 48,
                              icon: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x4B1A1F24),
                                offset: Offset(0, 2),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0.94, -1),
                              end: AlignmentDirectional(-0.94, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 12, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'kyzwrfh4' /* Balance */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<Account>(
                                      future: futureAccount,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                              snapshot.data!.y_balance
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textColor,
                                                        fontSize: 32,
                                                      ));
                                        } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                        }

                                        // By default, show a loading spinner.
                                        return const CircularProgressIndicator();
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 4, 20, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "******",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto Mono',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                          ),
                                    ),
                                    Text(
                                      "5 Oct 2022",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto Mono',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ).animated(
                            [animationsMap['containerOnPageLoadAnimation']!]),
                      ),
                      Text(
                        "Enter transfer details",
                        style: TextStyle(fontSize: 18),
                      ).animated([animationsMap['buttonOnPageLoadAnimation']!]),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: TextFormField(
                          controller: textControllerPhone,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Phone number",
                            labelStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  fontWeight: FontWeight.w300,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 24, 24),
                          ),
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: TextFormField(
                          controller: textControllerAmount,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Y-COIN Amount",
                            labelStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  fontWeight: FontWeight.w300,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 24, 24),
                          ),
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          doTransferRequest(
                              textControllerPhone!.text.toString(),
                              textControllerAmount!.text.toString());

                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 220),
                              reverseDuration: Duration(milliseconds: 220),
                              child: TransferCompleteWidget(),
                            ),
                          );
                        },
                        text: "Complete Transfer",
                        options: FFButtonOptions(
                          width: 300,
                          height: 70,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .title1
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'xku4zxbe' /* Tap above to complete transfer */,
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend',
                    color: Color(0x43000000),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
