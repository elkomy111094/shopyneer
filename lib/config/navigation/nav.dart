import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopyneer/config/navigation/pages_keys.dart';
import 'package:shopyneer/core/utils/widget_utils.dart';
import 'package:shopyneer/core/widgets/delete_bottom_sheet.dart';
import 'package:shopyneer/core/widgets/logout_bottom_sheet.dart';
import 'package:shopyneer/core/widgets/must_login_bottom_sheet.dart';
import 'package:shopyneer/features/%20about/about_app.dart';
import 'package:shopyneer/features/Addresses/add_address.dart';
import 'package:shopyneer/features/Addresses/edit_address_page.dart';
import 'package:shopyneer/features/Addresses/my_addresses_page.dart';
import 'package:shopyneer/features/Auth/login/login_page.dart';
import 'package:shopyneer/features/Auth/login/widget/terms_and_condition_sheet.dart';
import 'package:shopyneer/features/Auth/otp/register_otp_page.dart';
import 'package:shopyneer/features/Auth/register/register_page.dart';
import 'package:shopyneer/features/Categories/category_page.dart';
import 'package:shopyneer/features/MyOrders/order_details.dart';
import 'package:shopyneer/features/MyOrders/order_tracking_page.dart';
import 'package:shopyneer/features/MyOrders/orders_page.dart';
import 'package:shopyneer/features/Payment/payment_methods_page.dart';
import 'package:shopyneer/features/Shopping_Cart/checkout_page.dart';
import 'package:shopyneer/features/Terms_and_conditions/terms_and_conditions_page.dart';
import 'package:shopyneer/features/brands/barnd_page.dart';
import 'package:shopyneer/features/favorites/favorites_page.dart';
import 'package:shopyneer/features/mainLayout/main_layout.dart';
import 'package:shopyneer/features/notifications/notification_page.dart';
import 'package:shopyneer/features/offers/offers_page.dart';
import 'package:shopyneer/features/product_details/product_details_page.dart';
import 'package:shopyneer/features/profile/edit_profile_page.dart';
import 'package:shopyneer/features/return_policy/return_policies_page.dart';
import 'package:shopyneer/features/returns/return_products_page.dart';
import 'package:shopyneer/features/search_resualt/search_resault_page.dart';
import 'package:shopyneer/features/support/support_page.dart';

import '../../features/common_question/common_questions_page.dart';
import '../../features/privacy_polocy/privacy_policies_page.dart';
import '../../features/sellers/be_seller_page.dart';
import '../../features/shipping_policy/shipping_policy_page.dart';

///don't use Navigator.of(context)
///must use this
abstract class Nav {
  static final mainNavKey = GlobalKey<NavigatorState>();

  static filterBottomSheet(
          BuildContext context, Widget bottomSheetBody) async =>
      await _pushDraggableBottomSheet(
        key: PageKey.bottomSheetFilter,
        context: context,
        page: bottomSheetBody,
        barrierDismissible: true,
      );

  static deleteBottomSheet(
          {required BuildContext context,
          required VoidCallback onDelete}) async =>
      await _pushBottomSheet(
          key: PageKey.deleteBottomSheet,
          context: context,
          page: DeleteBottomSheet(
            onYesClicked: onDelete,
          ),
          barrierDismissible: true);

  static logoutBottomSheet(
          {required BuildContext context,
          required VoidCallback onConfirm}) async =>
      await _pushBottomSheet(
          key: PageKey.logoutBottomSheet,
          context: context,
          page: LogoutBottomSheet(
            onYesClicked: onConfirm,
          ),
          barrierDismissible: true);

  static loginBottomSheet({
    required BuildContext context,
  }) async =>
      await _pushBottomSheet(
          key: PageKey.loginBottomSheet,
          context: context,
          page: const LoginBottomSheet(),
          barrierDismissible: true);

  static imagePickerBottomSheet(
          {required BuildContext context, required Widget content}) async =>
      await _pushBottomSheet(
          key: PageKey.logoutBottomSheet,
          context: context,
          page: content,
          barrierDismissible: true);

