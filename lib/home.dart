import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:koora/games.dart';
import 'package:koora/messages.dart';
import 'package:koora/notifications.dart';
import 'package:koora/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    getToken(); 
  }
  Future<String?> getToken() async {
    String? token = await storage.read(key: 'jwt_token');
    return token;
  }
  Future<String?> getUser() async {
    String? user = await storage.read(key: 'user');
    return user;
  }
  Future<void> showHome() async {
    String? token = await getToken();
    String? user = await getUser();
    Map<String, dynamic> userData = json.decode(user!);
    print(userData['_id']);
    if(token != null){
      final response = await http.get(
        Uri.parse('http://localhost:3000/'),
        headers: {
          'flutter': 'true',
          'token' : token,
          'userid' : userData['_id']
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
            var code =responseData['code'];
            var responseTextx = responseData['response'];
            
          if(code == 1 ){
              
            }
      } else {
        print('${response.body}');
      }
    }
}











  PageController _pageController = PageController(initialPage: 0);

  List<Widget> carouselItems = [
    InkWell(
      onTap: () {},
      child: Ink(
        child: Image.asset(
          'assets/images/profile.png',
        ),
      ),
    ),
    InkWell(
      onTap: () {},
      child: Ink(
        child: Image.asset(
          'assets/images/profile.png',
        ),
      ),
    ),
    InkWell(
      onTap: () {},
      child: Ink(
        child: Image.asset(
          'assets/images/profile.png',
        ),
      ),
    ),
    InkWell(
      onTap: () {},
      child: Ink(
        child: Image.asset(
          'assets/images/profile.png',
        ),
      ),
    ),
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double a = 0;
    double width(double width) {
      a = width / 430;
      return screenWidth * a;
    }

    double radius = screenWidth < 500 ? width(15) : 17.44186046511628;
    double sizedBoxWidth = screenWidth < 500 ? width(60) : 69.76744186046512;
    double activeAdd = screenWidth < 500 ? width(50) : 48.13953488372093;

    return Scaffold(
      backgroundColor: const Color(0xff343835),
      floatingActionButton: SizedBox(
        width: sizedBoxWidth,
        height: sizedBoxWidth,
        child: SpeedDial(
          backgroundColor: Colors.transparent,
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          children: [
            SpeedDialChild(
              labelWidget: Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF1EED0).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(width(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(14)),
                  child: Text(
                    'new Post',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            SpeedDialChild(
              labelWidget: Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF1EED0).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(width(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(14)),
                  child: Text(
                    'Create Game',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            SpeedDialChild(
              labelWidget: Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF1EED0).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(width(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(14)),
                  child: Text(
                    'Create your Team',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            SpeedDialChild(
              labelWidget: Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF1EED0).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(width(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(14)),
                  child: Text(
                    'Book a Field',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
          activeChild: Image.asset(
            'assets/images/add.png',
            width: activeAdd,
            height: activeAdd,
          ),
          child: Image.asset(
            'assets/images/add.png',
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff343835),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Home',
            style: TextStyle(
              color: Color(0xFFF1EED0),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Profile(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Ink(
              child: Image.asset(
                'assets/images/profileIcon.png',
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  child: Image.asset(
                    'assets/images/search.png',
                  ),
                ),
              ),
              SizedBox(width: width(20)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notifications(),
                    ),
                  );
                },
                child: Ink(
                  child: Image.asset(
                    'assets/images/notifications.png',
                  ),
                ),
              ),
              SizedBox(width: width(20)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Messages(),
                    ),
                  );
                },
                child: Ink(
                  child: Image.asset('assets/images/chat.png'),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(40)),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Games(),
                          ),
                        );
                      },
                      child: Ink(
                        child: Image.asset(
                          'assets/images/games.png',
                          width: width(100),
                          height: width(100),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Image.asset(
                          'assets/images/teams.png',
                          width: width(100),
                          height: width(100),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Image.asset(
                          'assets/images/tournements.png',
                          width: width(100),
                          height: width(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: width(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Games near you',
                    style: TextStyle(
                      color: const Color(0xFFF1EED0),
                      fontSize: width(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(10),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: width(10)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Row(
                    children: List.generate(
                      5, // Replace 'numberOfRepetitions' with the desired number of repetitions
                      (index) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Ink(
                                child: Image.asset(
                                  'assets/images/gameCard.png',
                                  width: width(260),
                                  height: width(150),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width(11),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: width(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Players near you',
                    style: TextStyle(
                      color: const Color(0xFFF1EED0),
                      fontSize: width(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(10),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: width(10)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      10, // Replace 'numberOfRepetitions' with the desired number of repetitions
                      (index) {
                        return Row(
                          children: [
                            SizedBox(width: width(7)),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: Image.asset(
                                      'assets/images/profile.png',
                                      width: width(140),
                                      height: width(200),
                                    ),
                                  ),
                                ),
                                SizedBox(height: width(15)),
                                SizedBox(
                                  width: width(140),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width(7)),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFFF1EED0),
                                        backgroundColor:
                                            const Color(0xFF599068),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width(15),
                                            vertical: width(13)),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Follow',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: width(18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(width: width(7)),
                ],
              ),
            ),
            SizedBox(height: width(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Fields near you',
                    style: TextStyle(
                      color: const Color(0xFFF1EED0),
                      fontSize: width(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(10),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: width(10)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Row(
                    children: List.generate(
                      5, // Replace 'numberOfRepetitions' with the desired number of repetitions
                      (index) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Ink(
                                child: Image.asset(
                                  'assets/images/fieldCard.png',
                                  width: width(260),
                                  height: width(150),
                                ),
                              ),
                            ),
                            SizedBox(width: width(11)),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: width(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Suggested for you',
                    style: TextStyle(
                      color: const Color(0xFFF1EED0),
                      fontSize: width(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(10),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: width(10)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      10, // Replace 'numberOfRepetitions' with the desired number of repetitions
                      (index) {
                        return Row(
                          children: [
                            SizedBox(width: width(7)),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: Image.asset(
                                      'assets/images/profile.png',
                                      width: width(140),
                                      height: width(200),
                                    ),
                                  ),
                                ),
                                SizedBox(height: width(15)),
                                SizedBox(
                                  width: width(140),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width(7)),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFFF1EED0),
                                        backgroundColor:
                                            const Color(0xFF599068),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width(15),
                                            vertical: width(13)),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Follow',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: width(18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(width: width(7)),
                ],
              ),
            ),
            SizedBox(height: width(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Suggested Quickies',
                    style: TextStyle(
                      color: const Color(0xFFF1EED0),
                      fontSize: width(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Watch all',
                    style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(10),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: width(10)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Row(
                    children: List.generate(
                      5, // Replace 'numberOfRepetitions' with the desired number of repetitions
                      (index) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Ink(
                                child: Image.asset(
                                  'assets/images/quickie.png',
                                  width: width(120),
                                  height: width(200),
                                ),
                              ),
                            ),
                            SizedBox(width: width(14)),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: width(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Players to watch',
                    style: TextStyle(
                      color: const Color(0xFFF1EED0),
                      fontSize: width(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(10),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: width(25)),
            CarouselSlider(
              items: carouselItems,
              options: CarouselOptions(
                height: width(300), // Customize the height of the carousel
                autoPlay: true,
                aspectRatio: 2.0,
                viewportFraction: 0.68, // Enable auto-play
                enlargeCenterPage:
                    false, // Increase the size of the center item
                enableInfiniteScroll: true, // Enable infinite scroll
                onPageChanged: (index, reason) {
                  // Optional callback when the page changes
                  // You can use it to update any additional UI components
                },
              ),
            ),
            // SizedBox(
            //   height: width(300),
            //   // width: screenWidth,
            //   child: PageView.builder(
            //     controller: _pageController,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 10, // Number of pages
            //     itemBuilder: (context, index) {
            //       return Center(
            //         child: InkWell(
            //           onTap: () {},
            //           child: Ink(
            //             child: Image.asset(
            //               'assets/images/profile.png',
            //               // fit: BoxFit.fitHeight,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: width(25)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff354038),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Ink(
                child: Image.asset('assets/images/quickies.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                child: Image.asset('assets/images/myActivities.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                child: Image.asset('assets/images/inHome.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                child: Image.asset('assets/images/players.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                child: Image.asset('assets/images/fields.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
