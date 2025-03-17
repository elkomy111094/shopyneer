import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/custom_dialog.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/my_custom_icon.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/Auth/repo/auth_repo.dart';
import 'package:shopyneer/features/profile/profile_bloc/profile_bloc.dart';
import 'package:shopyneer/features/profile/profile_bloc/profile_state.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isRtl = context.locale.languageCode == 'en';

    return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h), // Apply padding here
            child: AppBar(
              toolbarHeight: 80.h,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Transform.rotate(
                  angle: isRtl ? 3.14159 : 0,
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    padding: EdgeInsets.only(
                      left: 5.h,
                      top: 5.h,
                      bottom: 5.h,
                      right: 10.h,
                    ),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            primary.withOpacity(0.4),
                            Colors.white,
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        )),
                    child: Transform.rotate(
                      angle: isRtl ? 3.14159 : 0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: EdgeInsets.all(10.h),
                          child: ClipOval(
                            child: state is LoadingProfileState
                                ? const Center(child: LoadingWidget())
                                : state is ErrorProfileState ||
                                        getIt<AuthRepo>().token == null
                                    ? Picture(
                                        getAssetImage("user.png"),
                                        fit: BoxFit.contain,
                                        height: 50.h,
                                        width: 50.h,
                                        color: Colors.white,
                                      )
                                    : (state is SuccessProfileState &&
                                            state.profileResponseModel.data
                                                .image!.isNotEmpty)
                                        ? Picture(
                                            "https://worker.bnoop.net/${state.profileResponseModel.data.image}",
                                            fit: BoxFit.cover,
                                            height: 50.h,
                                            width: 50.h,
                                          )
                                        : Picture(
                                            getAssetImage("user.png"),
                                            fit: BoxFit.contain,
                                            height: 50.h,
                                            width: 50.h,
                                            color: Colors.white,
                                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              title: Row(
                children: [
                  getIt<AuthRepo>().token != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Picture(
                                  getAssetIcon('location.svg'),
                                  width: 20.h,
                                  height: 20.h,
                                  color: primary,
                                ),
                                Gap(5.w),
                                Text(
                                  Loc.myLocation(),
                                  style: getMediumBlue10Style(),
                                ),
                              ],
                            ),
                            Gap(
                              5.h,
                            ),
                            SizedBox(
                              width: 250.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      state is LoadingProfileState
                                          ? Loc.pleaseWait()
                                          : state is ErrorProfileState
                                              ? state.error
                                              : state is SuccessProfileState
                                                  ? state.profileResponseModel
                                                          .data.address ??
                                                      Loc.noTitle()
                                                  : Loc.noTitle(),
                                      style: getMediumBlack12Style(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "عزيزنا العميل",
                                  style: getMediumBlue10Style(),
                                ),
                              ],
                            ),
                            Gap(
                              5.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "مرحبا بك في شركه عامله",
                                  style: getMediumBlack12Style(),
                                ),
                              ],
                            ),
                          ],
                        ),
                  const Spacer(),
                  MyCustomIconsWidget(
                    backGround: greyF4,
                    height: 40.h,
                    width: 40.w,
                    onTap: () {
                      if (getIt<AuthRepo>().token == null) {
                        Nav.soonDialog(
                            context,
                            Center(
                                child: Container(
                                    color: Colors.transparent,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: const CustomDialog())));
                      } else {
                        Nav.notificationPage(context);
                      }
                    },
                    childWidget: Center(
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Picture(
                            getAssetIcon('bell.svg'),
                            width: 25.h,
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      const Size.fromHeight(80.0); // Adjust the height as needed;
}
