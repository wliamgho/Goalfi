import 'package:flutter/material.dart';
import 'package:goalfi/core/utils/textfield_currency.dart';

class CalculatorTab extends StatefulWidget {
  const CalculatorTab({Key? key}) : super(key: key);

  @override
  _CalculatorTabState createState() => _CalculatorTabState();
}

class _CalculatorTabState extends State<CalculatorTab> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _textControllers = [];
  final List<int> _visibleQuestions = [];
  final List<String> _questions = [
    'Jumlah uang yang ingin kamu capai?',
    'Waktu mengumpulkan uang ini (dalam tahun)?',
    'Uang yang kamu miliki saat ini?',
    'Target investasimu tiap bulan?',
    'Return investasi per tahun?',
  ];

  @override
  void initState() {
    super.initState();
    _textControllers.addAll(
        List.generate(_questions.length, (_) => TextEditingController()));
    _visibleQuestions.add(0); // Start with the first question visible
  }

  void _nextQuestion() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (_visibleQuestions.length < _questions.length) {
          _visibleQuestions
              .add(_visibleQuestions.length); // Show the next question
        }
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('All questions answered!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Investment Calculator',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(color: Colors.green),
            ),
            backgroundColor: Colors.green,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ..._visibleQuestions.map((index) {
                          if (index == 0) {
                            // First question: Use buttons for selection
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _questions[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _textControllers[index],
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [CurrencyFormatter()],
                                  onFieldSubmitted: (value) {
                                    if (index == _questions.length - 1) {
                                      _submit();
                                    } else {
                                      _nextQuestion();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your answer',
                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 10.0,
                                  runSpacing: 10.0,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        final formattedValue =
                                            CurrencyFormatter()
                                                .formatEditUpdate(
                                                  const TextEditingValue(
                                                      text: ''),
                                                  const TextEditingValue(
                                                      text: '10000000'),
                                                )
                                                .text;
                                        _textControllers[index].text =
                                            formattedValue;
                                        _nextQuestion();
                                      },
                                      child: const Text('10 juta'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        final formattedValue =
                                            CurrencyFormatter()
                                                .formatEditUpdate(
                                                  const TextEditingValue(
                                                      text: ''),
                                                  const TextEditingValue(
                                                      text: '50000000'),
                                                )
                                                .text;
                                        _textControllers[index].text =
                                            formattedValue;
                                        _nextQuestion();
                                      },
                                      child: const Text('50 juta'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        final formattedValue =
                                            CurrencyFormatter()
                                                .formatEditUpdate(
                                                  const TextEditingValue(
                                                      text: ''),
                                                  const TextEditingValue(
                                                      text: '100000000'),
                                                )
                                                .text;
                                        _textControllers[index].text =
                                            formattedValue;
                                        _nextQuestion();
                                      },
                                      child: const Text('100 juta'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        final formattedValue =
                                            CurrencyFormatter()
                                                .formatEditUpdate(
                                                  const TextEditingValue(
                                                      text: ''),
                                                  const TextEditingValue(
                                                      text: '1000000000'),
                                                )
                                                .text;
                                        _textControllers[index].text =
                                            formattedValue;
                                        _nextQuestion();
                                      },
                                      child: const Text('1 milyar'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16)
                              ],
                            );
                          } else if (index == 1) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _questions[index],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _textControllers[index],
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    if (index == _questions.length - 1) {
                                      _submit();
                                    } else {
                                      _nextQuestion();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your age',
                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _questions[index],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _textControllers[index],
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [CurrencyFormatter()],
                                  onFieldSubmitted: (value) {
                                    if (index == _questions.length - 1) {
                                      _submit();
                                    } else {
                                      _nextQuestion();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your answer',
                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          }
                        }).toList(),
                        if (_visibleQuestions.length == _questions.length)
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                minimumSize: const Size(double.infinity, 48)),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        else
                          ElevatedButton(
                            onPressed: _nextQuestion,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(double.infinity, 48)),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
