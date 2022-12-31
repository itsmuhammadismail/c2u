class ProfileModel {
  final String tradingName,
      abn,
      gstRegistered,
      businessStructure,
      businessAddressLine1,
      businessAddressLine2,
      city,
      state,
      postalCode,
      firstName,
      lastName,
      phoneNumber,
      otherNumber,
      email,
      website,
      profileImage,
      trades,
      regions,
      availableEmergency,
      liabilityCompany,
      liabilityPolicyNumber,
      expiryDate,
      valueOfCover,
      certificateCurrency,
      constructionSafetyCardNumber,
      constructionSaftyCard,
      drivingLicence,
      drivingLicenceNumber,
      drivingLicenceExpiryDate,
      regulatoryBodyLicenceNumber,
      regulatoryBodyExpiryDate,
      regulatoryBodyLicence,
      workCoverPolicyNumber,
      workCoverExpiryDate,
      workCoverCertificateCurrency,
      localLegislation,
      swms,
      subbieCapabilityDocument,
      notes;

  ProfileModel({
    required this.tradingName,
    required this.abn,
    required this.gstRegistered,
    required this.businessStructure,
    required this.businessAddressLine1,
    required this.businessAddressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.otherNumber,
    required this.email,
    required this.website,
    required this.profileImage,
    required this.trades,
    required this.regions,
    required this.availableEmergency,
    required this.liabilityCompany,
    required this.liabilityPolicyNumber,
    required this.expiryDate,
    required this.valueOfCover,
    required this.certificateCurrency,
    required this.constructionSafetyCardNumber,
    required this.constructionSaftyCard,
    required this.drivingLicence,
    required this.drivingLicenceNumber,
    required this.drivingLicenceExpiryDate,
    required this.regulatoryBodyLicenceNumber,
    required this.regulatoryBodyExpiryDate,
    required this.regulatoryBodyLicence,
    required this.workCoverPolicyNumber,
    required this.workCoverExpiryDate,
    required this.workCoverCertificateCurrency,
    required this.localLegislation,
    required this.swms,
    required this.subbieCapabilityDocument,
    required this.notes,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    print("from json , $json");
    print(
        json['trades']?.map((trade) => trade['trade_id'].toString()).toList());
    return ProfileModel(
      tradingName: json['subbie_info']['trading_name'].toString() ?? '',
      abn: json['subbie_info']['abn'].toString() ?? '',
      gstRegistered: json['subbie_info']['gst_registered'].toString() ?? '',
      businessStructure:
          json['subbie_info']['business_structure'].toString() ?? '',
      businessAddressLine1:
          json['subbie_info']['business_address_line1'].toString() ?? '',
      businessAddressLine2:
          json['subbie_info']['business_address_line2'].toString() ?? '',
      city: json['subbie_info']['city'].toString() ?? '',
      state: json['subbie_info']['state'].toString() ?? '',
      postalCode: json['subbie_info']['postal_code'].toString() ?? '',
      firstName: json['first_name'].toString() ?? '',
      lastName: json['last_name'].toString() ?? '',
      phoneNumber: json['phone_number'].toString() ?? '',
      otherNumber: json['subbie_info']['other_number'].toString() ?? '',
      email: json['email'].toString() ?? '',
      website: json['subbie_info']['website_url'].toString() ?? '',
      profileImage: json['subbie_info']['profile_image'].toString() ?? '',
      trades: json['trades'] == null
          ? ''
          : json['trades']
                  ?.map((trade) => trade['trade'].toString())
                  .toList()
                  .toString() ??
              '',
      regions: json['regions'] == null
          ? ''
          : json['regions']
                  ?.map((trade) => trade['region'].toString())
                  .toList()
                  .toString() ??
              '',
      availableEmergency:
          json['subbie_info']['available_emergency'].toString() ?? '',
      liabilityCompany:
          json['subbie_info']['public_liability_company'].toString() ?? '',
      liabilityPolicyNumber:
          json['subbie_info']['public_liability_policy_number'].toString() ??
              '',
      expiryDate:
          json['subbie_info']['public_liability_expiry_date'].toString() ?? '',
      valueOfCover:
          json['subbie_info']['public_liability_cover_value'].toString() ?? '',
      certificateCurrency:
          json['subbie_info']['public_liability_certificate'].toString() ?? '',
      constructionSafetyCardNumber:
          json['subbie_info']['construction_safty_card_number'].toString() ??
              '',
      constructionSaftyCard:
          json['subbie_info']['construction_safty_card'].toString() ?? '',
      drivingLicence: json['subbie_info']['driving_license'].toString() ?? '',
      drivingLicenceNumber:
          json['subbie_info']['driving_license_number'].toString() ?? '',
      drivingLicenceExpiryDate: json['subbie_info']
                  ['regulatory_body_license_expiry_date']
              .toString() ??
          '',
      regulatoryBodyLicenceNumber:
          json['subbie_info']['regulatory_body_license_number'].toString() ??
              '',
      regulatoryBodyExpiryDate: json['subbie_info']
                  ['regulatory_body_license_expiry_date']
              .toString() ??
          '',
      regulatoryBodyLicence:
          json['subbie_info']['regulatory_body_license'].toString() ?? '',
      workCoverPolicyNumber:
          json['subbie_info']['work_cover_policy_number'].toString() ?? '',
      workCoverExpiryDate:
          json['subbie_info']['work_cover_policy_expiry_date'].toString() ?? '',
      workCoverCertificateCurrency:
          json['subbie_info']['work_cover_policy_certificate'].toString() ?? '',
      localLegislation:
          json['subbie_info']['local_legislation'].toString() ?? '',
      swms: json['subbie_info']['swms'].toString() ?? '',
      subbieCapabilityDocument: json['subbie_info'][''].toString() ?? '',
      notes: json['subbie_info']['notes'].toString() ?? '',
    );
  }
}
