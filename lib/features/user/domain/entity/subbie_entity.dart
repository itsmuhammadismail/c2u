import 'package:equatable/equatable.dart';

class Subbie extends Equatable {
  final int id;
  final String name, email;

  const Subbie({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Subbie.initial() => Subbie(
        id: 0,
        name: "",
        email: "",
      );

  @override
  List<Object?> get props => [id, name, email];
}
