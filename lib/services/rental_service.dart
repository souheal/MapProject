import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../models/rental.dart';
import '../models/user.dart';
import '../models/car.dart';

class RentalService {
  List<Rental> _rentals = [];
  bool _isLoaded = false;

  Future<void> _loadRentals() async {
    if (_isLoaded) return;

    try {
      final String response = await rootBundle.loadString('assets/data/rentals.json');
      final List<dynamic> data = json.decode(response);
      _rentals = data.map((json) => Rental.fromJson(json)).toList();
      _isLoaded = true;
    } catch (e) {
      throw Exception('Failed to load rentals: $e');
    }
  }

  Future<List<Rental>> getAllRentals() async {
    await _loadRentals();
    return _rentals;
  }

  Future<List<Rental>> getUserRentals(String userId) async {
    await _loadRentals();
    return _rentals.where((rental) => rental.userId == userId).toList();
  }

  Future<Rental> createRental({
    required User user,
    required Car car,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    await _loadRentals();

    final days = endDate.difference(startDate).inDays;
    final totalPrice = days * car.pricePerDay;

    final rental = Rental(
      id: (_rentals.length + 1).toString(),
      userId: user.id,
      userName: user.name,
      userEmail: user.email,
      carId: car.id,
      carName: car.name,
      startDate: DateFormat('yyyy-MM-dd').format(startDate),
      endDate: DateFormat('yyyy-MM-dd').format(endDate),
      days: days,
      pricePerDay: car.pricePerDay,
      totalPrice: totalPrice,
      status: 'confirmed',
      bookingDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );

    _rentals.add(rental);
    return rental;
  }

  Future<bool> isCarAvailable(String carId, DateTime startDate, DateTime endDate) async {
    await _loadRentals();

    final carRentals = _rentals.where((rental) =>
      rental.carId == carId &&
      (rental.status == 'active' || rental.status == 'confirmed')
    ).toList();

    for (var rental in carRentals) {
      final rentalStart = DateTime.parse(rental.startDate);
      final rentalEnd = DateTime.parse(rental.endDate);

      if ((startDate.isBefore(rentalEnd) && endDate.isAfter(rentalStart)) ||
          startDate.isAtSameMomentAs(rentalStart) ||
          endDate.isAtSameMomentAs(rentalEnd)) {
        return false;
      }
    }

    return true;
  }

  int calculateDays(DateTime startDate, DateTime endDate) {
    return endDate.difference(startDate).inDays;
  }

  double calculateTotalPrice(int days, double pricePerDay) {
    return days * pricePerDay;
  }
}
