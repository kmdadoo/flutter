import 'package:open_api_xml_parser/src/model/ev.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class EvRepository {
  // 공공 데이터의 일반키 api key
  var apiKey =
      "nx8OZr5i2UJBq0LX7bwJduURuGeQ9XY0YQ9%2BStcn6nlWmYyL%2BK%2FomXQQ7JspHzfuJV45Ospik5k2HGoEb1n36w%3D%3D";

  Future<List<Ev>?> loadEvs() async {
    
    var addr = "서울특별시 마포구";
    String baseUrl =
        "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?addr=$addr&pageNo=1&numOfRows=10&ServiceKey=$apiKey";
    final response = await http.get(Uri.parse(baseUrl));
    
    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {

      // 데이터 가져오기
      final body = convert.utf8.decode(response.bodyBytes);

      // xml => json으로 변환
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker(); 

      // 필요한 데이터 찾기
      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonEv = jsonResult['response']['body']['items'];

      // 필요한 데이터 그룹이 있다면 
      if (jsonEv['item'] != null) {
        // map을 통해 데이터를 전달하기 위해 객체인 List로 만든다.
        List<dynamic> list = jsonEv['item']; 

        // map을 통해 Ev형태로 item을  => Ev.fromJson으로 전달
        return list.map<Ev>((item) => Ev.fromJson(item)).toList();

      }

    }
    return null;
  }
}