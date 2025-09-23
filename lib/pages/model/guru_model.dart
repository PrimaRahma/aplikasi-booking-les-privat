abstract class Guru {
  String _name;
  String _level;
  int _price;
  double _rating;
  String _photo;

  Guru(this._name, this._level, this._price, this._rating, this._photo);

  // Getter
  String get name => _name;
  String get level => _level;
  int get price => _price;
  double get rating => _rating;
  String get photo => _photo;

  // Setter
  set name(String value) => _name = value;
  set level(String value) => _level = value;
  set price(int value) => _price = value;
  set rating(double value) => _rating = value;
  set photo(String value) => _photo = value;

  String deskripsi();
}

class GuruSD extends Guru {
  GuruSD(String name, int price, double rating, String photo)
    : super(name, "SD", price, rating, photo);

  @override
  String deskripsi() => "$name adalah guru SD dengan rating $rating ⭐";
}

class GuruSMP extends Guru {
  GuruSMP(String name, int price, double rating, String photo)
    : super(name, "SMP", price, rating, photo);

  @override
  String deskripsi() => "$name adalah guru SMP dengan rating $rating ⭐";
}

class GuruSMA extends Guru {
  GuruSMA(String name, int price, double rating, String photo)
    : super(name, "SMA/SMK", price, rating, photo);

  @override
  String deskripsi() => "$name adalah guru SMA/SMK dengan rating $rating ⭐";
}
