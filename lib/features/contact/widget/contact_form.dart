import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/validators.dart';
import '../view_model/contact_controller.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key, required this.controller});

  final ContactController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controller.nameController,
            textInputAction: TextInputAction.next,
            autofillHints: const <String>[AutofillHints.name],
            decoration: const InputDecoration(labelText: 'Your name'),
            validator: (value) =>
                Validators.requiredField(value, label: 'Your name'),
          ),
          const SizedBox(height: Space.sm),
          TextFormField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const <String>[AutofillHints.email],
            decoration: const InputDecoration(labelText: 'Your email'),
            validator: Validators.email,
          ),
          const SizedBox(height: Space.sm),
          TextFormField(
            controller: controller.messageController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: 5,
            maxLines: 8,
            decoration: const InputDecoration(
              labelText: 'Your message',
              alignLabelWithHint: true,
            ),
            validator: Validators.message,
          ),
          const SizedBox(height: Space.md),
          Obx(
            () => FilledButton(
              onPressed: controller.isSending.value ? null : controller.submit,
              child: Text(
                controller.isSending.value ? 'Opening…' : 'Send message',
              ),
            ),
          ),
          const SizedBox(height: Space.sm),
          Text(
            'This opens your email app with everything filled in.',
            style: context.type.bodySmall,
          ),
        ],
      ),
    );
  }
}
