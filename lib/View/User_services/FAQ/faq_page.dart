import 'package:flutter/material.dart';
import 'package:health/Resources/AppColors/app_colors.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        title: Text("FAQ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('أسئلة شائعة:'),
              buildSectionQA('هل استخدام التطبيق مجاني؟',
                  'تحميل واستخدام التطبيق مجاني بالكامل والدفع يتم عند الاستفادة من أحد الخدمات المدرجة على التطبيق، كما يمكنك الدفع مباشرة من خلال بطاقتك الائتمانية أو الدفع عند زيارة فريقنا لك.'),
              buildSectionQA('هل تقبلون شركات التأمين؟',
                  'نعم نقبل شركات التأمين التالية: ...'),
              buildSectionQA('كم مدة الاستشارة؟',
                  'مدة الاستشارة ٢٠ دقيقة للطب النفسي وعلم النفس و ١٥ دقيقة لباقي التخصصات.'),
              buildSectionQA('كيف يتم التواصل أثناء الاستشارة؟',
                  'من خلال مكالمة الفيديو أو المكالمة الصوتية أو الكتابة (حسب ما تقتضيه الحالة).'),
              buildSectionQA('كيف أتمكن من الحصول على الأدوية؟',
                  'بعد انتهاء الاستشارة سيقوم الطبيب بكتابة الوصفة وتصلك من خلال التطبيق وبعدها التوجه لأقرب صيدلية لصرف الأدوية.'),
              buildSectionQA('هل بإمكاني إعادة جدولة الموعد لوقت آخر؟',
                  'يرجى التواصل مع خدمة العملاء قبل وقت الموعد بـ ٣٠ دقيقة حتى يتم إلغاء الموعد.'),
              buildSectionQA('أرغب بالغاء الموعد ماهي الطريقة؟',
                  'يرجى التواصل مع خدمة العملاء قبل وقت الموعد بـ ٣٠ دقيقة حتى يتم إلغاء الموعد.'),
            ],
          ),
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
