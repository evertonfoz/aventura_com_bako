import 'package:aventura_com_bako/models/tutorial_model.dart';
import 'package:aventura_com_bako/widgets/card_tutorial_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TutorialLayout(),
    );
  }
}

class TutorialLayout extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // Holds the background and all the content
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/background-splash.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
        Center(
          child: Column(
            // Holds all the content
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: cardList.length,
                itemBuilder: (context, i) => TutorialCard(i),
              ), // A widget for the card
              Center(
                child: RaisedButton(
                  child: Text(
                    'Próximo',
                    style: TextStyle(color: Colors.amberAccent[100]),
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Center(
                  child: Image.asset('assets/bako_vetor.png'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
