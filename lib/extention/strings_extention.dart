

extension StringExtention on String{

  bool isEmptyString(){
    return (this==null||this.isEmpty);
  }

  String capitalize()=> "${this[0].toUpperCase()}${this.substring(1)}";

  // bool isImgLocal() {
  //   if((this[0].contains('http://')||this[0].contains('https://')))
  //     return false;
  //   else return true;
  // }
  // bool isImgLocal() => !(this[0].contains(RegExp(r'http://', caseSensitive: false))||this[0].contains(RegExp(r'https://', caseSensitive: false)));
  // bool isImgLocal() => !(this[0].contains(RegExp(r'http', caseSensitive: false)));
}