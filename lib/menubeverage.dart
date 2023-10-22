class Menulist {
  String name;
  List<int> pump;
  String imagePath;
  String ingredient;

  Menulist(this.name, this.pump, this.imagePath , this.ingredient);
}

  List<Menulist> menu = [
    Menulist(
      "Punch",
      [10000,0,0,0,0,0,0,0,0,0],
      "images/Punch.jpg",
      "Punch"
    ),
    Menulist(
      "Strawberry",
      [0,10000,0,0,0,0,0,0,0,0],
      "images/Strawberry.jpg",
      "Strawberry"
    ),
    Menulist(
      "BlueHawaii",
      [0,0,10000,0,0,0,0,0,0,0],
      "images/BlueHawaii.jpg",
      "BlueHawaii"
    ),
    Menulist(
      "Coconut",
      [0,0,0,10000,0,0,0,0,0,0],
      "images/Coconut.jpg",
      "Coconut"
),
    Menulist(
      "Pea",
      [0,0,0,0,10000,0,0,0,0,0],
      "images/Pea.jpg",
      "Pea"
      ),
    Menulist(
      "Sprite",
      [0,0,0,0,0,10000,0,0,0,0],
      "images/sprite.jpg",
      "Sprite"
      ),
    Menulist(
      "Lemonade",
      [0,0,0,0,0,0,10000,0,0,0],
      "images/Lemonade.jpg",
      "Lemonade"
      ),
    Menulist(
      "Melon",
      [0,0,0,0,0,0,0,10000,0,0],
      "images/Melon.jpg",
      "Melon"
      ),
    Menulist(
      "Orange",
      [0,0,0,0,0,0,0,0,10000,0],
      "images/Orange.jpg",
      "Melon"
      ),
    Menulist(
      "Lynchee",
      [0,0,0,0,0,0,0,0,0,10000],
      "images/Lyngee.jpg",
      "Lynchee"
      ),
  ];