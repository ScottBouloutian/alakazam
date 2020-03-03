import 'package:flutter/material.dart';
import 'api.dart';

class SoundSync extends StatefulWidget {
  SoundSync({ Key key }) : super(key: key);

  @override
  SoundSyncState createState() => SoundSyncState();
}

class SoundSyncState extends State<SoundSync> {
  Future<Map> data;

  @override
  void initState() {
    data = Api.getSoundSync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final time = DateTime.fromMillisecondsSinceEpoch(snapshot.data['timestamp'] * 1000);
              final difference = DateTime.now().difference(time);
              final minutes = difference.inMinutes;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.sync),
                    title: Text('SoundCloud Sync'),
                    subtitle: Text('Last synced $minutes minutes ago'),
                  ),
                  Image.network(snapshot.data['url']),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator(); 
           }
        ),
        width: 300,
      ),
    );
  }
}
