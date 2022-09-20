import 'package:http/http.dart' as http;

import '../model/university_list_response.dart';

getCountryList(String countryName) async {


  Uri uri = Uri.parse("http://universities.hipolabs.com/search?country=$countryName");
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    // print(response.body);
    return universityListResponseModelFromJson(response.body);
  } else {
    return "";
    // print(response.body);
  }
}
