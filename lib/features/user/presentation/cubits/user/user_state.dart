part of 'user_cubit.dart';

enum UserStatus {
  initial,
  loading,
  loaded,
  error,
}

class UserState extends Equatable {
  final UserStatus status;
  final User user;

  const UserState({
    required this.status,
    required this.user,
  });

  factory UserState.initial() => UserState(
        status: UserStatus.initial,
        user: User.initial(),
      );

  @override
  List<Object> get props => [status, user];

  @override
  bool get stringify => true;

  UserState copyWith({
    UserStatus? status,
    User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.toString(),
      'user': {
        "id": user.id,
        "trialedSubscription": user.trialedSubscription,
        "type": user.type,
        "fullName": user.fullName,
        "firstName": user.firstName,
        "lastName": user.lastName,
        "email": user.email,
        "phoneNumber": user.phoneNumber,
        "token": user.token,
        "label": user.label,
        "status": user.status,
        "profileImage": user.profileImage,
      },
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      status: UserStatus.loaded,
      user: User.fromJson(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) =>
      UserState.fromMap(json.decode(source) as Map<String, dynamic>);
}
