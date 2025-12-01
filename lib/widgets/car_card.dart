import 'package:flutter/material.dart';
import '../models/car.dart';
import '../utils/constants.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;

  const CarCard({
    super.key,
    required this.car,
    required this.onTap,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: AppConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Hero(
                    tag: 'car-${car.id}',
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        image: DecorationImage(
                          image: NetworkImage(car.image),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) {},
                        ),
                      ),
                      child: car.image.isEmpty
                          ? const Center(
                              child: Icon(
                                Icons.directions_car,
                                size: 64,
                                color: AppColors.mediumGrey,
                              ),
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 20,
                        ),
                        onPressed: onFavoritePressed,
                      ),
                    ),
                  ),
                  if (!car.available)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Unavailable',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: AppTextStyles.heading3.copyWith(fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 1),
                        Text(
                          '${car.year} • ${car.category}',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.darkGrey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              car.rating.toString(),
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${car.pricePerDay.toStringAsFixed(0)}',
                              style: AppTextStyles.heading3.copyWith(
                                color: AppColors.primary,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '/day',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.darkGrey,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            _buildSpec(Icons.person, '${car.seats}'),
                            const SizedBox(width: 6),
                            _buildSpec(Icons.settings, car.transmission[0]),
                            const SizedBox(width: 6),
                            _buildSpec(Icons.local_gas_station, car.fuelType[0]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpec(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.darkGrey),
        const SizedBox(width: 2),
        Text(
          text,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.darkGrey,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
