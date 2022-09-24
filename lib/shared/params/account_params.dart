class AccountParams {
  final String token, firstName, lastName, userType, email, phone;
  final String? image;

  const AccountParams({
    required this.token,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.email,
    required this.phone,
  });
}
