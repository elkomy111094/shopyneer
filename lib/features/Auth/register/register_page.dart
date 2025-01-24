import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/widgets/fields/email_field.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/Auth/login/widget/main_view_widget.dart';
import 'package:shopyneer/features/Auth/register/register_bloc/register_bloc.dart';
import 'package:shopyneer/features/Auth/register/register_bloc/register_state.dart';
import 'package:size_config/size_config.dart';

import '../../../config/theme/colors.dart';
import '../../../config/theme/styles_manager.dart';
import '../../../core/paramaters/register_paramaters.dart';
import '../../../core/utils/get_asset_path.dart';
import '../../../core/widgets/elevated_button.dart';
import '../../../core/widgets/fields/name_field.dart';
import '../../../core/widgets/snack_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String addressTitle = "";
  double latitude = 0.0;
  double longitude = 0.0;

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<LatLng?> _currentPositionNotifier = ValueNotifier(null);

  final _registerKey = GlobalKey<FormState>();
  RegisterParam registerParam = RegisterParam();

  Future<void> getPermission(BuildContext context) async {
    PermissionStatus status = await Permission.location.status;

    if (status.isGranted) {
      // If permission is already granted, get the location
      if (!context.mounted) return;
      await _getLocationAndUpdate(context);
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Request permission
      PermissionStatus newStatus = await Permission.location.request();

      if (newStatus.isGranted) {
        // If permission is granted after the request, get the location
        if (!context.mounted) return;
        await _getLocationAndUpdate(context);
      } else {
        // If permission is denied or permanently denied, navigate back
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: primary,
              content: Center(
                child: Text(
                  Loc.enableLocationToRegister(),
                  textAlign: TextAlign.center,
                  style: getBoldPrimary16Style().copyWith(color: white),
                ),
              )),
        );
        Navigator.of(context).pop();
      }
    }
  }

  Future<void> _getLocationAndUpdate(BuildContext context) async {
    try {
      // Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _currentPositionNotifier.value =
          LatLng(position.latitude, position.longitude);
      logger.i(
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}");

      // Get placemark information
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      setState(() {
        Placemark place = placeMarks[0];
        String selectedAddress =
            "${place.street}, ${place.locality}, ${place.country}";
        // Update registration params
        registerParam.longitude = position.latitude;
        registerParam.latitude = position.longitude;
        registerParam.addressTitle = selectedAddress;
        addressTitle = selectedAddress;
        logger.i("Selected Address: $selectedAddress");
      });
    } catch (e) {
      // Handle error (e.g., if location services are disabled)
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: primary,
            content: Center(
              child: Text(
                Loc.unableToLocateYourPosition(),
                textAlign: TextAlign.center,
                style: getBoldPrimary16Style().copyWith(color: white),
              ),
            )),
      );
      Navigator.of(context).pop(); // Navigate back on error
    }
  }

  @override
  void initState() {
    getPermission(context).then((val) {
      setState(() {});
    });
    registerParam.countryCode = "SA";
    /* registerParam = RegisterParam(
      addressTitle: widget.addressTitle,
      latitude: double.parse(widget.latitude.toString()),
      longitude: double.parse(widget.longitude.toString()),
      countryCode: 'SA',
    );*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<RegisterBloc>(),
        child: Scaffold(
          backgroundColor: primary,
          body: MainViewContainer(
            appBarHeight: 0,
            position: MediaQuery.of(context).size.height / 3.h,
            cardHeight: MediaQuery.of(context).size.height / 4.h,
            cardWidth: 20.w,
            titleWidget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(50.h),
                Container(
                  height: 200.h,
                  width: 200.h,
                  child: Picture(
                    getAssetImage('logo_without_bg.png'),
                    color: white,
                  ),
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    'سجل في تطبيقنا',
                    style: getBoldWhite32Style(),
                  ),
                ),
              ],
            ),
            mainWidget: SingleChildScrollView(
              child: Form(
                key: _registerKey,
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
                              Loc.userName(),
                              style: getRegularBlack16Style(),
                            ),
                            Gap(
                              16.h,
                            ),
                            NameField(
                              controller: userNameController,
                              onChange: (value) {
                                registerParam.name = value;
                              },
                            ),
                            Gap(
                              16.h,
                            ),
                            Text(
                              Loc.email(),
                              style: getRegularBlack16Style(),
                            ),
                            Gap(
                              10.h,
                            ),
                            EmailField(
                              controller: phoneController,
                            ),
                            Gap(
                              40.h,
                            ),
                            BlocConsumer<RegisterBloc, RegisterState>(
                              listener: (context, state) {
                                if (state is SuccessRegisterState) {
                                  Nav.registerOtp(
                                    context: context,
                                    phoneNumber: registerParam.email!,
                                    countryCode: registerParam.countryCode!,
                                    otpCode: state.authModel.userData.code,
                                  );
                                } else if (state is ErrorRegisterState) {
                                  SnackBarBuilder.showFeedBackMessage(
                                      context, state.error,
                                      isSuccess: false);
                                }
                              },
                              builder: (context, state) {
                                if (state is LoadingRegisterState) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                return CustomElevatedButton(
                                  condition: true,
                                  onTap: () {
                                    if (_registerKey.currentState!.validate()) {
                                      BlocProvider.of<RegisterBloc>(context)
                                          .register(parameters: registerParam);
                                    }
                                  },
                                  buttonName: Loc.registerNew(),
                                );
                              },
                            ),
                            Gap(
                              20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(50.h),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // No action needed for "alreadyHaveAnAccount" text
                            },
                            child: Text(
                              Loc.alreadyHaveAnAccount(),
                              style: getMediumWhite12Style(),
                            ),
                          ),
                          Text("  "),
                          GestureDetector(
                            onTap: () async {
                              Nav.login(context);
                            },
                            child: Text(
                              Loc.login(),
                              style: getBoldWhite16Style(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
