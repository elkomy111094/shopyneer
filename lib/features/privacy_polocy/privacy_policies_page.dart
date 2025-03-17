import 'package:flutter/material.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GeneralAppBar(routeName: "سياسة الخصوصية"),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("سياسة الخصوصية"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "نحن نحترم خصوصيتك ونسعى لحماية بياناتك الشخصية. من خلال هذه السياسة نوضح كيفية جمع، استخدام، مشاركة، وتخزين بياناتك عند استخدامك لموقع Shopyneer والخدمات المرتبطة به.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("ما هي البيانات التي نجمعها منك؟"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                      "قد نقوم بجمع معلوماتك عند التسجيل أو الشراء أو التواصل معنا. تشمل هذه البيانات على سبيل المثال لا الحصر:"),
                  _buildBulletPoints([
                    "الاسم، عنوان البريد الإلكتروني، رقم الهاتف.",
                    "معلومات الدفع وعنوان الشحن.",
                    "تفاصيل المنتجات التي تم شراؤها.",
                    "معلومات الجهاز والمتصفح عند استخدام الموقع.",
                    "معلومات التفاعل مع الموقع مثل الصفحات التي تزورها.",
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle("كيف نستخدم البيانات الخاصة بك؟"),
                  const SizedBox(height: 8),
                  _buildBulletPoints([
                    "تقديم وتحسين خدماتنا.",
                    "معالجة الطلبات والدفع والتوصيل.",
                    "التواصل معك بخصوص الطلبات أو العروض.",
                    "تحليل سلوك المستخدم لتحسين تجربة التسوق.",
                    "الامتثال للمتطلبات القانونية.",
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle("إلى من نقوم بالإفصاح عن البيانات؟"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                      "قد نقوم بمشاركة بياناتك مع جهات موثوقة تساعدنا في تقديم الخدمات مثل:"),
                  _buildBulletPoints([
                    "شركات الشحن والدفع الإلكتروني.",
                    "مقدمي الخدمات التقنية.",
                    "الجهات الرسمية إذا طُلب ذلك قانونيًا.",
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle("كيف نخزن البيانات الخاصة بك؟"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "نخزن بياناتك بأمان على خوادم محمية ونتبع إجراءات صارمة لضمان حماية معلوماتك من الوصول أو التعديل غير المصرح به.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("ما هي خيارات الحماية الأخرى؟"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "يُنصح بعدم مشاركة بيانات تسجيل الدخول مع أي شخص. نحن نستخدم التشفير والنسخ الاحتياطي المنتظم لحماية بياناتك.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("كيف يمكنك الاتصال بنا؟"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "إذا كان لديك أي استفسار بخصوص سياسة الخصوصية، يمكنك التواصل معنا عبر البريد الإلكتروني: support@shopyneer.com",
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
    return Text(title,
        style: getBoldPrimary16Style(), textAlign: TextAlign.right);
  }

  Widget _buildParagraph(String text) {
    return Text(text,
        style: getRegularGrey14Style(), textAlign: TextAlign.right);
  }

  Widget _buildBulletPoints(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text(item,
                    style: getRegularGrey14Style(), textAlign: TextAlign.right),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
