import 'package:equatable/equatable.dart';

class Subbie extends Equatable {
  final int id;
  final String name, email;
  final String? image;

  const Subbie({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  factory Subbie.initial() => Subbie(
        id: 0,
        name: "",
        email: "",
        image: null,
      );

  @override
  List<Object?> get props => [id, name, email, image];
}
