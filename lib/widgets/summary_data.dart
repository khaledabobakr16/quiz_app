import 'package:flutter/material.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((element) {
              return Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: (element['question_index'] as int) + 1 >= 1000
                            ? 17
                            : (element['question_index'] as int) + 1 >= 100
                                ? 15
                                : 12,
                        backgroundColor:
                            element['user_answer'] == element['correct_answer']
                                ? Colors.blueAccent
                                : Colors.red[300],
                        child: Text(
                          ((element['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              element['question'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              element['user_answer'].toString(),
                              style: TextStyle(
                                color: element['user_answer'] ==
                                        element['correct_answer']
                                    ? Colors.blueAccent
                                    : Colors.red[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              element['correct_answer'].toString(),
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(color: Colors.amber, thickness: 1),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
