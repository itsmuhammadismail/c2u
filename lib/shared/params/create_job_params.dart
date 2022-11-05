class CreateJobParams {
  final String token,
      contractor,
      trade,
      region,
      title,
      address,
      city,
      state,
      postalCode,
      startDate,
      description,
      status,
      assignJob,
      documents;

  CreateJobParams({
    required this.token,
    required this.contractor,
    required this.trade,
    required this.region,
    required this.title,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.startDate,
    required this.description,
    required this.status,
    required this.assignJob,
    required this.documents,
  });
}
