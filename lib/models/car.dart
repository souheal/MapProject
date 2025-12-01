class Car {
  final String id;
  final String name;
  final String brand;
  final String model;
  final int year;
  final String category;
  final double pricePerDay;
  final String image;
  final double rating;
  final int seats;
  final String transmission;
  final String fuelType;
  final String engine;
  final String mileage;
  final String color;
  final List<String> features;
  final String description;
  final bool available;

  Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.category,
    required this.pricePerDay,
    required this.image,
    required this.rating,
    required this.seats,
    required this.transmission,
    required this.fuelType,
    required this.engine,
    required this.mileage,
    required this.color,
    required this.features,
    required this.description,
    required this.available,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: json['year'] as int,
      category: json['category'] as String,
      pricePerDay: (json['pricePerDay'] as num).toDouble(),
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      seats: json['seats'] as int,
      transmission: json['transmission'] as String,
      fuelType: json['fuelType'] as String,
      engine: json['engine'] as String,
      mileage: json['mileage'] as String,
      color: json['color'] as String,
      features: List<String>.from(json['features'] as List),
      description: json['description'] as String,
      available: json['available'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'model': model,
      'year': year,
      'category': category,
      'pricePerDay': pricePerDay,
      'image': image,
      'rating': rating,
      'seats': seats,
      'transmission': transmission,
      'fuelType': fuelType,
      'engine': engine,
      'mileage': mileage,
      'color': color,
      'features': features,
      'description': description,
      'available': available,
    };
  }
}
