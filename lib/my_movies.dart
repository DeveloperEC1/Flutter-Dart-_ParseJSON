import 'dart:convert';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  @override
  State createState() => new MoviePageState();
}

class MoviePageState extends State<MoviePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TMDbApp Flutter'),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json_data/movies.json'),
            builder: (context, snapshot) {
              //decode JSON
              var myData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: myData == null ? 0 : myData.toString().length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(1.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Name: ' + myData['results'][index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.blue),
                          ),
                          Text(
                            'Overview: ' + myData['results'][index]['overview'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Vote average: ' + myData['results'][index]['vote_average'].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
