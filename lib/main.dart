import 'package:flutter/material.dart';
import 'package:news_app/ImagesShow.dart';

import 'Network.dart';
import 'models/Album.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Articles>? diningtagItems = snapshot.data?.articles;
              return SingleChildScrollView(child: Column(
                children: [
                  SizedBox(
                    child:ImagesShow(diningtagItems!) ,
                  )
            
                ],
              ));
            }

       
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
