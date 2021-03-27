import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gopraying/model/prayer.dart';
import 'package:gopraying/model/server_response.dart';
import 'package:gopraying/utils/constants.dart';
import 'package:gopraying/utils/url.dart';
import 'package:http/http.dart' as http;

class PrayerRepo {
  static Future<Prayer> getPrayer({@required String prayerId, @required int userId}) async {
    String param = 'prayer_id=$prayerId&user_id=$userId';

    String url = GET_PRAYER_URL + param;

    http.Response response = await http.get(url);

    return prayerFromMap(response.body);
  }

  static Future<List<Prayer>> getPrayerAll({@required int userId}) async {
    List<Prayer> _prayerList;

    String url = GET_PRAYER_URL + 'user_id=$userId';

    http.Response response = await http.get(url).timeout(Duration(seconds: MEDIUM_OPERATIONS_DELAY), onTimeout: () {
      return;
    }).catchError((err) => print(err));

    if (response?.statusCode == 200) {
      try {
        _prayerList = (jsonDecode(response.body) as List).map((data) => Prayer.fromMap(data)).toList();
      } catch (e) {
        print(e);
      }
    } else {
      print(response?.statusCode);
    }

    return _prayerList;
  }

  //Get prayers using user ID.
  static Future<List<Prayer>> getUsersPrayer({int userId}) async {
    String param = 'user_id=$userId';
    List<Prayer> _prayerList;

    String url = GET_USER_PRAYER_URL + param;
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        _prayerList = (jsonDecode(response.body) as List).map((data) => Prayer.fromMap(data)).toList();
      } catch (e) {
        print(e);
      }
    } else {
      print(response.statusCode);
    }

    return _prayerList;
  }

  // SUBMIT/PUBLISH NEW QUESTION
  static Future<ServerResponse> postPrayer({@required Prayer prayer}) async {
    ServerResponse serverResponse = ServerResponse();

    http.Response response = await http.post(POST_ADD_PRAYER_URL, body: prayer.toMap()).timeout(Duration(seconds: MEDIUM_OPERATIONS_DELAY), onTimeout: () {
      return;
    }).catchError((err) => print(err));

    if (response?.statusCode == 200) {
      var body = jsonDecode(response.body);

      serverResponse.success = body['success'];
      serverResponse.message = body['message'];
    } else {
      print(response?.statusCode.toString());
    }

    return serverResponse;
  }

  // DELETE QUESTION
  static Future<ServerResponse> deletePrayer({String prayerId}) async {
    ServerResponse serverResponse = ServerResponse();

    http.Response response = await http.post(DELETE_PRAYER_URL, body: {"prayer_id": prayerId});

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      serverResponse.success = body['success'];
      serverResponse.message = body['message'];
    } else {
      print(response.statusCode.toString());
    }

    return serverResponse;
  }

  //DELETE IMAGE
  static Future<ServerResponse> deleteImage({String prayerId}) async {
    ServerResponse serverResponse = ServerResponse();

    http.Response response = await http.post(DELETE_PRAYER_IMAGE_URL, body: {"prayer_id": prayerId});

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      serverResponse.success = body['success'];
      serverResponse.message = body['message'];
    } else {
      print(response.statusCode.toString());
    }

    return serverResponse;
  }

  //ADD PRAYER COMMIT(I HAVE PRAYED REQUEST)
  static Future<ServerResponse> addPrayerCommit({@required String prayerId, @required int userId}) async {
    ServerResponse serverResponse = ServerResponse();

    http.Response response = await http.post(POST_ADD_PRAYER_COMMIT_URL, body: {
      "prayer_id": prayerId,
      "user_id": '$userId',
    });

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      serverResponse.success = body['success'];
      serverResponse.message = body['message'];
    } else {
      print(response.statusCode.toString());
    }

    return serverResponse;
  }
}
