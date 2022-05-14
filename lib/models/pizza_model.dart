class PizzaModel {
  String? name;
  bool? isVeg;
  String? description;
  int? defaultCrust;
  List<Crusts>? crusts;
  List<Sizes>? sizes;

  PizzaModel(
      {this.name,
      this.isVeg,
      this.description,
      this.defaultCrust,
      this.crusts,
      this.sizes});

  PizzaModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isVeg = json['isVeg'];
    description = json['description'];
    defaultCrust = json['defaultCrust'];
    if (json['crusts'] != null) {
      crusts = <Crusts>[];
      json['crusts'].forEach((v) {
        crusts!.add(new Crusts.fromJson(v));
      });
    }
     if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isVeg'] = this.isVeg;
    data['description'] = this.description;
    data['defaultCrust'] = this.defaultCrust;
    if (this.crusts != null) {
      data['crusts'] = this.crusts!.map((v) => v.toJson()).toList();
    }
     if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Crusts {
  int? id;
  String? name;
  int? defaultSize;
  List<Sizes>? sizes;

  Crusts({this.id, this.name, this.defaultSize, this.sizes});

  Crusts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    defaultSize = json['defaultSize'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['defaultSize'] = this.defaultSize;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizes {
  int? id;
  String? name;
  int? price;

  Sizes({this.id, this.name, this.price});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
