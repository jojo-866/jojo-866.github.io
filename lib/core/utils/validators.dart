abstract final class Validators {
  static final RegExp _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$');

  static String? requiredField(String? value, {String label = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return "$label can't be empty.";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please add your email so I can reply.';
    }
    if (!_email.hasMatch(value.trim())) {
      return "That email doesn't look quite right.";
    }
    return null;
  }

  static String? message(String? value, {int minLength = 10}) {
    if (value == null || value.trim().isEmpty) {
      return 'A few words would be lovely.';
    }
    if (value.trim().length < minLength) {
      return 'Could you say a little more? ($minLength characters or more)';
    }
    return null;
  }
}