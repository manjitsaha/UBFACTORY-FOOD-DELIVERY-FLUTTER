class CartModel {
  Cart? cart;
  int? totalPrice;

  CartModel({this.cart, this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class Cart {
  String? sId;
  String? customerId;
  List<CartDetails>? cartDetails;
  int? cartCount;
  String? createdAt;
  String? updatedAt;
  bool? isOrdered;
  int? iV;

  Cart(
      {this.sId,
      this.customerId,
      this.cartDetails,
      this.cartCount,
      this.createdAt,
      this.updatedAt,
      this.isOrdered,
      this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['customerId'];
    if (json['cartDetails'] != null) {
      cartDetails = <CartDetails>[];
      json['cartDetails'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
    cartCount = json['cartCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isOrdered = json['isOrdered'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['customerId'] = this.customerId;
    if (this.cartDetails != null) {
      data['cartDetails'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    data['cartCount'] = this.cartCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isOrdered'] = this.isOrdered;
    data['__v'] = this.iV;
    return data;
  }
}

class CartDetails {
  String? productId;
  String? productName;
  String? fileUrl;
  SizeDetails? sizeDetails;
  int? quantity;
  String? price;

  CartDetails(
      {this.productId,
      this.productName,
      this.fileUrl,
      this.sizeDetails,
      this.quantity,
      this.price});

  CartDetails.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    fileUrl = json['fileUrl'];
    sizeDetails = json['sizeDetails'] != null
        ? new SizeDetails.fromJson(json['sizeDetails'])
        : null;
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['fileUrl'] = this.fileUrl;
    if (this.sizeDetails != null) {
      data['sizeDetails'] = this.sizeDetails!.toJson();
    }
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}

class SizeDetails {
  String? sId;
  String? size;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  int? iV;

  SizeDetails(
      {this.sId,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.iV});

  SizeDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['size'] = this.size;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['__v'] = this.iV;
    return data;
  }
}
