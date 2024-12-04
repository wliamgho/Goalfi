import 'package:shared_preferences/shared_preferences.dart';

class IntroQuestionData {
  final String name;
  final int age;

  IntroQuestionData({required this.name, required this.age});

  // Convert object to a map
  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }

  // Save to SharedPreferences
  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setInt('age', age);
  }

  // Load from SharedPreferences
  static Future<IntroQuestionData?> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    final int? age = prefs.getInt('age');

    if (name != null && age != null) {
      return IntroQuestionData(name: name, age: age);
    }
    return null; // Return null if data is incomplete
  }
}
