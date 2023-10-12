class Menulist {
  String name;
  List<int> pump;
  String imagePath;
  String ingredient;

  Menulist(this.name, this.pump, this.imagePath , this.ingredient);
}

  List<Menulist> menu = [
    Menulist(
      "Coconut",
      [0,1000,100,10,0,0,0,0,0,0],
      "images/Coconut.jpg",
      "Coconut"
    ),
    Menulist(
      "Strawberry",
      [0,2000,200,20,0,0,0,0,0,0],
      "images/Strawberry.jpg",
      "Strawberry"
    ),
    Menulist(
      "Melon",
      [0,5000,500,50,0,0,0,0,0,0],
      "images/Melon.jpg",
      "Melon"
    ),
    Menulist(
      "Blue Hawaii",
      [0,1000,100,10,0,0,0,0,0,0],
      "images/BlueHawaii.jpg",
      "Blue Hawaii"
),
    Menulist(
      "Pea",
      [0,2000,200,20,0,0,0,0,0,0],
      "images/Pea.jpg",
      "Pea"
      ),
    Menulist(
      "Orange",
      [0,5000,500,50,0,0,0,0,0,0],
      "images/Orange.jpg",
      "Orange"
      ),
    Menulist(
      "Lemonade",
      [0,1000,100,10,0,0,0,0,0,0],
      "images/Lemonade.jpg",
      "Lemonade"
      ),
    Menulist(
      "Lynchee",
      [0,1000,100,10,0,0,0,0,0,0],
      "images/Lyngee.jpg",
      "Lemonade"
      ),
  ];