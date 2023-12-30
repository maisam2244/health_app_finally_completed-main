import 'package:flutter/material.dart';
import 'package:health/Resources/AppColors/app_colors.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        // about us in arabic
        title: Text("من نحن"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('من نحن:'),
              buildSectionText(
                'منصة الكترونية متخصصة في خدمات الرعاية الصحية المنزلية مملوكة من قبل شركة سعودية، تعمل على ربط مقدمي خدمات الرعاية المنزلية بالعملاء المستفيدين، وتقديم خدمات صحية بجودة وكفاءة عالية بكل يسر وسهولة.',
              ),
              buildSectionTitle('رؤيتنا:'),
              buildSectionText(
                'تسعى منصة حريص لتمكين المرضى من الحصول على خدمات طبية في كل مكان وزمان وبجودة لا تقل عن الخدمات المقدمة في المستشفيات، لهدف زيادة جودة الحياة وتسهيل الوصول للرعاية الصحية.',
              ),
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
