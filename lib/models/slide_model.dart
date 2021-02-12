import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/image1.jpg',
    title: 'A Cool Way To Get Started',
    description:
        'Optio eum sapiente animi ea officiis quisquam accusamus nulla. Autem suscipit voluptas aut omnis. Consequatur nesciunt possimus rerum. Sed adipisci rem est. Quod optio perferendis doloribus eos et delectus ut. Est dolores esse enim aspernatur voluptatem vel.',
  ),
  Slide(
    imageUrl: 'assets/images/image2.jpg',
    title: 'Design Interactive App UI',
    description:
        'Optio eum sapiente animi ea officiis quisquam accusamus nulla. Autem suscipit voluptas aut omnis. Consequatur nesciunt possimus rerum. Sed adipisci rem est. Quod optio perferendis doloribus eos et delectus ut. Est dolores esse enim aspernatur voluptatem vel.',
  ),
  Slide(
    imageUrl: 'assets/images/image3.jpg',
    title: 'It\'s Just The Beginning',
    description:
        'Optio eum sapiente animi ea officiis quisquam accusamus nulla. Autem suscipit voluptas aut omnis. Consequatur nesciunt possimus rerum. Sed adipisci rem est. Quod optio perferendis doloribus eos et delectus ut. Est dolores esse enim aspernatur voluptatem vel.',
  ),
];
