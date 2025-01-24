import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/Auth/repo/auth_repo.dart';
import 'package:shopyneer/features/Categories/categories_Page.dart';
import 'package:shopyneer/features/Shopping_Cart/shopping_cart_page.dart';
import 'package:shopyneer/features/home/cubit/home_cubit.dart';
import 'package:shopyneer/features/profile/profile_bloc/profile_bloc.dart';
import 'package:shopyneer/features/profile/profile_page.dart';
import 'package:size_config/size_config.dart';

import '../home/home_page.dart';

final ValueNotifier<int> navBarPageIndex = ValueNotifier(0);
moveToSelectedIndex(int selectedIndex, BuildContext context) {
  navBarPageIndex.value = selectedIndex;
}

class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({super.key});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  StreamSubscription? notificationStream;
  late TabController tabController;
  late ProfileBloc profileBloc;
  late HomeCubit homeCubit;
  @override
  void initState() {
    super.initState();

    /// Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    if (getIt<AuthRepo>().token != null) {
      getIt.get<ProfileBloc>().getProfileDataWithDataBase();
    }

    getIt.get<HomeCubit>().getAdevertisingDataWithDataBase();
  }

  @override
  void dispose() {
    notificationStream?.cancel();
    super.dispose();
  }

  List<String> iconPath = [
    'home.svg',
    'categories.svg',
    'cart.svg',
    /* 'offers.svg',*/
    'profile.svg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                final isSelected = _currentIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Picture(
                              getAssetIcon(iconPath[index]),
                              color: isSelected ? primary : Colors.grey,
                              width: 25.h,
                              height: 25.h,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Text(
                            [
                              'الرئيسيه',
                              'الأقسام',
                              'العربه',
                              /*'عروضنا',*/
                              'حسابي'
                            ][index],
                            style: TextStyle(
                                color: primary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          )
                        else
                          Text(
                            [
                              'الرئيسيه',
                              'الأقسام',
                              'العربه',
                              /*'عروضنا',*/
                              'حسابي'
                            ][index],
                            style: TextStyle(
                                color: greyD0,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        body: Stack(
          children: [
            _currentIndex == 0
                ? HomePage()
                : _currentIndex == 1
                    ? CategoriesPage()
                    : _currentIndex == 2
                        ? const ShoppingCartPage()
                        : ProfilePage(),
          ],
        ),
      ),
    );
  }
}
