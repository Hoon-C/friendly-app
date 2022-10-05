class User {
  String name = "";
  String uid = "";
  int number = 0;

  User({required this.name, required this.uid, required this.number});

  String get getName => name;
  set setName(String name) => this.name = name;
  String get getId => uid;
  set setId(String uid) => this.uid = uid;
  int get getNumber => number;
  set setNumber(int number) => this.number = number;

  void setInit() {
    uid = "";
    name = "";
    number = 0;
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'number': number,
      };
}
