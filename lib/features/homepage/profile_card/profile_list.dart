import 'package:flutter/material.dart';
import 'package:goalfi/features/homepage/domain/profile_card/user_profile_data.dart';
import 'package:goalfi/features/homepage/profile_card/profile_card.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of users
    final users = List.generate(
      1,
      (index) => UserProfile(
        name: "User $index asfjaslkdfklasjkfjakjsdfkaksdj",
        riskLevel: "High",
        age: 20,
        riskIndicator: 0.7, // Example risk values (0.0 to 1.0)
      ),
    );

    return Column(
      children: users.map((user) {
        return ProfileCard(userProfile: user);
      }).toList(),
    );
  }
}
