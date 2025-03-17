import 'package:flutter/material.dart'; // For UI
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:size_config/size_config.dart';

import '../../core/utils/get_asset_path.dart';
import '../../core/widgets/picture.dart'; // For accessing device storage

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: GeneralAppBar(routeName: Loc.notifications()),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
              width: 500.h,
              height: 430.h,
              decoration: BoxDecoration(
                  color: primary.withOpacity(.05), shape: BoxShape.circle),
              child: Picture(
                getAssetImage("no_note.webp"),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
