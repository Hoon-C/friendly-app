class Info {
  late final int? idx;
  late final String? name;
  late final String? image;
  late final String? kcal;
  late final String? effect;
  late final String? keep;
  late final String? tip;
  late final String? info;
  late final String? youtube01;
  late final String? youtube02;
  late final String? youtube03;
  late final String? season;

  Info(
      {this.idx,
      this.name,
      this.effect,
      this.image,
      this.info,
      this.kcal,
      this.keep,
      this.tip,
      this.youtube01,
      this.youtube02,
      this.youtube03,
      this.season});

  Info.fromJson(Map<String, dynamic> json) {
    idx = json['idx'];
    youtube01 = json['youtube01'];
    image = json['image'];
    kcal = json['kcal'];
    youtube02 = json['youtube02'];
    youtube03 = json['youtube03'];
    effect = json['effect'];
    keep = json['keep'];
    name = json['name'];
    season = json['season'];
    tip = json['tip'];
    info = json['info'];
  }
}

class Model {
  late final int? idx;
  late final String? name;
  late final String? image;
  late final String? kcal;
  late final String? effect;
  late final String? keep;
  late final String? tip;
  late final String? info;
  late final String? youtube01;
  late final String? youtube02;
  late final String? youtube03;
  late final String? season;

  Model(
      {this.idx,
      this.name,
      this.effect,
      this.image,
      this.info,
      this.kcal,
      this.keep,
      this.tip,
      this.youtube01,
      this.youtube02,
      this.youtube03,
      this.season});

  Model.fromJson(Map<String, dynamic> json) {
    idx = json['idx'];
    youtube01 = json['youtube01'];
    image = json['image'];
    kcal = json['kcal'];
    youtube02 = json['youtube02'];
    youtube03 = json['youtube03'];
    effect = json['effect'];
    keep = json['keep'];
    name = json['name'];
    season = json['season'];
    tip = json['tip'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() => {
        'idx': idx,
        'name': name,
        'image': image,
        'kcal': kcal,
        'info': info,
        'effect': effect,
        'keep': keep,
        'tip': tip,
        'youtube01': youtube01,
        'youtube02': youtube02,
        'youtube03': youtube03,
        'season': season,
      };
}
