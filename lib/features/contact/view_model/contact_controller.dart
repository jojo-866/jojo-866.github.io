import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/url_opener.dart';
import '../../../data/sources/links_config.dart';
import '../../../shared/widget/custom_snackbar.dart';

class ContactController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final RxBool isSending = false.obs;

  Future<void> submit() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      CustomSnackbar.warning(
        title: 'Almost there',
        message: 'One or two fields need another look.',
      );
      return;
    }

    isSending.value = true;
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final message = messageController.text.trim();

    final subject = 'A note from $name';
    final body = '$message\n\n$name\n$email';
    final uri =
        'mailto:${LinksConfig.email}'
        '?subject=${Uri.encodeComponent(subject)}'
        '&body=${Uri.encodeComponent(body)}';

    final opened = await UrlOpener.open(uri);
    isSending.value = false;

    if (opened) {
      CustomSnackbar.success(
        title: 'Your email app is opening',
        message:
            'Your message is ready. Press send there and it is on its way.',
      );
      _clear();
    } else {
      CustomSnackbar.error(
        title: "I couldn't open your email app",
        message: 'You can write to ${LinksConfig.email} directly.',
      );
    }
  }

  void _clear() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
    formKey.currentState?.reset();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
