part of "../profile_screen.dart";

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String firstName = '', lastName = '', email = '', phone = '', status = '';
  String? image = null;

  @override
  void initState() {
    super.initState();
    User user = context.read<UserCubit>().state.user;
    setState(() {
      image = user.profileImage;
      firstName = user.firstName;
      lastName = user.lastName ?? '';
      email = user.email;
      phone = user.phoneNumber;
      status = user.status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              child: image == null || image == ''
                  ? const Text('BW')
                  : Image.network(image!),
              radius: 50,
            ),
          ),
          const SizedBox(height: 10),
          buildInputArea(name: "First Name", value: firstName),
          buildInputArea(name: "Last Name", value: lastName),
          buildInputArea(name: "Email Address", value: email),
          buildInputArea(name: "Phone Number", value: phone),
          buildInputArea(name: "Status", value: status),
        ],
      ),
    );
  }

  Widget buildInputArea({required String name, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 4),
        MyTextField(hintText: value, onChange: (value) {}, enabled: false),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget buildSelectArea({required String name, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: MyDropdown(
            items: ["Select"],
            selected: "Select",
            onChange: (value) {},
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
