class MenuMixed{
  String name;
  List<int>str;
  String imagePath;
  bool checkboxValue1;

  MenuMixed(this.name, this.str, this.imagePath, this.checkboxValue1);

    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'str': str.join(','),
      'image': imagePath,
    };
  }
}
    List<MenuMixed> menu = [
    MenuMixed("Punch", [5000,0,0,0,0,0,0,0,0,0],"images/Punch.jpg",false),
    MenuMixed("Strawberry", [0,5000,0,0,0,0,0,0,0,0],"images/Strawberry.jpg",false),
    MenuMixed("BlueHawaii", [0,0,5000,0,0,0,0,0,0,0],"images/BlueHawaii.jpg",false),
    MenuMixed("Coconut",[0,0,0,5000,0,0,0,0,0,0],"images/Coconut.jpg",false),
    MenuMixed("Pea",[0,0,0,5000,0,0,0,0,0,0],"images/Pea.jpg",false),
    MenuMixed("Sprite",[0,0,0,5000,0,0,0,0,0,0],"images/sprite.jpg",false),
    MenuMixed("Lemoned",[0,0,0,5000,0,0,0,0,0,0],"images/Lemonade.jpg",false),
    MenuMixed("Melon",[0,0,0,5000,0,0,0,0,0,0],"images/Melon.jpg",false),
    MenuMixed("Orange",[0,0,0,5000,0,0,0,0,0,0],"images/Orange.jpg",false),
    MenuMixed("Lychee",[0,0,0,5000,0,0,0,0,0,0],"images/Lyngee.jpg",false)
  ];