import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goalfi/features/homepage/presentation/homepage.dart';

class IntroQuestion extends StatelessWidget {
  const IntroQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuestionSlides();
  }
}

class QuestionSlides extends StatefulWidget {
  const QuestionSlides({super.key});

  @override
  QuestionSlidesState createState() => QuestionSlidesState();
}

class QuestionSlidesState extends State<QuestionSlides> {
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _saveIntroData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setInt('age', int.parse(_ageController.text));

    // Navigate to the homepage after saving
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_pageController.hasClients) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe gestures
        children: [
          // First Question: What is your name?
          QuestionCard(
            question: 'What is your name?',
            inputField: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            onNext: nextPage,
          ),
          // Second Question: How old are you?
          QuestionCard(
            question: 'How old are you?',
            inputField: TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                hintText: 'Enter your age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, // Numeric keyboard
            ),
            onPrevious: previousPage,
            onNext: () {
              // Handle submission or proceed further
              if (_nameController.text.isNotEmpty &&
                  _ageController.text.isNotEmpty) {
                _saveIntroData();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please complete the form.')));
              }
            },
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String question;
  final Widget inputField;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const QuestionCard({
    super.key,
    required this.question,
    required this.inputField,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          inputField,
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (onPrevious != null)
                ElevatedButton(
                  onPressed: onPrevious,
                  child: const Text('Previous'),
                ),
              if (onNext != null)
                ElevatedButton(
                  onPressed: onNext,
                  child: const Text('Next'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
