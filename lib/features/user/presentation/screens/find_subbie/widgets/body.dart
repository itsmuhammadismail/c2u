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

  String selectedTrade = "",
      selectedRegion = "",
      selectedSubbie = "",
      selectedJob = "";

  void fetch() async {
    String token = context.read<UserCubit>().state.user.token;
    fetchTrades(token);
    fetchRegions(token);
    await fetchSubbies(token);
    setState(() {
      isPageLoading = false;
    });
    await fetchJobs(token);
  }

  void fetchWithTradeRegions() async {
    setState(() {
      isLoading = true;
    });
    String token = context.read<UserCubit>().state.user.token;

    String url = 'subbie?status=active&orderby=id&orderdir=ASC';

    // '&regions=1&trades=1'

    List<Trade> myTradeId =
        trades.where((t) => t.trade == selectedTrade).toList();
    List<Region> myRegionId =
        regions.where((r) => r.region == selectedRegion).toList();

    if (myRegionId.isNotEmpty) url += '&regions=${myRegionId[0].regionId}';
    if (myTradeId.isNotEmpty) url += '&trades=${myTradeId[0].tradeId}';

    print(myTradeId);
    print(myRegionId);
    print(url);

    List<Subbie> mySubbies =
        await context.read<UserCubit>().getSubbies(token, url: url);
    setState(() {
      subbies = mySubbies;
      // selectedSubbie = subbies[0].name;
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
      selectedSubbie = subbies.length > 0 ? subbies[0].name : '';
    });
  }

  Future<void> fetchRegions(String token) async {
    List<Region> myRegion = await context.read<UserCubit>().getRegions(token);
    setState(() {
      regions = myRegion;
      selectedRegion = "All";
    });
  }

  Future<void> fetchJobs(String token) async {
    String id = context.read<UserCubit>().state.user.id.toString();
    String role = context.read<UserCubit>().state.user.type;
    await context.read<JobsCubit>().getSubbiesJobs(token, id, role);
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void assignJob(int id) async {
    try {
      List<Job> myJobs = context
          .read<JobsCubit>()
          .state
          .jobs
          .where((j) => j.name == selectedJob)
          .toList();
      Map<String, String> data = {
        'job': myJobs[0].id.toString(),
      };
      String token = context.read<UserCubit>().state.user.token;
      var res = await NetworkHelper.post(
          url: 'job/${id}/assign_job', token: token, data: data);
      print(res);
      Navigator.pop(context);
      const snackBar = SnackBar(
        content: Text('Job Assigned Successfully!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (err) {
      print(err);
      Navigator.pop(context);
      var snackBar = SnackBar(
        content: Text(err.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "Assign Job to ${subbies[index].name}"),
                                                      content: SizedBox(
                                                          height: 80,
                                                          child: Column(
                                                            children: [
                                                              ...buildDropdown(
                                                                "Jobs",
                                                                [
                                                                  "",
                                                                  ...context
                                                                      .watch<
                                                                          JobsCubit>()
                                                                      .state
                                                                      .jobs
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .toList()
                                                                ],
                                                                "",
                                                                (value) {
                                                                  setState(() {
                                                                    selectedJob =
                                                                        value;
                                                                  });
                                                                  fetchWithTradeRegions();
                                                                },
                                                              )
                                                            ],
                                                          )),
                                                      actions: [
                                                        ElevatedButton(
                                                            onPressed: () =>
                                                                assignJob(
                                                                    subbies[index]
                                                                        .id),
                                                            child: const Text(
                                                                'Save Changes')),
                                                      ],
                                                    );
                                                  });
                                            },
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
          items: ['', ...items],
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
