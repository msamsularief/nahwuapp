class Club {
  int id;
  String kata;
  String bentuk;
  String katagori;
  String irob;
  String tandairob;

  Club(
    this.id,
    this.kata,
    this.bentuk,
    this.katagori,
    this.irob,
    this.tandairob,
  );

  static Club fromJson(Map<String, dynamic> data) {
    return Club(
      data['id'] as int,
      data['kata'] as String,
      data['bentuk'] as String,
      data['katagori'] as String,
      data['irob'] as String,
      data['tandairob'] as String,
    );
  }
}
