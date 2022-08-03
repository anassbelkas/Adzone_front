import 'package:flutter/material.dart';

class News {
  final int id;
  final String title, description;
  final List<String> images;

  News({
    @required this.id,
    @required this.images,
    @required this.title,
    @required this.description,
  });
}

// Our demo 

List<News> demoNews = [
  News(
    id: 1,
    images: [
      "images/woolworths.png",
    ],
    title: "McDonald’s officially added to AdZone",
    description: description,
  ),
  News(
    id: 2,
    images: [
      "images/istore.png",
    ],
    title: "Patch notes for update ver. 0.0.1",
    description: description,
  ),
  News(
    id: 3,
    images: [
      "images/kfc.png",
    ],
    title: "KFC's officially added to AdZone",
    description: description,
  ),
];

const String description =
    "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.";