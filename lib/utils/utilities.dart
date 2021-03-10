import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

class Utilities {

  // this is new
  static Future<File> pickImage({@required ImageSource source}) async {
    var pickedImage = await ImagePicker().getImage(source: source);
    if (pickedImage != null) {
      var imgFile = File(pickedImage.path);
      return await compressImage(imgFile);
    } else {
      return null;
    }
  }

  static Future<File> compressImage(File imageToCompress) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    String rand = genRandString();

    String targetPath = '$path/ic_$rand.jpg';
    var result = await FlutterImageCompress.compressAndGetFile(
      imageToCompress.absolute.path, targetPath,
      quality: 75,
        // rotate: 180,
        // rotate: 0,
      format: CompressFormat.jpeg
    );

    return result;
  }

  //CALCULATES THE CURRENT TIME AND DISPLAYS ACCORDINGLY
  static String formatDate(int dateInt) {
    return formatDateString(dateInt);
  }

  static String formatDateString(int dateInt) {
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(dateInt);
    // var formatter = DateFormat('yMMMd');
    var formatter = DateFormat('MMM d, H:m a');//MMM-> Dec, MMMM-> December, h->Hour(1-12), H->Hour(1-24), m-Minute, a-> AM/PM
    // var formatter = DateFormat.yMMMd();
    return formatter.format(dateTime);
  }

  static String formatDateString2(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    var formatter = DateFormat('dd/MM/yy');
    return formatter.format(dateTime);
  }

  static String formatDateString3(int date) {
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(date);
    // var formatter = DateFormat('d MMM, yyyy H:m a');//MMM-> Dec, MMMM-> December, h->Hour(1-12), H->Hour(1-24), m-Minute, a-> AM/PM
    var formatter = DateFormat('MMM d,  yyyy');
    return formatter.format(dateTime);
  }

  static String genRandString({int length = 15}) {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    return getRandomString(length);
  }

  static bool isImgLocal(String str) => !(str.contains('http://')||str.contains('https://'));

  //timer countdown
  static String timerDisplay(int examTimeRemaining){
    var mins = (examTimeRemaining ~/ 60); //~/ or .floor()
    var hr = (examTimeRemaining ~/ 3600);

    var r_hr = (((examTimeRemaining ~/ 3600) % 24)).toString();
    var r_mins = ((examTimeRemaining - (hr * 3600)) ~/ 60).toString();
    var r_secs = (examTimeRemaining - (mins * 60)).toString();

    if(r_hr.length ==1)r_hr = "0$r_hr";
    if(r_mins.length ==1)r_mins = "0$r_mins";
    if(r_secs.length ==1)r_secs = "0$r_secs";
    var t_remaining = "$r_hr:$r_mins:$r_secs";

    return t_remaining;
  }

  // video duration formating
  static String videoDuration(Duration duration){

    var min = duration.inMinutes;
    // var sec = duration.inSeconds%60;
    var sec = (duration.inSeconds%60).toString();
    sec = (sec.toString().length==1)?'0$sec':sec;

    return '$min:$sec';
  }

  static void lockScreen({Orientation orientation = Orientation.portrait}){

    if(orientation == Orientation.portrait){
      /// blocks rotation; sets orientation to: portrait
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }else if(orientation == Orientation.landscape){
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }
}