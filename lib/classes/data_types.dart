class Customer {
  final String? id;
  final String name;
  final String email;
  final String phone;

  Customer(
      {this.id, required this.name, required this.email, required this.phone});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['_id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
  };
}

class Order {
  final int? id;
  final int customerId;
  final int userId;
  final int totalAmount;

  Order(
      {this.id,
      required this.customerId,
      required this.userId,
      required this.totalAmount});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int?,
      customerId: json['customerId'] as int,
      userId: json['userId'] as int,
      totalAmount: json['totalAmount'] as int,
    );
  }
  Map<String, dynamic> toJson() => {

    'customerId': customerId,
    'userId': userId,
    'totalAmount': totalAmount,
  };
}

class OrderItem {
  final int? id;
  final int orderId;
  final int productId;
  final int quantity;
  final int price;

  OrderItem(
      {this.id,
      required this.orderId,
      required this.productId,
      required this.quantity,
      required this.price});
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as int?,
      orderId: json['orderId'] as int,
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() => {

    'orderId': orderId,
    'productId': productId,
    'quantity': quantity,
    'price': price,
  };
}

class Product {
  final int? id;
  final String name;
  final String description;
  final int price;
  final int stock;

  Product(
      {this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.stock});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      stock: json['stock'] as int,
    );
  }

  Map<String, dynamic> toJson() => {

    'name': name,
    'description': description,
    'price': price,
    'stock': stock,
  };
}

class User {
  final String username;
  final String password;
  final String email;
  final bool isAdmin;
  final String type;

  User(
      {required this.username,
      required this.password,
      required this.email,
      required this.isAdmin,
      required this.type});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() => {

    'username': username,
    'password': password,
    'email': email,
    'isAdmin': isAdmin,
    'type': type,
  };
}
