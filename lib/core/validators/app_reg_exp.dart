class AppRegExp {
  static RegExp capitalLetters =RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$');
  static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
}