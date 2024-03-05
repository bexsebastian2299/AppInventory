import 'dart:convert';


class SourceTypeConvert {
  List<dynamic>? decode(String databaseValue){
    return jsonDecode(databaseValue);
  }

  String endcode(String? value){
    return jsonEncode(value);
  }
}