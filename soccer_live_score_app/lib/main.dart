import 'package:flutter/material.dart';
import 'package:soccer_live_score_app/api_manager.dart';
import 'package:soccer_live_score_app/pagerbody.dart';
import 'package:soccer_live_score_app/soccermodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now before we create Our layout let's create our API service
      body: FutureBuilder<List?>(
        future: SoccerApi().getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Hata durumunu ekleyin
            print(snapshot.error);
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            print((snapshot.data)?.length);
            return Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final fixture = snapshot.data?[index];
                    final fixtureDetails = fixture['fixture'];
                    final leagueDetails = fixture['league'];
                    final teamsDetails = fixture['teams'];
                    final goalsDetails = fixture['goals'];
                    final scoreDetails = fixture['score'];

                    return ListTile(
                      title: Text(
                          '${leagueDetails['name']} - ${leagueDetails['round']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Match ID: ${fixtureDetails['id']}'),
                          Text('Date: ${fixtureDetails['date']}'),
                          Text(
                              'Venue: ${fixtureDetails['venue']['name']} - ${fixtureDetails['venue']['city']}'),
                          Text('Referee: ${fixtureDetails['referee']}'),
                          Text('Status: ${fixtureDetails['status']['long']}'),
                          Text('Home Team: ${teamsDetails['home']['name']}'),
                          Text('Away Team: ${teamsDetails['away']['name']}'),
                          Text(
                              'Goals: ${goalsDetails['home']} - ${goalsDetails['away']}'),
                          Text(
                              'Halftime Score: ${scoreDetails['halftime']['home']} - ${scoreDetails['halftime']['away']}'),
                          Text(
                              'Fulltime Score: ${scoreDetails['fulltime']['home']} - ${scoreDetails['fulltime']['away']}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
//So as we can see w got our matches data,
// the data size depend on the date and the time so
// you can get as many data as many matches are curetly playing
//Now let's try to get data by seasons and leagues
