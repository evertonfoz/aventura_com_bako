import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class CategoriaEspecie extends StatelessWidget {
  final String title;
  final String body;
  final String imageIcon;
  final Color color;

  CategoriaEspecie(
      {Key? key,
      required this.title,
      required this.body,
      required this.imageIcon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 25, left: 8, right: 8),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(500),
                  topRight: Radius.circular(500),
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                ),
                image: new DecorationImage(
                  image: AssetImage(imageIcon),
                  fit: BoxFit.fitHeight,
                ),
                color: color,
              ),
            ),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Color(
                  ColorUtils.hexToInt("#94BF36"),
                ),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          body,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
