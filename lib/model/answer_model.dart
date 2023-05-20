// To parse this JSON data, do
//
//     final questionPaper = questionPaperFromJson(jsonString);

import 'dart:convert';

QuestionPaper questionPaperFromJson(String str) =>
    QuestionPaper.fromJson(json.decode(str));

String questionPaperToJson(QuestionPaper data) => json.encode(data.toJson());

class QuestionPaper {
  String id;
  String title;
  String imageUrl;
  String description;
  int timeSeconds;
  int questionCount;
  List<Question> questions;

  QuestionPaper({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.timeSeconds,
    required this.questionCount,
    required this.questions,
  });

  factory QuestionPaper.fromJson(Map<String, dynamic> json) => QuestionPaper(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["description"],
        timeSeconds: json["time_seconds"],
        questionCount: json["question_count"],
        questions: [],
      );
  String timeInMinits() => "${(timeSeconds / 60).ceil()} min";
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "description": description,
        "time_seconds": timeSeconds,
        "question_count": questionCount,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  String id;
  String question;
  List<Answer> answers;
  String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        correctAnswer: json["correct_answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "correct_answer": correctAnswer,
      };
}

class Answer {
  String identifier;
  String answer;

  Answer({
    required this.identifier,
    required this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        identifier: json["identifier"],
        answer: json["Answer"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "Answer": answer,
      };
}
