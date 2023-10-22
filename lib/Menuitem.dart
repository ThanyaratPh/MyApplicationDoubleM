class MenuItem {
  String name;
  List<int> pump;
  String imagePath;
  List<String> ingredient;

  MenuItem(this.name, this.pump, this.imagePath , this.ingredient);
}
List<MenuItem> menu = [
    MenuItem(
      "Virgin Mojito",
      [0,0,0,0,0,5000,5000,0,0,0],
      "images/Virginmogito.jpg",
      ["Lemond","Spite","Pepermint"]
    ),
    MenuItem(
      "Strawberry Lemonade",
      [0,5000,0,0,0,0,5000,0,0,0],
      "images/Starwberry Lemonade.jpg",
      ["Strawberry","Lemonade"]
    ),
    MenuItem(
      "Fruit Punch",
      [5000,0,0,0,0,0,5000,0,0,0],
      "images/Fruitpunch.jpg",
      ["Punch","Soda","Lemonade"]
    ),
    MenuItem(
      "Melon Lemon Soda",
      [0,0,0,0,0,0,5000,5000,0,0],
      "images/MelonLemon.jpg",
      ["Melon","Lemonade","Soda"]
  ),MenuItem(
      "Orange Mogito",
      [0,0,0,0,0,0,5000,0,5000,0],
      "images/OrangeMojito.jpg",
      ["Orange","Lemonade","Soda"]
  ),
    MenuItem(
      "Sunset Mocktail",
      [0,5000,0,0,0,2000,0,0,3000,0],
      "images/Sunsetmocktail.jpg",
      ["Strawberry","Sprites","Orange"]
  ),
      MenuItem(
      "Ms.Lively",
      [0,5000,0,0,0,0,2000,0,0,3000],
      "images/Ms.lively.jpg",
      ["Strawberry","Lynchee","Lemonade","Soda"]
  ),
      MenuItem(
      "Coconut Pea",
      [0,0,0,5000,5000,0,0,0,0,0],
      "images/Coconutbutterfly.jpg",
      ["Coconut","Pea"]
  ),
      MenuItem(
      "Coconut BlueHawii",
      [0,0,5000,5000,0,0,0,0,0,0],
      "images/CoconutBlueHawaii.jpg",
      ["BlueHawaii","Coconut","Soda"]
  ),
      MenuItem(
      "Coconut Punch",
      [5000,0,0,5000,0,0,0,0,0,0],
      "images/CoconutPunch.jpg",
      ["Coconut","Punch","Soda"]
  ),
  ];
