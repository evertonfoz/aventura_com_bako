import 'package:aventura_com_bako/models/tutorial_model.dart';
import 'package:flutter/material.dart';

class TutorialCard extends StatelessWidget {
  final int index;
  const TutorialCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Container(
              // Header
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01),
              height: MediaQuery.of(context).size.height * 0.12,
              child: Center(child: Image.asset('assets/idv.png')),
            ),
            Expanded(
              // Card text
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/icons/book.png'),
                      ),
                      Text(
                        cardList[index].cardText,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
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
