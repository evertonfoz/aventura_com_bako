import 'package:aventura_com_bako/core/routes.dart';
import 'package:aventura_com_bako/features/tutorial/data/models/tutorial_model.dart';
import 'package:aventura_com_bako/features/tutorial/presentation/widgets/card_tutorial_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final _pageController = PageController(initialPage: 0);

  int currentPage = 0;

  void _navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // Holds the background and all the content
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/background-splash.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // Holds all the content
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: _onPageChanged,
                    itemCount: cardList.length,
                    itemBuilder: (context, i) {
                      return TutorialCard(i);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  // Buttons "Anterior" and "Próximo"
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        // "Anterior" button
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: currentPage != 0
                            ? MediaQuery.of(context).size.width * 0.38
                            : null,
                        child: currentPage != 0
                            ? FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.009),
                                child: Text(
                                  'Anterior',
                                  style: TextStyle(
                                    color: Colors.amberAccent[100],
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                  ),
                                ),
                                color: Colors.black.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                onPressed: () {
                                  _navigationTapped(currentPage - 1);
                                },
                              )
                            : null),
                    SizedBox(
                      // Space between "Anterior" and "Próximo" buttons
                      width: currentPage != 0
                          ? MediaQuery.of(context).size.width * 0.08
                          : null,
                    ),
                    Container(
                      // "Próximo" or "Finalizar" button
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: currentPage != 0
                          ? MediaQuery.of(context).size.width * 0.38
                          : MediaQuery.of(context).size.width * 0.85,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.009),
                        child: Text(
                          currentPage == cardList.length - 1
                              ? 'Finalizar'
                              : 'Próximo',
                          style: TextStyle(
                            color: Colors.amberAccent[100],
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: currentPage == cardList.length - 1
                                ? FontWeight.w900
                                : null,
                          ),
                        ),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          currentPage == cardList.length - 1
                              ? Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.home, (route) => false)
                              : _navigationTapped(currentPage + 1);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  // BAKO
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Center(
                    child: Image.asset('assets/bako_vetor.png'),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: Text(
                        "Pular",
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.home, (route) => false);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
