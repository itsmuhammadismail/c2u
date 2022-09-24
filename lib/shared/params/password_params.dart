class PasswordParams {
  final String token, currentPassword, password, confirmPassword;

  const PasswordParams({
    this.token = '',
    this.currentPassword = '',
    this.password = '',
    this.confirmPassword = '',
  });
}
