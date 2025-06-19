

validateEmailExpression(String? email) {

bool isValid = isValidEmail(email!);
  if (email.isEmpty) {
    return "email is required";
  } else if (!isValid) {
    return "email is not valid";
  } else {
    return "";
  }
}
bool isValidEmail(String email) {
  // Regular expression pattern for validating email
  String pattern =
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}';
      // r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

validatePassword(String? password){

  if(password!.isEmpty) {
    return "password is required";
  } else if (password.length < 6) {
    return "password must be at least 6 characters";
  } else if (password.length > 12) {
    return "password must be  at max  12 characters";
  } else  {
    return "";
  }
}

validateConfirmPassword(String? val, String? password) {
  if (val!.isEmpty) {
    return "confirm password is required";
  } else if (val != password) {
    return "passwords do not match";
  } else {
    return " ";
  }
}
