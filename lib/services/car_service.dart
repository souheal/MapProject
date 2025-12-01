import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/car.dart';

class CarService {
  static const String _favoritesKey = 'favorite_cars';
  List<Car>? _cachedCars;

  Future<List<Car>> getAllCars() async {
    if (_cachedCars != null) {
      return _cachedCars!;
    }

    try {
      final String response = await rootBundle.loadString('assets/data/cars.json');
      final List<dynamic> data = json.decode(response);
      _cachedCars = data.map((json) => Car.fromJson(json)).toList();
      return _cachedCars!;
    } catch (e) {
      throw Exception('Failed to load cars: $e');
    }
  }

  Future<Car?> getCarById(String id) async {
    final cars = await getAllCars();
    try {
      return cars.firstWhere((car) => car.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<Car>> searchCars(String query) async {
    final cars = await getAllCars();
    if (query.isEmpty) return cars;

    final lowerQuery = query.toLowerCase();
    return cars.where((car) {
      return car.name.toLowerCase().contains(lowerQuery) ||
             car.brand.toLowerCase().contains(lowerQuery) ||
             car.model.toLowerCase().contains(lowerQuery) ||
             car.category.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  Future<List<Car>> filterCars({
    String? category,
    double? minPrice,
    double? maxPrice,
    String? brand,
  }) async {
    final cars = await getAllCars();

    return cars.where((car) {
      if (category != null && category.isNotEmpty && car.category != category) {
        return false;
      }
      if (minPrice != null && car.pricePerDay < minPrice) {
        return false;
      }
      if (maxPrice != null && car.pricePerDay > maxPrice) {
        return false;
      }
      if (brand != null && brand.isNotEmpty && car.brand != brand) {
        return false;
      }
      return true;
    }).toList();
  }

  Future<List<String>> getCategories() async {
    final cars = await getAllCars();
    final categories = cars.map((car) => car.category).toSet().toList();
    categories.sort();
    return categories;
  }

  Future<List<String>> getBrands() async {
    final cars = await getAllCars();
    final brands = cars.map((car) => car.brand).toSet().toList();
    brands.sort();
    return brands;
  }

  Future<void> toggleFavorite(String carId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    if (favorites.contains(carId)) {
      favorites.remove(carId);
    } else {
      favorites.add(carId);
    }

    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<bool> isFavorite(String carId) async {
    final favorites = await getFavorites();
    return favorites.contains(carId);
  }

  Future<List<Car>> getFavoriteCars() async {
    final favorites = await getFavorites();
    final cars = await getAllCars();
    return cars.where((car) => favorites.contains(car.id)).toList();
  }
}
