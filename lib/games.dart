import 'package:flutter/material.dart';
import 'package:koora/home.dart';
import 'package:koora/profile.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double a = 0;
    double width(double width) {
      a = width / 430;
      return screenWidth * a;
    }

    double sizedBoxWidth = screenWidth < 500 ? width(60) : 69.76744186046512;

    return Scaffold(
      backgroundColor: const Color(0xff343835),
      floatingActionButton: SizedBox(
        width: sizedBoxWidth,
        height: sizedBoxWidth,
        child: InkWell(
          onTap: () {},
          child: Ink(
            child: Image.asset('assets/images/addGame.png'),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff343835),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Games',
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
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(20)),
          child: Column(
            children: [
              SizedBox(height: width(15)),
              Column(
                children: List.generate(
                  10, // Replace 'numberOfRepetitions' with the desired number of repetitions
                  (index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width(2)),
                              child: Image.asset(
                                'assets/images/gameBg.png',
                                width: width(388),
                                height: width(226),
                                opacity: const AlwaysStoppedAnimation(0.6),
                              ),
                            ),
                            Positioned(
                              top: width(23),
                              child: Container(
                                width: width(104),
                                height: width(21),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF599068), // Green color
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(width(3)),
                                    bottomRight: Radius.circular(width(3)),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      width(13), width(3), 0, 0),
                                  child: Text(
                                    'Today, 9:00 pm',
                                    style: TextStyle(
                                      color: const Color(0xFFF1EED0),
                                      fontSize: width(10),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: width(40),
                              left: width(154),
                              child: Text(
                                'Takwira Name',
                                style: TextStyle(
                                  color: const Color(0xFFF1EED0),
                                  fontSize: width(12),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(height: width(62)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width(22)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'dd Month, YYYY',
                                        style: TextStyle(
                                          color: const Color(0xFFF1EED0),
                                          fontSize: width(12),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        'Field Name',
                                        style: TextStyle(
                                          color: const Color(0xFFF1EED0),
                                          fontSize: width(12),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: width(2)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width(32)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '99.999' + ' DNT',
                                        style: TextStyle(
                                          color: const Color(0xFFF1EED0),
                                          fontSize: width(12),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        '99,9' + ' Km away',
                                        style: TextStyle(
                                          color: const Color(0xFFF1EED0),
                                          fontSize: width(10),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: width(19)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/profileIcon.png',
                                        width: width(34),
                                        height: width(40),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              const Color(0xFFF1EED0),
                                          backgroundColor:
                                              const Color(0xFF599068),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(width(5)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width(15),
                                              vertical:
                                                  width(10)), // button's shape
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Join',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width(12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: width(14)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width(22)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LinearProgressBar(
                                              maxSteps: 14,
                                              progressType: LinearProgressBar
                                                  .progressTypeLinear, // Use Linear progress
                                              currentStep: 7,
                                              progressColor:
                                                  const Color(0xff599068),
                                              backgroundColor:
                                                  const Color(0xffF1EED0)
                                                      .withOpacity(0.3),
                                            ),
                                            SizedBox(height: width(4)),
                                            Text(
                                              '7',
                                              style: TextStyle(
                                                color: const Color(0xFFF1EED0),
                                                fontWeight: FontWeight.normal,
                                                fontSize: width(10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: width(18)),
                                      Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/jerseyNum.png',
                                            width: width(24),
                                            height: width(24),
                                          ),
                                          SizedBox(height: width(4)),
                                          Text(
                                            '14',
                                            style: TextStyle(
                                              color: const Color(0xFFF1EED0),
                                              fontWeight: FontWeight.normal,
                                              fontSize: width(10),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: width(15)),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: Ink(
                child: Image.asset('assets/images/home.png'),
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
