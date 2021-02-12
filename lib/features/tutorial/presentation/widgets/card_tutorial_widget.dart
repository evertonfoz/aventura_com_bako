import 'package:aventura_com_bako/features/tutorial/data/models/tutorial_model.dart';
import 'package:flutter/material.dart';

class TutorialCard extends StatefulWidget {
  final int index;
  const TutorialCard(this.index);

  @override
  _TutorialCardState createState() => _TutorialCardState();
}

class _TutorialCardState extends State<TutorialCard> {
  bool isVisible = false;

  void setVisibility(i) {
    if (i != 0) {
      isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        // It limits card size
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Container(
              // Header with "Aventura com Bako" image
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(child: Image.asset('assets/idv.png')),
            ),
            Expanded(
              // Card description
              // Card text
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                    // Column for icon and description of the card
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          // Icon, if currentPage is not 0
                          child: widget.index != 0
                              ? Container(
                                  height: widget.index != 5
                                      ? MediaQuery.of(context).size.height *
                                          0.13
                                      : MediaQuery.of(context).size.height *
                                          0.17,
                                  child: Image.asset(
                                      cardList[widget.index].imageUrl),
                                )
                              : null),
                      SizedBox(
                          height: widget.index != 5
                              ? MediaQuery.of(context).size.height * 0.03
                              : MediaQuery.of(context).size.height * 0.01),
                      Text(
                        cardList[widget.index].cardText,
                        style: TextStyle(
                          fontSize: widget.index != 5
                              ? MediaQuery.of(context).size.height * 0.023
                              : MediaQuery.of(context).size.height * 0.04,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
