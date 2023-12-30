import 'package:flutter/material.dart';
import 'package:health/Resources/AppColors/app_colors.dart';

class Family extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        title: Text("الخدمات العائلية"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildSectionTitle('باقات التحاليل المقدمة:'),
            buildSectionText(
                "الفحص الشامل: مجموعة من الفحوصات يوصى بالقيام بها بشكل دوري ، تتيح هذه الفحوصات التحقق من الصحة العامة والكشف عن عوامل الخطر للإصابة بالأمراض والوقاية منها."),
            buildSectionText(
                "باقة تساقط الشعر: مجموعة من الفحوصات المخبرية تشمل فحص الغدة الدرقية والهيموجلوبين والزنك وغيرها من الفحوصات للكشف عن اسباب تساقط الشعر."),
            buildSectionText(
                "باقة الإرهاق و التعب: يعتمد التشخيص على تقييم وضع المريض الصحي الجسدي لعلاج الإرهاق و التعب ويعتمد العلاج على معرفة السبب الكامن عبر فحص عينة الدم و من ثم علاج الأسباب."),
            buildSectionText(
                "باقة الفيتامينات: باقة الفيتامينات تساعدك على فهم احتياجات جسدك والمحافظة على صحتك العامة، كما أن الفيتامينات مطلوبة لأداء وظائف مختلفة. وتشمل هذه الوظائف دعم العظام والتئام الجروح وتقوية جهاز المناعة."),
            buildSectionText(
                "باقة الغدة الدرقية: اختبارات متابعة وظائف الغدة الدرقية هي مجموعة من اختبارات الدم التي تستخدم في قياس مدى كفاءة وأداء الغدة الدرقية لديك")
          ]),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: MyColors.purple,
        ),
      ),
    );
  }

  Widget buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget buildSectionQA(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionText(question),
        buildSectionText(answer),
      ],
    );
  }
}
