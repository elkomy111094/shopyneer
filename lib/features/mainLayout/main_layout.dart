import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/Auth/repo/auth_repo.dart';
import 'package:shopyneer/features/Shopping_Cart/shopping_cart_page.dart';
import 'package:shopyneer/features/gifts/gifts_cards_page.dart';
import 'package:shopyneer/features/home/cubit/home_cubit.dart';
import 'package:shopyneer/features/profile/profile_bloc/profile_bloc.dart';
import 'package:shopyneer/features/profile/profile_page.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../home/home_page.dart';

class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({super.key});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage>
    with TickerProviderStateMixin {
  StreamSubscription? notificationStream;
  late ProfileBloc profileBloc;
  late HomeCubit homeCubit;
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  List<String> iconPath = [
    'home.svg',
    'gift.svg',
    'cart.svg',
    'profile.svg',
  ];

  @override
  void initState() {
    super.initState();

    // إعداد لون شريط الحالة
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    if (getIt<AuthRepo>().token != null) {
      getIt.get<ProfileBloc>();
    }

    // إعداد أنيميشن التنقل بين الأيقونات
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.0,
    );

    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    notificationStream?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      _controller.forward().then((_) => _controller.reverse());
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final isSelected = _currentIndex == index;
            return InkWell(
              onTap: () => _onTabTapped(index),
              borderRadius: BorderRadius.circular(20), // تأثير الضغط التفاعلي
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,

                padding:
                    EdgeInsets.symmetric(vertical: 10), // زيادة مساحة النقر
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: isSelected
                          ? _scaleAnimation
                          : AlwaysStoppedAnimation(1.0),
                      child: Picture(
                        getAssetIcon(iconPath[index]),
                        color: isSelected ? primary : Colors.grey,
                        width: isSelected ? 30.h : 25.h,
                        height: isSelected ? 30.h : 25.h,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ['الرئيسيه', 'بطاقات هدايا', 'العربه', 'حسابي'][index],
                      style: isSelected
                          ? getBoldPrimary14Style()
                          : getBoldGreyD012Style(),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50.h,
            color: Colors.white,
            width: double.infinity,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  HomePage(),
                  GiftCardsPage(),
                  const ShoppingCartPage(),
                  ProfilePage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
