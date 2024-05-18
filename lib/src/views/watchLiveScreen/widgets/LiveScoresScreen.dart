import 'package:capstone/src/views/watchLiveScreen/widgets/CategoryScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../homeScreen/widgets/BuildAgeGroup.dart';

class LiveScoresScreen extends StatefulWidget {
  const LiveScoresScreen({super.key});

  static const String routeName = "/liveScoresScreen";

  @override
  State<LiveScoresScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoresScreen> with TickerProviderStateMixin  {
  late TabController _tabController;
  late TabController _mainCategoryTabController;

  String gender = "Erkek";
  String mainCategory = "Makaralı";

  final List<String> categories = [
    'SÜPERMİNİK',
    'MİNİK A',
    'MİNİK B',
    'MİNİK C',
  ];

  final List<List<String>> superMinikErkek = [
    ["Sarp Taydaş","1"],
    ["Fuat Topaloğlu","1"],
    ["İbrahim Orhan Küçükoğlu","1"],
    ["Uras Damar","1"],
    ["Buray Erkurt","1"]
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _mainCategoryTabController = TabController(length: 2, vsync: this);
    _mainCategoryTabController.addListener(_handleMainTabSelection);
  }

  void _handleMainTabSelection() {
    setState(() {
      if (_mainCategoryTabController.index == 0) {
        mainCategory = "Makaralı";
      } else if (_mainCategoryTabController.index == 1) {
        mainCategory = "Olimpik";
      }
    });
  }


  void _handleTabSelection() {
    setState(() {
     if(_tabController.index == 0){
       gender = "Erkek";
     } else if (_tabController.index == 1){
       gender = "Kız";
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Canlı Skorlar", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          elevation: 2.0,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: TabBar(
            controller: _mainCategoryTabController,
            tabs: const [
              Tab(
                child: Text(
                  'Makaralı',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Olimpik',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: _buildTabViewGender(),
      ),
    );
  }

  Widget _buildTabViewGender() {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            children: [
              _buildGenderGroups("Makaralı"),
              _buildGenderGroups("Olimpik"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenderGroups(String category) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Erkek',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Kız',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => {
                            if(categories[index] == "SÜPERMİNİK" && mainCategory == "Makaralı" && gender == "Erkek"){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryScreen(category: categories[index],gender: gender ,liveScores: superMinikErkek)
                                ),
                              ),
                            }
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Card(
                              elevation: 2,
                              color: Colors.grey,
                              child: Center(child: Text(categories[index])),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
