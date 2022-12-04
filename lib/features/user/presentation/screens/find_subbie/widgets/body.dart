part of '../find_subbie_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isPageLoading = true;
  bool isLoading = false;
  List<Trade> trades = [];
  List<Region> regions = [];
  List<Subbie> subbies = [];

  String selectedTrade = "", selectedRegion = "", selectedSubbie = "";

  void fetch() async {
    String token = context.read<UserCubit>().state.user.token;
    await fetchTrades(token);
    await fetchRegions(token);
    await fetchSubbies(token);
    setState(() {
      isPageLoading = false;
    });
  }

  void fetchWithTradeRegions() async {
    setState(() {
      isLoading = true;
    });
    String token = context.read<UserCubit>().state.user.token;
    List<Subbie> mySubbies = await context.read<UserCubit>().getSubbies(token,
        url:
            'subbie?status=active&orderby=id&orderdir=ASC&perpage=10&page=1&regions=1&trades=1');
    setState(() {
      subbies = mySubbies;
      selectedSubbie = subbies[0].name;
      isLoading = false;
    });
  }

  Future<void> fetchTrades(String token) async {
    List<Trade> myTrade = await context.read<UserCubit>().getTrades(token);
    setState(() {
      trades = myTrade;
      selectedTrade = "All";
    });
  }

  Future<void> fetchSubbies(String token) async {
    List<Subbie> mySubbies = await context.read<UserCubit>().getSubbies(token);
    setState(() {
      subbies = mySubbies;
      selectedSubbie = subbies[0].name;
    });
  }

  Future<void> fetchRegions(String token) async {
    List<Region> myRegion = await context.read<UserCubit>().getRegions(token);
    setState(() {
      regions = myRegion;
      selectedRegion = "All";
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: isPageLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...buildDropdown(
                      "By Region",
                      ["All", ...regions.map((e) => e.region).toList()],
                      selectedRegion,
                      (value) {
                        setState(() {
                          selectedRegion = value;
                        });
                        fetchWithTradeRegions();
                      },
                    ),
                    ...buildDropdown(
                      "By Trade",
                      ["All", ...trades.map((e) => e.trade).toList()],
                      selectedTrade,
                      (value) {
                        setState(() {
                          selectedTrade = value;
                        });
                        fetchWithTradeRegions();
                      },
                    ),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: subbies.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: subbies[index].image !=
                                              null
                                          ? NetworkImage(subbies[index].image!)
                                          : null,
                                    ),
                                    title: Text(subbies[index].name),
                                    subtitle: Text(subbies[index].email),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Row(children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          child: const Text('Subbie Details'),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {},
                                            child: const Text('Assign Job')),
                                      )
                                    ]),
                                  )
                                ],
                              );
                            }),
                  ],
                ),
              ));
  }

  List<Widget> buildDropdown(
      String name, List<String> items, String selected, onChange) {
    return [
      Text(name),
      const SizedBox(height: 5),
      SizedBox(
        width: double.infinity,
        child: MyDropdown(
          items: items,
          selected: selected,
          onChange: (value) {
            onChange(value);
          },
        ),
      ),
      const SizedBox(height: 20),
    ];
  }
}
