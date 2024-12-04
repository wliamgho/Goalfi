import 'package:flutter/material.dart';
import 'package:goalfi/features/homepage/profile_card/profile_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goalfi/features/question/intro_question/domain/intro_question_model.dart';
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   Future<Map<String, dynamic>> _loadProfileData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final String? name = prefs.getString('name');
//     final int? age = prefs.getInt('age');

//     return {
//       'name': name ?? 'Unknown', // Fallback if no name is found
//       'age': age ?? 0, // Fallback if no age is found
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Padding(padding: EdgeInsets.all(16.0)),
//               ProfileListView()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
