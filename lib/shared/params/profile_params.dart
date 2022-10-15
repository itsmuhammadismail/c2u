import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';

class ProfileParams {
  final String token;
  final ProfileModel profile;

  const ProfileParams({
    required this.token,
    required this.profile,
  });
}
