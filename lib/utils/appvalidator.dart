class AppValidator {
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please Enter an Email!';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[a-z]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Please Enter a Phone Number!';
    }
    if (value.length != 10) {
      return "Please Enter a 10-digit Phone Number!";
    }
    return null;
  }

  String? validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please Enter a Username!';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please Enter a Password!';
    }
    return null;
  }

  String? isEmptyCheck(value) {
    if (value!.isEmpty) {
      return 'Please Fill details!';
    }
    return null;
  }
}
