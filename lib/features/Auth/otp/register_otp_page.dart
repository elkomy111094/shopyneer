import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/core/widgets/snack_bar.dart';
import 'package:shopyneer/features/Auth/otp/otp_bloc/otp_bloc.dart';
import 'package:shopyneer/features/Auth/otp/otp_bloc/otp_state.dart';
import 'package:size_config/size_config.dart';

import '../../../core/getit_service/getit_service.dart';
import '../../../core/widgets/elevated_button.dart';
import '../login/widget/main_view_widget.dart';

class RegisterOtpPage extends StatefulWidget {
  const RegisterOtpPage(
      {super.key,
      required this.phoneNumber,
      required this.countryCode,
      required this.otpCode});
  final String phoneNumber;
  final String countryCode;
  final String otpCode;
  @override
  State<RegisterOtpPage> createState() => _RegisterOtpPageState();
}

class _RegisterOtpPageState extends State<RegisterOtpPage> {
  final otpTextController = TextEditingController();

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final _checkOtp = GlobalKey<FormState>();

  late bool _resendOTPIsClicked = false;

  final ValueNotifier<int> _timerSeconds = ValueNotifier(60);

  late Timer timer;
  @override
  void dispose() {
    if (_resendOTPIsClicked) {
      timer.cancel();
    }
    _timerSeconds.dispose();
    if (_checkOtp.currentState != null) {
      otpTextController.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    otpTextController.text = widget.otpCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<OtpBloc>(),
        child: Scaffold(
          backgroundColor: primary,
          body: Stack(
            children: [
              /*      Picture(
                getAssetImage("auth_bg.gif"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),*/
              MainViewContainer(
                appBarHeight: 0,
                cardHeight: MediaQuery.of(context).size.height / 4.h,
                cardWidth: 20.w,
                titleWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(100.h),
                    Picture(
                      getAssetImage('logo_without_bg.png'),
                      color: white,
                      width: 200.h,
                      height: 200.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        Loc.verifySentCode(),
                        style: getBoldWhite16Style(),
                      ),
                    ),
                    Gap(10.h),
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        Loc.enterSentCodeToVerify(),
                        style: getMediumWhite12Style(),
                      ),
                    ),
                  ],
                ),
                mainWidget: SingleChildScrollView(
                  child: Form(
                    key: _checkOtp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: white,
                          elevation: 20,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.h)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.h, horizontal: 20.h),
                            child: Column(
                              children: [
                                Text(
                                  Loc.otpCode(),
                                  style: getMediumBlack20Style(),
                                ),
                                Gap(
                                  20.h,
                                ),
                                Text(
                                  Loc.enterSentCode(),
                                  style: getMediumBlack16Style(),
                                ),
                                Gap(
                                  40.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Directionality(
                                    textDirection:
                                        TextDirection.ltr, // for all locals
                                    child: PinCodeTextField(
                                      backgroundColor: Colors.transparent,
                                      controller: otpTextController,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      cursorColor: primary,
                                      onCompleted: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 5) {
                                          return Loc.otbIsEmpty();
                                        }
                                        return null;
                                      },
                                      errorTextSpace: 40,
                                      keyboardType: TextInputType.number,
                                      errorTextDirection: TextDirection.rtl,
                                      enableActiveFill: true,
                                      autoFocus: true,
                                      textStyle:
                                          const TextStyle(color: primary),
                                      appContext: context,
                                      length: 5,
                                      pinTheme: PinTheme(
                                        fieldHeight: 65.h,
                                        fieldWidth: 65.w,
                                        inactiveFillColor: Colors.white,
                                        activeFillColor: Colors.white,
                                        selectedFillColor: Colors.white,
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(10),
                                        borderWidth: 1,
                                        activeColor: primary.withOpacity(0.2),
                                        selectedColor: primary,
                                        inactiveColor: primary.withOpacity(0.2),
                                        // fill
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: ValueListenableBuilder<int>(
                                    builder: (context, value, child) =>
                                        RichText(
                                      text: TextSpan(
                                        text: '${Loc.didnt_receive_code()} ',
                                        style: getMediumBlack16Style(),
                                        children: <TextSpan>[
                                          _resendOTPIsClicked == false
                                              ? TextSpan(
                                                  text: Loc.resend_code(),
                                                  style: const TextStyle(
                                                      color: primary,
                                                      decoration: TextDecoration
                                                          .underline),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          _resendOTPIsClicked =
                                                              true;
                                                          //Start Timer 60 sec
                                                          startTimer();
                                                        },
                                                )
                                              : TextSpan(
                                                  text:
                                                      '${Loc.second()} ${_timerSeconds.value.toString()}',
                                                  style: getMediumBlue14Style(),
                                                ),
                                        ],
                                      ),
                                    ),
                                    valueListenable: _timerSeconds,
                                  ),
                                ),
                                Gap(
                                  20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(30.h),
                        BlocConsumer<OtpBloc, OtpState>(
                          listener: (context, state) {
                            if (state is SuccessOtpState) {
                              SnackBarBuilder.showFeedBackMessage(
                                context,
                                state.authModel.message!,
                                isSuccess: true,
                              );
                              Nav.mainLayout(context);
                            } else if (state is ErrorOtpState) {
                              SnackBarBuilder.showFeedBackMessage(
                                  context, state.error,
                                  isSuccess: false);
                            }
                          },
                          builder: (context, state) {
                            if (state is LoadingOtpState) {
                              return const LoadingWidget();
                            }
                            return CustomElevatedButton(
                              condition: true,
                              onTap: () {
                                if (_checkOtp.currentState!.validate()) {
                                  BlocProvider.of<OtpBloc>(context).checkOtp(
                                    phone: widget.phoneNumber,
                                    countryCode: otpTextController.text,
                                    code: otpTextController.text,
                                  );
                                }

                                /* Nav.mainLayout(context);*/
                              },
                              buttonName: Loc.login(),
                              buttonColor: white,
                              buttonTextStyle: getBoldPrimary16Style(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // start timer resend code
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timerSeconds.value == 0) {
          timer.cancel();
          _resendOTPIsClicked = false;
          _timerSeconds.value = 60;
        } else {
          _resendOTPIsClicked = true;
          _timerSeconds.value = _timerSeconds.value - 1;
        }
      },
    );
  }
}
