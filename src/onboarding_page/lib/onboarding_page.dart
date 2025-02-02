import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './models/onboarding_item.dart';

const splashScreenBgAnimationDuration = 800;

class DisabledGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, _) {
    return child;
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final double _currentPageTracker = 0;

  final double _offset = 85;

  @override
  void initState() {
    super.initState();

    setIsLoggedInToFalse();

    _pageController.addListener(() {
      // if (_pageController.page! > _currentPageTracker) {
      //   // pageview is being swiped from right to left
      //   _currentPage = _pageController.page!.ceil().toInt();
      // } else {
      //   // pageview is being swiped from left to right
      //   _currentPage = _pageController.page!.floor().toInt();
      // }

      double maxScrollExtent = _pageController.position.maxScrollExtent;
      double scrollExtentPerSection = maxScrollExtent / 4;

      double scrollPosition = _pageController.position.pixels;

      if (scrollPosition > scrollExtentPerSection * 3) {
        setState(() {
          _currentPage = 3;
        });
      } else if (scrollPosition >
          scrollExtentPerSection + scrollExtentPerSection / 2) {
        setState(() {
          _currentPage = 2;
        });
      } else if (scrollPosition > scrollExtentPerSection / 2) {
        setState(() {
          _currentPage = 1;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }
    });
  }

  setIsLoggedInToFalse() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('is_logged_in', false);
  }

  _setHasShownWelcomeScreenToTrue() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('has_shown_welcome_screen', true);
  }

  @override
  Widget build(BuildContext context) {
    const logoEntry = splashScreenBgAnimationDuration;
    const getStartedButtonEntry = logoEntry + 1500;
    const featureTextEntry = getStartedButtonEntry + 800;
    final height = MediaQuery.of(context).size.height;

    final List<OnboardingItem> screenEntityList = [
      OnboardingItem(
        id: 'feature_one',
        title: 'Discover & Connect',
        subtitle: 'Explore new possibilities and stay connected effortlessly.',
        assetImage: 'discover_connect',
        primaryColor: const Color(0xffC53F3F),
      ),
      OnboardingItem(
        id: 'feature_two',
        title: 'Flexibility at Your Fingertips',
        subtitle: 'Use the app the way you want, anytime, anywhere.',
        assetImage: 'flexibility',
        primaryColor: const Color(0xff86C163),
      ),
      OnboardingItem(
        id: 'feature_three',
        title: 'Optimize & Grow',
        subtitle:
            'Leverage smart tools to enhance your experience and performance.',
        assetImage: 'optimize_grow',
        primaryColor: const Color(0xffff725e),
      ),
      OnboardingItem(
        id: 'feature_four',
        title: 'Seamless Transactions',
        subtitle:
            'Manage your activities with ease and get things done faster.',
        assetImage: 'seamless_transactions',
        primaryColor: const Color(0xff90CAF9),
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
          backgroundColor: const Color(0xfff7f7f7),
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: double.infinity,
          height: height,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      scrollBehavior: DisabledGlowBehaviour(),
                      controller: _pageController,
                      children: screenEntityList
                          .map(
                            (e) => MascotAndDetailContainer(
                              welcomeScreenEntity: e,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Row(
                      children: [
                        PageViewBullets(
                          pageViewItemListLength: screenEntityList.length,
                          selectedPageIndex: _currentPage,
                          primaryColor:
                              screenEntityList[_currentPage].primaryColor,
                        ),
                        const Spacer(),
                        ActionButton(
                          color: screenEntityList[_currentPage].primaryColor,
                          onPressed: () {
                            if (_currentPage == 3) {
                              // Provider.of<InputPhoneNumberData>(context,
                              //         listen: false)
                              //     .clear();

                              // // _setHasShownWelcomeScreenToTrue();

                              // Navigator.pushReplacement(
                              //   context,
                              //   PageTransition(
                              //     child: InputPhoneNumberScreen(),
                              //     type: PageTransitionType.rightToLeft,
                              //     duration: const Duration(milliseconds: 500),
                              //   ),
                              // );
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'images/pustack_tutor_color_logo.png',
                  width: MediaQuery.of(context).size.width * .35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MascotAndDetailContainer extends StatelessWidget {
  final OnboardingItem welcomeScreenEntity;

  const MascotAndDetailContainer({
    super.key,
    required this.welcomeScreenEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 6,
          child: Container(
            color: const Color(0xfff7f7f7),
            padding: const EdgeInsets.only(top: 30),
            // child: SvgPicture.asset(
            //   'images/welcome_screen/${welcomeScreenEntity.assetImage}.svg',
            // ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 60, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  welcomeScreenEntity.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  welcomeScreenEntity.subtitle,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff757f92),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PageViewBullets extends StatelessWidget {
  final int pageViewItemListLength;
  final int selectedPageIndex;
  final Color primaryColor;

  const PageViewBullets({
    super.key,
    required this.pageViewItemListLength,
    required this.selectedPageIndex,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(pageViewItemListLength, (index) => index)
          .map(
            (e) => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: e == selectedPageIndex
                    ? primaryColor
                    : const Color(0xffd9d9d9),
              ),
              height: 6,
              margin: const EdgeInsets.only(right: 8),
              width: 6,
            ),
          )
          .toList(),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: const EdgeInsets.all(15),
        child: RotatedBox(
          quarterTurns: 2,
          // You can easily swap it out with SvgPicture.asset to quickly load SVG assets from assets folder.
          child: SvgPicture.network(
            'images/long_tail_back_arrow.svg',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
