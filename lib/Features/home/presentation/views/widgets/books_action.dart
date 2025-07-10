import 'package:bookly_app/core/theme/theme.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/funcation/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.preViewLink, required this.webReaderLink});
final String preViewLink;
  final String webReaderLink;
  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    final isDark = Provider.of<ThemeProvider>(context).isDark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
      Expanded(
      child: CustomButton(
     onPressed: () {
       if (webReaderLink.isNotEmpty) {
         GoRouter.of(context).push(AppRouter.kWebView,
           extra: webReaderLink, // ✅ نمرر الرابط هنا
         );
       } else {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('المعاينة غير متاحة')),
         );
       }
     },
      text: 'معاينة الكتاب',
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
    ),
    ),
          Expanded(
              child: CustomButton(
                onPressed: (){
                    launchPreviewLink(preViewLink);
                },
            fontSize: 16,
            text: 'افتح الرابط',
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }
}
