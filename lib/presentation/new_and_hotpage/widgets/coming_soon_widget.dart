
import 'package:flutter/material.dart';

import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/base_client.dart';

import 'coming_soon_info_card.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apicall(ApiEndPoints.upcoming),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(color: Colors.blue,),
                          Text('Please wait'),
                        ],
                      ),
                    );
          }

          if (snapshot.data == null) {
            return const Text('Loading...');
          }
         
            return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (BuildContext context, int index) =>
                    ComingSoonInfoCard(
                        movieInfo: snapshot.data.results[index]));
          }

    
        );
  }
}
