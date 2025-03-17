import 'package:flutter/material.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GeneralAppBar(routeName: "شروط الاستخدام"),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("شروط الاستخدام لموقع شوبينير"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "مرحباً بك في موقع shopyneer.com. تحدد شروط الاستخدام هذه، بجانب السياسات والشروط الإضافية الأخرى (إن وجدت) على الموقع، الشروط التي نعرضها لك للوصول إلى واستخدام الموقع والخدمات، بما في ذلك تطبيق الهاتف المحمول الخاص بنا.",
                  ),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "يمكنك الاطلاع على جميع السياسات والشروط الإضافية من هنا: www.shopyneer.com، وتُدرج تلك الوثائق القانونية بالإشارة إليها في شروط الاستخدام هذه.",
                  ),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "عند دخولك أو تسجيلك في الموقع أو استمرارك في استخدام الخدمات، فإنك توافق على الالتزام بشروط الاستخدام هذه والوثائق القانونية بأثر فوري. كما قد تُعدل من قبلنا في أي وقت ويُعتبر استمرارك في الاستخدام بمثابة موافقة على التعديلات.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("نبذة عن الموقع"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "يعد موقع \"شوبينير\" منصة تجارة إلكترونية تتيح للمستخدمين من الأفراد والمؤسسات عرض وشراء مجموعة متنوعة من المنتجات النسائية، بما في ذلك مستحضرات التجميل والعناية بالبشرة والشعر والملابس والأحذية والحقائب والإكسسوارات. نحتفظ بالحق في تقديم خدمات جديدة أو تحديث أي من الخدمات أو سحبها وفقاً لتقديرنا الخاص دون أي مسؤولية.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("شروط التسجيل"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                      "يمكنك التسجيل كمشتري أو كبائع على الموقع إذا توفرت لديك معايير الأهلية التالية:"),
                  const SizedBox(height: 12),
                  _buildSectionTitle("للمشترين:"),
                  _buildBulletPoints([
                    "أن تكون بالغًا السن القانونية في بلد إقامتك.",
                    "أن تكون قادرًا على تقديم عنوان في مصر لتسليم المنتجات.",
                  ]),
                  const SizedBox(height: 12),
                  _buildSectionTitle("للبائعين:"),
                  _buildBulletPoints([
                    "أن تكون لديك شركة تجارية مسجلة وفقاً لقوانين بلدك.",
                    "أن يكون لديك ترخيص تجاري سارٍ.",
                    "تقديم ما يثبت تفويض الأفراد الذين يقومون بالتسجيل في الموقع.",
                    "تقديم إثبات الهوية والبيانات المصرفية الخاصة بالشركة.",
                  ]),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "نحتفظ بالحق في رفض أي تسجيل دون إبداء الأسباب ونقوم بإجراءات التحقق اللازمة للتأكد من هويتك. ويستمر التسجيل بنجاح لفترة غير محددة، لكنه قد يُعلق أو يُلغى وفقًا لشروط الاستخدام.",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("الالتزامات الخاصة بك"),
                  const SizedBox(height: 8),
                  _buildParagraph("عند استخدامك للخدمات، فإنك توافق على:"),
                  const SizedBox(height: 8),
                  _buildBulletPoints([
                    "تحمل المسؤولية عن الحفاظ على خصوصية حسابك وكلمة المرور الخاصة بك.",
                    "إخطارنا فوراً عن أي استخدام غير مصرح به لحسابك.",
                    "تقديم معلومات دقيقة وصحيحة عن نفسك واستخدامك للخدمات.",
                    "عدم الإفصاح عن معلومات المستخدمين الآخرين لأي طرف ثالث.",
                    "التعاون معنا في تقديم المعلومات اللازمة عند الطلب.",
                  ]),
                  const SizedBox(height: 12),
                  _buildParagraph("كما توافق على عدم القيام بما يلي:"),
                  const SizedBox(height: 8),
                  _buildBulletPoints([
                    "نشر أو إدراج أي محتوى غير مناسب أو يتعارض مع القوانين أو القيم الدينية.",
                    "نشر أوراق مالية، أسلحة، مخدرات، أو أي مواد ممنوعة.",
                    "نشر محتوى زائف أو سرقة محتوى أو التلاعب بأسعار المنتجات.",
                    "استخدام الخدمات بطرق غير مشروعة أو مخالفة لشروط الاستخدام.",
                  ]),
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
