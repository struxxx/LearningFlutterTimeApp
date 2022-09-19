import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class WorldTime {

  String location;
  String? time;
  String flag;
  String url; // location url for api endpoint
  bool? isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      // Make the request
      var urlParse = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(urlParse);
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1,3);

      // create dateTime object
      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offSet)));

      // set the time property
      isDayTime = now.hour > 00 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get the time data';
    }
  }
}

