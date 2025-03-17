import 'package:flutter/material.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';

class ShippingPolicyPage extends StatelessWidget {
  const ShippingPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: 'سياسه الشحن',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("سياسة الشحن"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "مرحباً بكم في شوبينير! نلتزم بتوفير تجربة تسوق مريحة وموثوقة لعملائنا. نسعى بسياسة الشحن لدينا إلى ضمان تسليم طلباتكم بسرعة وأمان. يرجى مراعاة التفاصيل التالية لمعرفة المزيد عن خدمات الشحن لدينا:",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("خدمات الشحن"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "نحن نقدم خدمات الشحن إلى جميع أنحاء جمهورية مصر العربية. نعمل مع شركات شحن موثوقة لضمان تسليم طلباتكم بأسرع وقت ممكن، وبأفضل حالة.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("أوقات الشحن"),
                  const SizedBox(height: 8),
                  _buildBulletPoints([
                    "وقت المعالجة: يتم معالجة جميع الطلبات خلال 1-2 أيام عمل من استلامها.",
                    "وقت الشحن يعتمد على المنطقة التي يتم التسليم إليها:",
                    " - المحافظات الكبرى: 1-3 أيام عمل",
                    " - باقي المحافظات: 3-7 أيام عمل",
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle("تكاليف الشحن"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "الشحن داخل المحافظات الكبرى: مجاني على الطلبات التي تتجاوز 500 جنيه مصري. رسوم الشحن 30 جنيه مصري للطلبات الأقل من 500 جنيه مصري.\n"
                    "أما في المحافظات الأخرى: رسوم شحن ثابتة وقدرها 50 جنيه مصري. قد تختلف الرسوم بناءً على الوزن وحجم الطلب.",
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: getBoldPrimary16Style(),
      textAlign: TextAlign.right,
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: getRegularGrey14Style(),
    );
  }

  Widget _buildBulletPoints(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text(
                  item,
                  style: getRegularGrey14Style(),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
