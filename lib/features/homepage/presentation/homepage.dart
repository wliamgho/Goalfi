import 'package:flutter/material.dart';
import 'package:goalfi/features/homepage/profile_card/profile_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(padding: EdgeInsets.all(16.0)),
              ProfileListView()
            ],
          ),
        ),
      ),
    );
  }
}
