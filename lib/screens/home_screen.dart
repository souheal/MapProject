import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../services/car_service.dart';
import '../widgets/car_card.dart';
import '../utils/constants.dart';
import 'car_details_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _carService = CarService();
  final _authService = AuthService();
  final _searchController = TextEditingController();

  List<Car> _allCars = [];
  List<Car> _filteredCars = [];
  List<String> _categories = [];
  Set<String> _favorites = {};
  User? _currentUser;

  String? _selectedCategory;
  String? _selectedBrand;
  bool _isLoading = true;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    try {
      final cars = await _carService.getAllCars();
      final categories = await _carService.getCategories();
      final favoriteIds = await _carService.getFavorites();
      final user = await _authService.getCurrentUser();

      setState(() {
        _allCars = cars;
        _filteredCars = cars;
        _categories = categories;
        _favorites = favoriteIds.toSet();
        _currentUser = user;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading cars: $e')),
        );
      }
    }
  }

  void _applyFilters() {
    setState(() {
      _filteredCars = _allCars.where((car) {
        bool matchesSearch = true;
        bool matchesCategory = true;
        bool matchesBrand = true;

        if (_searchController.text.isNotEmpty) {
          final query = _searchController.text.toLowerCase();
          matchesSearch = car.name.toLowerCase().contains(query) ||
              car.brand.toLowerCase().contains(query) ||
              car.model.toLowerCase().contains(query);
        }

        if (_selectedCategory != null && _selectedCategory != 'All') {
          matchesCategory = car.category == _selectedCategory;
        }

        if (_selectedBrand != null && _selectedBrand != 'All') {
          matchesBrand = car.brand == _selectedBrand;
        }

        return matchesSearch && matchesCategory && matchesBrand;
      }).toList();
    });
  }

  Future<void> _toggleFavorite(String carId) async {
    await _carService.toggleFavorite(carId);
    final favoriteIds = await _carService.getFavorites();
    setState(() {
      _favorites = favoriteIds.toSet();
    });
  }

  Future<void> _handleLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      await _authService.logout();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Car Rental'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() => _isDarkMode = !_isDarkMode);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildSearchAndFilters(),
                Expanded(
                  child: _filteredCars.isEmpty
                      ? _buildEmptyState()
                      : _buildCarGrid(),
                ),
              ],
            ),
    );
  }

  Widget _buildSearchAndFilters() {
    return Container(
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (_currentUser != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      _currentUser!.name[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, ${_currentUser!.name.split(' ')[0]}!',
                        style: AppTextStyles.subtitle,
                      ),
                      Text(
                        _currentUser!.email,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search cars...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _applyFilters();
                      },
                    )
                  : null,
              filled: true,
              fillColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lightGrey
                  : Theme.of(context).inputDecorationTheme.fillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) => _applyFilters(),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(
                  label: 'All Categories',
                  isSelected: _selectedCategory == null || _selectedCategory == 'All',
                  onTap: () {
                    setState(() => _selectedCategory = null);
                    _applyFilters();
                  },
                ),
                const SizedBox(width: 8),
                ..._categories.map((category) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _buildFilterChip(
                        label: category,
                        isSelected: _selectedCategory == category,
                        onTap: () {
                          setState(() => _selectedCategory = category);
                          _applyFilters();
                        },
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.lightGrey
          : null,
      selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
      checkmarkColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(
        color: isSelected ? Theme.of(context).primaryColor : null,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  Widget _buildCarGrid() {
    return GridView.builder(
      padding: AppConstants.defaultPadding,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _filteredCars.length,
      itemBuilder: (context, index) {
        final car = _filteredCars[index];
        return CarCard(
          car: car,
          isFavorite: _favorites.contains(car.id),
          onFavoritePressed: () => _toggleFavorite(car.id),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarDetailsScreen(car: car),
              ),
            ).then((_) => _loadData());
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off,
            size: 64,
            color: AppColors.mediumGrey,
          ),
          const SizedBox(height: 16),
          Text(
            'No cars found',
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filters',
            style: AppTextStyles.body.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
