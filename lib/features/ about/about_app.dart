import 'package:flutter/material.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GeneralAppBar(routeName: "عن شوبينير"),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("عن شوبينير"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "مرحباً بكم في شوبينير، الوجهة المثالية لكل ما تحتاجه المرأة العصرية من منتجات التجميل والأناقة. يهدف موقع شوبينير لتوفير تجربة تسوق فريدة ومحتوى إثرائي للمرأة العصرية يجمع بين الجودة، الأناقة والراحة، في مكان واحد.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("لماذا شوبينير؟"),
                  const SizedBox(height: 8),
                  _buildBulletPoints([
                    "أصالة المنتجات: نحرص أن تكون جميع المنتجات أصلية 100%.",
                    "خدمة عملاء متميزة: فريقنا متواجد دائماً لمساعدتك والرد على استفساراتك.",
                    "عروض حصرية: تخفيضات، تشكيلة متنوعة، وعروض موسمية طوال العام.",
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle("التزامنا بالعمل"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "نحن في شوبينير نؤمن أن العمل هو محور النجاح، ولذلك نعمل جاهدين لتقديم سوق تسوق نسائي متميز يحقق أهدافنا ويوفر للعميلة تجربة تسوق سلسة تلبي كل احتياجاتها وتلبي رغباتها بكل سهولة واستمتاع.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("قيمنا"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "الجودة هي الأساس، نحن نؤمن بأن تقديم منتجات ذات جودة مضمونة هو ما يميز شوبينير ويمنح عملائنا شعوراً دائماً بالرضا. نحرص على تطبيق أعلى معايير الجودة في كل خطوة أثناء رحلتنا مع عملائنا.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("منتجاتنا"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "في شوبينير نقدم مجموعة متنوعة من المنتجات التي تلبي احتياجات المرأة العصرية، من مستحضرات التجميل والعناية بالبشرة إلى الإكسسوارات والحقائب وغيرها.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("رؤيتنا"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "نحن نطمح لأن نكون الخيار الأول للمرأة في العالم العربي عندما تفكر في التسوق والأناقة والجمال. رؤيتنا هي أن نوفر للمرأة العصرية أسلوب حياة متكامل.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("مهمتنا"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "مهمتنا هي تسهيل تجربة التسوق للمرأة من خلال توفير منتجات أصلية ومتنوعة، بأسعار تنافسية وخدمة عملاء راقية.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("انضم إلينا"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "كوني جزءاً من عائلة شوبينير، واشتركي في النشرة البريدية أو تابعي صفحاتنا على وسائل التواصل الاجتماعي لتصلكِ آخر العروض والمستجدات.",
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
