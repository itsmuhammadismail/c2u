import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final int? trialedSubscription;
  final String type, fullName, firstName, email, phoneNumber, token, label;
  String status;
  final String? profileImage, lastName;

  User({
    required this.id,
    required this.trialedSubscription,
    required this.type,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.label,
    required this.status,
    required this.profileImage,
  });

  factory User.initial() => User(
        id: 0,
        trialedSubscription: 0,
        type: "",
        fullName: "",
        firstName: "",
        lastName: "",
        email: "",
        phoneNumber: "",
        token: "",
        label: "",
        status: "",
        profileImage: null,
      );

  @override
  List<Object> get props => [
        id,
        type,
        fullName,
        firstName,
        email,
        phoneNumber,
        token,
        label,
        status,
      ];

  @override
  bool get stringify => true;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      trialedSubscription: json['trialedSubscription'],
      type: json['type'],
      fullName: json['fullName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
      label: json['label'],
      status: json['status'],
      profileImage: json['profileImage'],
    );
  }
}