  static mainLayout(BuildContext context) async => await _replaceAll(
        context,
        PageKey.bottomNav,
        const MainLayoutPage(),
      );

  static editProfilePage(
    BuildContext context,
  ) async =>
      await _push(
        context,
        PageKey.editProfile,
        const EditProfilePage(),
      );

  static orderTrackingPage(
    BuildContext context,
  ) async =>
      await _push(
        context,
        PageKey.editProfile,
        OrderTrackingTimeline(),
      );

  static offerPage(
    BuildContext context, {
    required String OfferTitle,
    required String OfferImage,
  }) async =>
      await _push(
        context,
        PageKey.editProfile,
        OfferPage(
          OfferImg: OfferImage,
          OfferTitle: OfferTitle,
        ),
      );

  static brandPage(
    BuildContext context, {
    required String BrandTitle,
    required String BrandImage,
  }) async =>
      await _push(
        context,
        PageKey.editProfile,
        BrandPage(BrandImg: BrandImage, BrandTitle: BrandTitle),
      );

  static notificationPage(BuildContext context) async =>
      await _push(context, PageKey.notificationPage, const NotificationPage());

  //

  // static forgetPasswordConfirmPassword(BuildContext context) async => await _replace(
  //       context,
  //       PageKey.forgetPasswordConfirmKey,
  //       const ForgetPasswordConfirmPasswordPage(),
  //     );
  static termsAndConditions(BuildContext context) async =>
      await _pushBottomSheet(
        key: PageKey.termsAndConditions,
        context: context,
        page: const TermsAndCondSheets(),
        barrierDismissible: true,
      );

  static placeOfWorkBottomSheet(
          BuildContext context, Widget bottomSheetBody) async =>
      await _pushBottomSheet(
        key: PageKey.placeOfWorkBottomSheet,
        context: context,
        page: bottomSheetBody,
        barrierDismissible: true,
      );

  static placeOfBirthBottomSheet(
          BuildContext context, Widget bottomSheetBody) async =>
      await _pushBottomSheet(
        key: PageKey.placeOfBirthBottomSheet,
        context: context,
        page: bottomSheetBody,
        barrierDismissible: true,
      );

  static cancelContractDialog(
          BuildContext context, Widget bottomSheetBody) async =>
      await _pushDialog(
        key: PageKey.contractsPage,
        context: context,
        page: bottomSheetBody,
        barrierDismissible: true,
      );

  static soonDialog(BuildContext context, Widget bottomSheetBody) async =>
      await _pushDialog(
        key: PageKey.home,
        context: context,
        page: bottomSheetBody,
        barrierDismissible: true,
      );

  static sureReservation(BuildContext context, Widget bottomSheetBody) async =>
      await _pushDialog(
        key: PageKey.sureReservation,
        context: context,
        page: bottomSheetBody,
        barrierDismissible: true,
      );

  static register({required BuildContext context}) async => await _push(
        context,
        PageKey.register,
        const RegisterPage(),
      );

  static termsAndConditionPage({required BuildContext context}) async =>
      await _push(
        context,
        PageKey.register,
        const TermsAndConditionsPage(),
      );

  static checkpoutPage({required BuildContext context}) async => await _push(
        context,
        PageKey.register,
        const CheckoutPage(),
      );

  static ordersPage({required BuildContext context}) async => await _push(
        context,
        PageKey.orders,
        const OrdersPage(),
      );

  static returnsPage({required BuildContext context}) async => await _push(
        context,
        PageKey.orders,
        const ReturnProductsPage(),
      );

  static privacyPolicyPage({required BuildContext context}) async =>
      await _push(
        context,
        PageKey.orders,
        const PrivacyPolicyPage(),
      );

  static returnPolicyPage({required BuildContext context}) async => await _push(
        context,
        PageKey.orders,
        const ReturnPolicyPage(),
      );

  static techSupportPage({required BuildContext context}) async => await _push(
        context,
        PageKey.orders,
        SupportScreen(),
      );

