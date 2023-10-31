import 'package:shared_preferences/shared_preferences.dart';

class User {
  late final int? userId;
  late final String? userName;
  late final String? firstName;
  late final String? lastName;
  late String? userEmail;
  late final String? nic;
  late final String? dob;
  late String? district;
  late String? address;
  late String? contactNo;
  late String? workingStatus;
  late String? accountStatus;
  late String? profileImage;

  int? currentMarks = 0;

  User({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.userEmail,
    this.nic,
    this.dob,
    this.district,
    this.address,
    this.contactNo,
    this.workingStatus,
    this.accountStatus,
    this.currentMarks,
    this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json["userId"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userEmail: json["userEmail"],
        nic: json["nic"],
        dob: json["dob"],
        district: json["district"],
        address: json["address"],
        contactNo: json["contactNo"],
        workingStatus: json["workingStatus"],
        accountStatus: json["accountStatus"],
        currentMarks: json["currentMarks"],
        profileImage: json["profileImage"]
    );
  }

  setMarks(int marks) {
    currentMarks = marks;
  }

  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userName', userName!);
    prefs.setInt('userId', userId!);
    prefs.setString('firstName', firstName!);
    prefs.setString('lastName', lastName!);
    prefs.setString('userEmail', userEmail!);
    prefs.setString('nic', nic!);
    prefs.setString('dob', dob.toString());
    prefs.setString('district', district!);
    prefs.setString('address', address!);
    prefs.setString('contactNo', contactNo!);
    prefs.setString('workingStatus', workingStatus!);
    prefs.setString('accountStatus', accountStatus ?? "None");
    prefs.setInt('currentMarks', currentMarks!);
    prefs.setString('profileImage', profileImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Antu_im-user-online.svg/512px-Antu_im-user-online.svg.png");
  }

  static loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User(
      userId: prefs.getInt('userId'),
      userName: prefs.getString('userName'),
      firstName: prefs.getString('firstName'),
      lastName: prefs.getString('lastName'),
      userEmail: prefs.getString('userEmail'),
      nic: prefs.getString('nic'),
      dob: prefs.getString('dob'),
      district: prefs.getString('district'),
      address: prefs.getString('address'),
      contactNo: prefs.getString('contactNo'),
      workingStatus: prefs.getString('workingStatus'),
      accountStatus: prefs.getString('accountStatus') ?? "1",
      currentMarks: prefs.getInt('currentMarks'),
      profileImage: prefs.getString('profileImage'),
    );
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'userEmail': userEmail,
      'nic': nic,
      'dob': dob,
      'district': district,
      'address': address,
      'contactNo': contactNo,
      'workingStatus': workingStatus,
      'accountStatus': accountStatus,
      'currentMarks': currentMarks,
      'profileImage': profileImage,
    };
  }
}
