import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/paramaters/update_profile_parameters.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/fields/date_field.dart';
import 'package:shopyneer/core/widgets/fields/email_field.dart';
import 'package:shopyneer/core/widgets/fields/gender_field.dart';
import 'package:shopyneer/core/widgets/fields/name_field.dart';
import 'package:shopyneer/core/widgets/fields/phone_field.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/core/widgets/snack_bar.dart';
import 'package:shopyneer/features/profile/profile_bloc/profile_bloc.dart';
import 'package:shopyneer/features/profile/profile_bloc/profile_state.dart';
import 'package:size_config/size_config.dart';

import '../../config/localization/loc_keys.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late ScrollController _scrollController;
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController dateController = TextEditingController();
  late TextEditingController idController = TextEditingController();
  late TextEditingController genderController = TextEditingController();
  final _updateKey = GlobalKey<FormState>();
  final TextEditingController nationalityController =
      TextEditingController(text: "SA");
  String image = "";

  final ImagePicker _picker = ImagePicker();

  File? pickedFile;

  String? pickedFilePath;
  UpdateProfileParam updateParam = UpdateProfileParam();

  @override
  void dispose() {
    firstNameController.dispose();
    emailController.dispose();
    idController.dispose();
    genderController.dispose();
    nationalityController.dispose();
    super.dispose();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      String date = DateFormat('dd-mm-yyyy').format(pickedDate);

      setState(() {
        dateController.text = date;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    firstNameController.text =
        getIt.get<ProfileBloc>().profileResponseModel?.data.name ?? "";
    emailController.text =
        getIt.get<ProfileBloc>().profileResponseModel?.data.email ?? "";
    idController.text =
        getIt.get<ProfileBloc>().profileResponseModel?.data.nationalId ?? "";
    genderController.text =
        getIt.get<ProfileBloc>().profileResponseModel?.data.genderName ?? "";
    image = getIt.get<ProfileBloc>().profileResponseModel?.data.image ?? "";
  }

  Future<void> _pickImage(ImageSource source) async {
    // pickedFile = await _picker.pickImage(source: source);
    final filePicker = await _picker.pickImage(source: source);
    if (filePicker != null) {
      setState(() {
        pickedFile = File(filePicker.path);
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 75.h,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: CircleAvatar(
              radius: 20.h,
              backgroundColor: Colors.grey.withOpacity(.2),
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
                size: 20.sp,
              ),
            ),
          ),
          centerTitle: false,
          title: Text(
            Loc.editProfile(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  children: [
                    /*Center(
                      child: SizedBox(
                        width: 100.h,
                        height: 100.h,
                        child: Stack(
                          children: [
                            TweenAnimationBuilder(
                              duration: const Duration(milliseconds: 700),
                              tween: Tween<double>(
                                  begin: 0.h, end: 100.h), // Scale animation
                              builder: (context, double size, child) {
                                return DottedBorder(
                                  color: primary, // Border color
                                  strokeWidth: 2, // Width of the border
                                  dashPattern: const [
                                    8,
                                    3
                                  ], // Length of the dash and space between dashes
                                  borderType:
                                      BorderType.RRect, // Rounded border
                                  radius: const Radius.circular(
                                      1000), // Rounded corners radius
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: EdgeInsets.all(2.h),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: pickedFile == null
                                          ? image != ""
                                              ? Picture(
                                                  "https://worker.bnoop.net/$image",
                                                  fit: BoxFit.cover,
                                                )
                                              : Picture(
                                                  getAssetImage("user.png"))
                                          : Picture(
                                              pickedFile!.path,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  Nav.imagePickerBottomSheet(
                                    context: context,
                                    content: buildImagePickerContent(),
                                  );
                                },
                                child: Container(
                                  width: 40.h,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(100.h),
                                  ),
                                  child: Center(
                                    child: Picture(
                                      getAssetIcon("camera.svg"),
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),*/
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: Padding(
                                padding: EdgeInsets.all(16.h),
                                child: Form(
                                  key: _updateKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                          thickness: .1,
                                          height: 40.h,
                                          color: greyEE),
                                      buildProfileFormFields(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.h),
                            child: BlocConsumer<ProfileBloc, ProfileState>(
                              listener: (context, state) {
                                if (state is UpdateProfileDataSuccessState) {
                                  SnackBarBuilder.showFeedBackMessage(
                                    context,
                                    Loc.dataSavedSuccessfully(),
                                    isSuccess: true,
                                  );
                                  Nav.mainLayout(context);
                                } else if (state
                                    is UpdateProfileDataFailedState) {
                                  SnackBarBuilder.showFeedBackMessage(
                                    context,
                                    state.error,
                                    isSuccess: false,
                                  );
                                }
                              },
                              builder: (context, state) {
                                return CustomElevatedButton(
                                  condition:
                                      state is! UpdateProfileDataLoadingState,
                                  onTap: () {
                                    if (_updateKey.currentState!.validate()) {}
                                  },
                                  buttonName: Loc.save(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                state is UpdateProfileDataLoadingState?
                    ? GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildImagePickerContent() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 100.w,
              height: 4,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context)),
              Text(Loc.selectImage(), style: getBoldBlack16Style()),
            ],
          ),
          ListTile(
            leading: buildIconContainer("camera.svg"),
            title: Text(Loc.camera(), style: getBoldBlack14Style()),
            subtitle:
                Text(Loc.cameraSubtitle(), style: getRegularGrey12Style()),
            onTap: () {
              _pickImage(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
          const Divider(color: greyFA),
          ListTile(
            leading: buildIconContainer("gallery.svg"),
            title: Text(Loc.gallery(), style: getBoldBlack14Style()),
            subtitle: Text(Loc.selectImageFromGallery(),
                style: getRegularGrey12Style()),
            onTap: () {
              _pickImage(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconContainer(String asset) {
    return Container(
      decoration: const BoxDecoration(
        color: greyFA,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Picture(getAssetIcon(asset), width: 30.h, color: primary),
      ),
    );
  }

  Widget buildProfileFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الإسم الاول", style: getRegularBlack16Style()),
                  Gap(16.h),
                  NameField(
                    controller: firstNameController,
                    hint: "الإسم الاول",
                  ),
                ],
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الإسم الأخير", style: getRegularBlack16Style()),
                  Gap(16.h),
                  NameField(
                    controller: lastNameController,
                    hint: "الإسم الأخير",
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(24.h),
        Text(Loc.email(), style: getRegularBlack16Style()),
        Gap(16.h),
        EmailField(controller: emailController, showPreFixIcon: false),
        Gap(24.h),
        Text("رقم الهاتف", style: getRegularBlack16Style()),
        Gap(16.h),
        PhoneField(controller: phoneController),
        /* Gap(24.h),
          Text(Loc.nationality(), style: getRegularBlack16Style()),
          Gap(16.h),
        NationalityField(controller: nationalityController, enableState: false),*/
        Gap(24.h),
        Text(Loc.gender(), style: getRegularBlack16Style()),
        Gap(16.h),
        Gap(24.h),
        Text("تاريخ الميلاد", style: getRegularBlack16Style()),
        Gap(16.h),
        DateField(
          controller: dateController,
          onTap: () {
            selectDate(context);
          },
        ),
        /* Gap(24.h),
          Text(Loc.nationality(), style: getRegularBlack16Style()),
          Gap(16.h),
        NationalityField(controller: nationalityController, enableState: false),*/
        Gap(24.h),
        Text(Loc.gender(), style: getRegularBlack16Style()),
        Gap(16.h),
        GenderField(
          controller: genderController,
          onContainerShown: () {
            Future.delayed(const Duration(milliseconds: 200), () {
              _scrollToBottom();
            });
          },
          onMaleSelected: () {
            setState(() {
              genderController.text = Loc.male();
            });
          },
          validator: (value) {
            if (genderController.text.isEmpty) {
              return Loc.pleaseSelectGender();
            }
            return null;
          },
          onFeMaleSelected: () {
            setState(() {
              genderController.text = Loc.female();
            });
          },
        ),
      ],
    );
  }
}
