import 'dart:convert';

import 'package:devhabit/constants/gemini_api.dart';
import 'package:devhabit/models/roadmap_model.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  static Future<String> generateRoadmap({
    required String domain,
    required String days,
    required String experience,
  }) async {
    String domainName = domain.replaceAll(' ', '');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      "contents": [
        {
          "parts": [
            {
              "text":
                  "Create a day-wise roadmap to learn $domainName in $days days for a person who is at $experience level in programming. Provide a detailed plan for each day, including tasks and topics to cover. Start with the basics and progress to more advanced concepts. Add a brief description for each day's in only one phrase. Follow this format strictly. do not use colon after day, use = sign. Day 1 = description for that day = task 1 for that day = task 2 for that day = task 3 for that day \n Day 2 = description for that day = task 1 for that day = task 2 for that day = task 3 for that day \n till Day $days = description for that day = task 1 for that day = task 2 for that day = task 3 for that day, show 3 tasks under each day, and add a titile for each day"
            }
          ]
        }
      ],
      "generationConfig": {
        "stopSequences": ["Title"],
        "temperature": 0,
        "maxOutputTokens": 10000,
        "topP": 0.8,
        "topK": 10
      }
    };
    try {
      final res = await http.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$geminiKey'),
        headers: headers,
        body: jsonEncode(body),
      );
      final data = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return data["candidates"][0]["content"]["parts"][0]["text"];
      }
      return 'An error occured';
    } catch (e) {
      return 'Got an error ${e.toString()}';
    }
  }

  static List<RoadmapModel> extractInformation(String input) {
    List<RoadmapModel> roadmaps = [];
    RegExp dayPattern = RegExp(r"\*\*Day (\d+) = (.*?)\*\*", dotAll: true);
    RegExp taskPattern = RegExp(
        r"- Task 1: (.*?)(?=\n- Task 2:|\n\n|\$).*?- Task 2: (.*?)(?=\n- Task 3:|\n\n|\$).*?- Task 3: (.*?)(?=\n\n|\$|\Z|\n\n|$)",
        dotAll: true);

    Iterable<Match> dayMatches = dayPattern.allMatches(input);

    for (Match dayMatch in dayMatches) {
      String dayNo = dayMatch.group(1)!;
      String description = dayMatch.group(2)!;

      String tasksInput = input.substring(dayMatch.end);

      Match? taskMatch = taskPattern.firstMatch(tasksInput);

      String task1 = taskMatch!.group(1)!;
      String task2 = taskMatch.group(2)!;
      String task3 = taskMatch.group(3)!;
      roadmaps.add(
        RoadmapModel(
          dayNo: dayNo,
          day: 'Day $dayNo',
          description: description,
          task1: task1,
          task2: task2,
          task3: task3,
          isTask1: false,
          isTask2: false,
          isTask3: false,
        ),
      );
    }
    return roadmaps;
  }
}