  static shippingPolicyPage({required BuildContext context}) async =>
      await _push(
        context,
        PageKey.orders,
        ShippingPolicyPage(),
      );

  static registerOtp({
    required BuildContext context,
    required String phoneNumber,
    required String countryCode,
    required String otpCode,
  }) async =>
      await _replace(
        context,
        PageKey.otp,
        RegisterOtpPage(
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          otpCode: otpCode,
        ),
      );

  static login(BuildContext context) async => await _replaceAll(
        context,
        PageKey.login,
        const LoginScreen(),
      );

  static orderDetails(BuildContext context) async => await _push(
        context,
        PageKey.login,
        OrderDetailsPage(),
      );

  static addressesPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        AddressesPage(),
      );

  static editAddressPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        EditAddressPage(),
      );

  static commonQuestionsPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        FAQPage(),
      );

  static addAddressPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        MapScreen(),
      );

  static paymentMethodsPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        PaymentScreen(),
      );

  static favoritesPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        FavoritesPage(),
      );

  static beSellerPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        BeSellerPage(),
      );

  static searchPage(BuildContext context, String searchWord) async =>
      await _push(
        context,
        PageKey.login,
        SearchResaultPage(
          searchWord: searchWord,
        ),
      );

  static productDetailsPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        ProductDetailsPage(),
      );

  static aboutAppPage(BuildContext context) async => await _push(
        context,
        PageKey.login,
        AboutAppPage(),
      );

  static categoryDetailsPage(BuildContext context) async => await _push(
        context,
        PageKey.categoryDetailsPage,
        MainCategoryPage(),
      );

  static Future<T?> _pushDialog<T>({
    required BuildContext context,
    required PageKey key,
    required Widget page,
    bool barrierDismissible = false,
  }) async {
    await _closeDrawer(context);
    if (!context.mounted) return null;
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.white12,
      routeSettings: RouteSettings(name: key.name),
      builder: (context) => page,
    );
  }

  static Future<T?> _pushBottomSheet<T>({
    required BuildContext context,
    required PageKey key,
    required Widget page,
    double? radius,
    BoxConstraints? constraints,
    bool barrierDismissible = false,
  }) async {
    await _closeDrawer(context);
    if (!context.mounted) return null;
    return showModalBottomSheet<T?>(
      isDismissible: barrierDismissible,
      isScrollControlled: true,
      useSafeArea: true,
      clipBehavior: Clip.antiAlias,
      constraints: constraints,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            radius ?? getBorderRadius(),
          ),
        ),
      ),
      context: context,
      builder: (context) => Container(color: Colors.white, child: page),
    );
  }

  static Future<T?> _pushDraggableBottomSheet<T>({
    required BuildContext context,
    required PageKey key,
    required Widget page,
    double? radius,
    BoxConstraints? constraints,
    bool barrierDismissible = false,
  }) async {
    await _closeDrawer(context);
    if (!context.mounted) return null;
    return showModalBottomSheet<T?>(
      isDismissible: barrierDismissible,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      enableDrag: true,
      context: context,
      builder: (context) => page,
    );
  }

  static Future<T?> _push<T>(
      BuildContext context, PageKey key, Widget page) async {
    await _closeDrawer(context);
    if (!context.mounted) return null;
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 400),
            alignment: Alignment.bottomCenter,
            child: page,
            childCurrent: page));
    return null;
  }

  static Future<T?> _replace<T, TO>(
      BuildContext context, PageKey key, Widget page) async {
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 400),
            alignment: Alignment.bottomCenter,
            child: page,
            childCurrent: page));
    return null;
  }

  static Future<T?> _replaceAll<T>(
    BuildContext context,
    PageKey key,
    Widget page,
  ) async {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.bottomCenter,
          child: page,
          childCurrent: page),
      (route) => false,
    );
    return null;
  }

  static Future<void> _closeDrawer(BuildContext context) async {
    final scaffoldState = Scaffold.maybeOf(context);
    if (scaffoldState?.isDrawerOpen == true) {
      scaffoldState?.closeDrawer();
      await Future.delayed(Durations.medium1);
    }
  }
}
