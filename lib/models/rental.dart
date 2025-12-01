class Rental {
  final String id;
  final String userId;
  final String userName;
  final String userEmail;
  final String carId;
  final String carName;
  final String startDate;
  final String endDate;
  final int days;
  final double pricePerDay;
  final double totalPrice;
  final String status;
  final String bookingDate;

  Rental({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.carId,
    required this.carName,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.pricePerDay,
    required this.totalPrice,
    required this.status,
    required this.bookingDate,
  });

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      carId: json['carId'] as String,
      carName: json['carName'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      days: json['days'] as int,
      pricePerDay: (json['pricePerDay'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'] as String,
      bookingDate: json['bookingDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'carId': carId,
      'carName': carName,
      'startDate': startDate,
      'endDate': endDate,
      'days': days,
      'pricePerDay': pricePerDay,
      'totalPrice': totalPrice,
      'status': status,
      'bookingDate': bookingDate,
    };
  }
}
