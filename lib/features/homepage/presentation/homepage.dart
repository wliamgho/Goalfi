import 'package:flutter/material.dart';
import 'package:goalfi/features/calculator/presentation/calculator_card/calculator_card.dart';
import 'package:goalfi/features/homepage/profile_card/profile_list.dart';
import 'package:goalfi/features/question/intro_question/domain/intro_question_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<IntroQuestionData?> _loadProfileData() async {
    return await IntroQuestionData.loadFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<IntroQuestionData?>(
        future: _loadProfileData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading profile data.'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No profile data found.'));
          } else {
            final profileData = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.all(16.0)),
                    ProfileListView(introQuestion: profileData),
                    const CalculatorCard()
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
