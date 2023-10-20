import 'dart:core';
//
// class Post{
//   late int postId;
//   late int userId;
//   late String category;
//   late String description;
//   DateTime dateTime = DateTime.now();
//   List media = [];
//   List react = [];
//   int postStatus = 0;
//   List comments = [];
//   List reports = [];
//
// }

class Post {
  int postId = DateTime.now().millisecondsSinceEpoch;
  late int userId;
  late String category;
  late String description;
  DateTime dateTime = DateTime.now();
  List<String> media = [];
  List<int> react = [];
  int postStatus = 0;
  List<Comment> comments = [];
  List<Report> reports = [];

  Post(this.userId, this.category, this.description, this.media);

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> commentsList =
        comments.map((comment) => comment.toJson()).toList();
    List<Map<String, dynamic>> reportsList =
        reports.map((report) => report.toJson()).toList();

    return {
      "postId": postId,
      "userId": userId,
      "category": category,
      "description": description,
      "dateTime": dateTime.toUtc().toIso8601String(),
      "media": media,
      "react": react,
      "postStatus": postStatus,
      "comments": commentsList,
      "reports": reportsList,
    };
  }
}

class Comment {
  late int commentId = DateTime.now().millisecondsSinceEpoch;
  late int postId;
  late int userId;
  DateTime dateTime = DateTime.now();
  late String comment;


  Comment(this.postId, this.userId, this.comment);

  Map<String, dynamic> toJson() {
    return {
      "commentId": commentId,
      "postId": postId,
      "userId": userId,
      "dateTime": dateTime.toUtc().toIso8601String(),
      "comment": comment,
    };
  }
}

class Report {
  late int communityPostReportId = DateTime.now().millisecondsSinceEpoch;
  late int communityPostId;
  late int userId;
  DateTime dateTime = DateTime.now();
  late String description;
  int? comAdminId;
  String? response;

  Report(this.communityPostId, this.userId, this.description);

  Map<String, dynamic> toJson() {
    return {
      "communityPostReportId": communityPostReportId,
      "communityPostId": communityPostId,
      "userId": userId,
      "dateTime": dateTime.toUtc().toIso8601String(),
      "description": description,
      "comAdminId": comAdminId,
      "response": response,
    };
  }
}

// void main() {
//   // Create a Post instance
//   Post post = Post()
//     ..postId = 0
//     ..userId = 0
//     ..category = "string"
//     ..description = "string"
//     ..media = ["string"]
//     ..react = [0]
//     ..postStatus = 0
//     ..comments = [
//       Comment()
//         ..commentId = 0
//         ..postId = 0
//         ..userId = 0
//         ..comment = "string",
//     ]
//     ..reports = [
//       Report()
//         ..communityPostReportId = 0
//         ..communityPostId = 0
//         ..userId = 0
//         ..description = "string"
//         ..comAdminId = 0
//         ..response = "string",
//     ];
//
//   // Convert the Post instance to JSON
//   Map<String, dynamic> postJson = post.toJson();
//
//   // Print the JSON representation
//   print(postJson);
// }

//
// {
// "postId": 0,
// "userId": 0,
// "category": "string",
// "description": "string",
// "dateTime": "2023-09-24T19:36:42.987Z",
// "media": [
// "string"
// ],
// "react": [
// 0
// ],
// "postStatus": 0,
// "comments": [
// {
// "commentId": 0,
// "postId": 0,
// "userId": 0,
// "dateTime": "2023-09-24T19:36:42.987Z",
// "comment": "string"
// }
// ],
// "reports": [
// {
// "communityPostReportId": 0,
// "communityPostId": 0,
// "userId": 0,
// "dateTime": "2023-09-24T19:36:42.987Z",
// "description": "string",
// "comAdminId": 0,
// "response": "string"
// }
// ]
// }
