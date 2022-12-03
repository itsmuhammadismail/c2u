class ContractorProfileModel {
  final int id;
  final String type,
      fullName,
      firstName,
      lastName,
      email,
      phoneNumber,
      status,
      bussinessName,
      abn,
      addressLine1,
      addressLine2,
      city,
      state,
      postalCode;
  final String? profileImage, otherNumber;

  ContractorProfileModel({
    required this.id,
    required this.type,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profileImage,
    required this.status,
    required this.bussinessName,
    required this.abn,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.otherNumber,
  });

  factory ContractorProfileModel.fromJson(Map<String, dynamic> json) {
    print("from json $json");
    return ContractorProfileModel(
      id: json['user_id'] ?? 0,
      type: json['type'] ?? '',
      fullName: json['fullname'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      profileImage: json['profile_image'] ?? '',
      status: json['status'] ?? '',
      bussinessName: json['contractor_info']['business_name'] ?? '',
      abn: json['contractor_info']['abn'] ?? '',
      addressLine1: json['contractor_info']['business_address_line1'] ?? '',
      addressLine2: json['contractor_info']['business_address_line2'] ?? '',
      city: json['contractor_info']['city'] ?? '',
      state: json['contractor_info']['state'] ?? '',
      postalCode: json['contractor_info']['postal_code'] ?? '',
      otherNumber: json['contractor_info']['other_number'],
    );
  }
}
