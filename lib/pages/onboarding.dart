import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:agrixtech_application_1/Pages/login.dart';

import 'auth_page.dart';



class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Map<String, String>>  _onboardingData = [
    {
      'title': 'Gérez avec une grande facilité vos activités en plantation et prenez des décisions éclairées.',
      'description': "Bienvenue dans notre application qui vous permettra de gérer toutes vos activités grâce à l'analyse des données issues de vos champs et aux conseils de nos experts.",
      'image': 'assets/Images/Onboarding_1.png',
    },
    {
      'title': 'Détectez les problèmes dans vos champs plus facilement.',
      'description': 'Grâce à nos modèles vous pourrez détecter plus rapidement et plus simplement les problèmes liés aux maladies, ravageurs et aux carences nutritives. ',
      'image': 'assets/Images/Onboarding_2.png',
    },
    {
      'title': 'Réduisez vos coûts et accroissez vos revenus.',
      'description': "En suivant de près les conditions météorologiques et l'état de vos cultures vous pourrez d'une part économiser sur les coûts de fertilisation et de traitements tout en augmentant vos revenus",
      'image': 'assets/Images/Onboarding_.png',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int initScreen = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', initScreen);
    int isViewed = 1;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('initOnbaord', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(padding: const EdgeInsets.only(right: 35),
            child: TextButton(
              child: const Text("Passer",style: TextStyle(color: Colors.black, fontSize: 18)), 
              onPressed:() {
                _storeOnboardInfo();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AuthPage()));
              },
            )
          ),
        ]
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return buildOnboardingPage(_onboardingData[index]);
                },
              ),
            ),
            buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage(Map<String, String> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data['image']!,
            height: data['image'] == "assets/Images/Onboarding_.png"? 400:300,
          ),
          const SizedBox(height: 32.0),
          Text(
            data['title']!,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              height: 1.5
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            data['description']!,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 16.0, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => buildDot(index),
            ),
          ),
          const Padding(padding: EdgeInsets.only(right:200)),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              backgroundColor:const Color.fromRGBO(64, 212, 0, 1),
            ),
            onPressed: () {
              if (_currentPage < _onboardingData.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                _storeOnboardInfo();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AuthPage()));
              }
            },
            child: Text(
              _currentPage < _onboardingData.length - 1 ? 'Suivant' : 'Débuter',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8.0),
      height: 8.0,
      width: _currentPage == index ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color.fromRGBO(64, 212, 0, 1) : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

           



