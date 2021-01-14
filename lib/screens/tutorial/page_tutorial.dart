import 'package:aventura_com_bako/models/tutorial_model.dart';
import 'package:aventura_com_bako/widgets/card_tutorial_widget.dart';
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
                  height: MediaQuery.of(context).size.height * 0.075,
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
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      currentPage == cardList.length - 1
                          ? 'Finalizar'
                          : 'Próximo',
                      style: TextStyle(
                        color: Colors.amberAccent[100],
                        fontSize: 20,
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
                          ? Navigator.pushNamed(context, '/home')
                          : _navigationTapped(currentPage + 1);
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                    child: Image.asset('assets/bako_vetor.png'),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
