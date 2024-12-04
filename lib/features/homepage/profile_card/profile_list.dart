import 'package:flutter/material.dart';
import 'package:goalfi/features/homepage/domain/profile_card/user_profile_data.dart';
import 'package:goalfi/features/homepage/profile_card/profile_card.dart';
import 'package:goalfi/features/question/intro_question/domain/intro_question_model.dart';

class ProfileListView extends StatelessWidget {
  final IntroQuestionData introQuestion;
  ProfileListView({Key? key, required this.introQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of users
    print('name: ${introQuestion.name}'); // Debug
    print('age: ${introQuestion.age}'); // Debug
    final users = List.generate(
      1,
      (index) => UserProfile(
        name: introQuestion.name,
        riskLevel: "-",
        age: introQuestion.age,
        riskIndicator: 0, // Example risk values (0.0 to 1.0)
      ),
    );

    return Column(
      children: users.map((user) {
        return ProfileCard(userProfile: user);
      }).toList(),
    );
  }
}
