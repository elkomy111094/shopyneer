import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/fields/email_field.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/core/widgets/snack_bar.dart';
import 'package:shopyneer/features/Auth/login/login_bloc/login_bloc.dart';
import 'package:shopyneer/features/Auth/login/login_bloc/login_state.dart';
import 'package:shopyneer/features/Auth/login/widget/main_view_widget.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../../core/utils/get_asset_path.dart';
import '../../../core/widgets/loading_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _hasPermission = ValueNotifier(false);

  String countryCode = 'SA';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    _hasPermission.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: primary,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MainViewContainer(
          appBarHeight: 0,
          position: MediaQuery.of(context).size.height / 4.h,
          cardHeight: MediaQuery.of(context).size.height / 4.h,
          cardWidth: 20.w,
          titleWidget: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(60.h),
                Picture(
                  getAssetImage('logo_without_bg.png'),
                  width: 200.h,
                  height: 200.h,
                  fit: BoxFit.contain,
                  color: white,
                ),
                SizedBox(
                  width: 400.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    Loc.loginToYourAccount(),
                    style: getBoldWhite32Style(),
                  ),
                ),
              ],
            ),
          ),
          mainWidget: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.h)),
                  child: Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(
                          20.h,
                        ),
                        Text(
                          Loc.email(),
                          style: getRegularBlack16Style(),
                        ),
                        Gap(
                          15.h,
                        ),
                        EmailField(
                          controller: emailController,
                        ),
                        Gap(
                          40.h,
                        ),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is SuccessLoginState) {
                              Nav.registerOtp(
                                context: context,
                                phoneNumber: emailController.text,
                                countryCode: countryCode,
                                otpCode: state.authModel.userData.code,
                              );
                            } else if (state is ErrorLoginState) {
                              SnackBarBuilder.showFeedBackMessage(
                                  context, state.error,
                                  isSuccess: false);
                            }
                          },
                          builder: (context, state) {
                            if (state is LoadingLoginState) {
                              return const Center(
                                child: LoadingWidget(),
                              );
                            }
                            return CustomElevatedButton(
                              condition: true,
                              onTap: () {
                                /* Nav.registerOtp(
                                    context: context,
                                    phoneNumber: "01153942488",
                                    countryCode: countryCode,
                                    otpCode: "1234");*/
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                BlocProvider.of<LoginBloc>(context)
                                    .loginWithDataBase(
                                  phone: emailController.text,
                                  countryCode: countryCode,
                                );
                              },
                              buttonName: Loc.login(),
                            );
                          },
                        ),
                        Gap(
                          20.h,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: Loc.terms_hint(),
                              style: getMediumBlack12Style(),
                              children: <TextSpan>[
                                TextSpan(
                                  text: Loc.terms_and_conditions(),
                                  style: const TextStyle(
                                    color: primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Nav.termsAndConditions(context);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(
                  50.h,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // No action needed for "create_account" text
                        },
                        child: Text(
                          '${Loc.create_account()}؟',
                          style: getMediumWhite12Style(),
                        ),
                      ),
                      Text("  "),
                      GestureDetector(
                        onTap: () async {
                          // Add navigation action for "registerNow" text
                          Nav.register(
                            context: context,
                          );
                        },
                        child: Text(
                          Loc.registerNow(),
                          style: getBoldBlack16Style().copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(
                  30.h,
                ),
                Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.h)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        Nav.mainLayout(context);
                      },
                      child: Text(
                        Loc.loginAsGuest(),
                        style: getBoldBlack16Style().copyWith(
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(
                  50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
