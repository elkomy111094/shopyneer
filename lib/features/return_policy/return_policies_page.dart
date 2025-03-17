import 'package:flutter/material.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';

class ReturnPolicyPage extends StatelessWidget {
  const ReturnPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GeneralAppBar(
            routeName: 'سياسة الاسترجاع',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("المنتجات المؤهلة للاسترجاع"),
                  const SizedBox(height: 8),
                  _buildParagraph(
                    "تخضع سياسة الاسترجاع هنا إلى جميع الطلبات التي يتم شراؤها من موقع www.shopyneer.com. إن قبل المنتجات المسترجعة إلا في حال استيفاء الشروط المحددة أدناه. لن يتم قبول طلب استرجاع إذا كانت المنتجات المسترجعة لا تتوافق مع الشروط والمعايير المحددة. لا يحق للعميل المطالبة باسترداد الأموال إن لم يتم قبول طلب الاسترجاع.",
                  ),
                  DotSeparator(),
                  const SizedBox(height: 8),
                  _buildParagraph("الشروط للصحة حسب الفئات:"),
                  _buildBulletTitle("الحالات والصحة:"),
                  _buildBulletPoints([
                    "لا يسمح بإرجاع المنتجات المفتوحة أو المستخدمة، وبالأخص المكملات الغذائية والفيتامينات والمكملات الغذائية الرياضية، ما لم يكن هناك عيب تصنيع ظاهر في المنتج عند استلامه.",
                  ]),
                  _buildBulletTitle("المنتجات الإلكترونية:"),
                  _buildBulletPoints([
                    "يجب أن يكون المنتج غير مستخدم وفي عبوته الأصلية مع جميع المرفقات، إلا إذا كان هناك عيب في التصنيع.",
                  ]),
                  _buildBulletTitle("الملابس:"),
                  _buildBulletPoints([
                    "يجب إرجاع الملابس الداخلية وأطقم السباحة ومنتجات الحلاقة والعناية الشخصية، إذا كانت غير مستخدمة وفي حالتها الأصلية.",
                  ]),
                  _buildBulletTitle("المنازل والمطبخ:"),
                  _buildBulletPoints([
                    "يُسمح بإرجاع أثاث أو أدوات منزلية إذا كانت في حالتها الأصلية ولم تُستخدم.",
                  ]),
                  _buildBulletTitle("المنتجات المفتوحة:"),
                  _buildBulletPoints([
                    "لا يمكن إرجاع المنتجات المفتوحة إذا لم تكن في حالتها الأصلية أو تم استخدامها.",
                  ]),
                  _buildBulletTitle("منتجات الأطفال:"),
                  _buildBulletPoints([
                    "لا يسمح بإرجاع المنتجات الخاصة بالرضع أو الطعام أو التدريب أو الحفاضات أو الإكسسوارات أو منتجات الاستخدام والعلاج الطبي.",
                  ]),
                  _buildBulletPoints([
                    "لن يتم استرجاع الطلب في حال عدم إرجاع جميع الملحقات والتغليف الأصلي.",
                  ]),
                  DotSeparator(),
                  _buildSectionTitle("الشروط العامة للاسترجاع"),
                  const SizedBox(height: 8),
                  _buildBulletPoints([
                    "يجب أن تكون المنتجات غير تالفة، غير مستخدمة، وغير مفتوحة.",
                    "يجب أن يتم تقديم المنتج في التغليف الأصلي أو العبوة المصنفة.",
                    "قد يحتاج العميل إلى التواصل مع مركز الخدمة مباشرة لإتمام الإرجاع، ولن يتم استرجاع المنتج من قبل شوبينير.",
                    "للدعم: Support@shopyneer.com"
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
    return Text(
      title,
      style: getBoldPrimary16Style(),
      textAlign: TextAlign.right,
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: getRegularGrey14Style(),
      textAlign: TextAlign.right,
    );
  }

  Widget _buildBulletTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: Text(
        title,
        style: getBoldPrimary16Style(),
        textAlign: TextAlign.right,
      ),
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
