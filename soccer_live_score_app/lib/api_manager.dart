import 'dart:convert';

import 'package:http/http.dart';
import 'package:soccer_live_score_app/soccermodel.dart';

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "2aad3cc21509eaa538a8987dc1eeb54b"
  };

  Future<List?> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print(matchesList);
      print("Api service: ${body}"); // to debug
      // List<SoccerMatch> matches = matchesList
      //     .map((dynamic item) => SoccerMatch.fromJson(item))
      //     .toList();
      // print("HOLLLOO ${matches}");

      return matchesList;
    } else {
      // Eğer istekte hata oluşursa null döndür
      return null;
    }
  }
}
