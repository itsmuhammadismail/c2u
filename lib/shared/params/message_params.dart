class MessageParams {
  final String token, jobId, message;

  const MessageParams({
    required this.token,
    required this.jobId,
    this.message = '',
  });
}
