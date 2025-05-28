import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import '../constant/app_size.dart';
import '../constant/app_text_styles.dart';
import '../model/mentor_model.dart';

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {

    

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8,bottom: 4), 
      child: Card(
        
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding), // Replacing spacingM
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: AppSizes.avatarRadius,
                backgroundImage: AssetImage('assets/avtar.jpg'),
              ),
              const SizedBox(width: 10), // spacingM equivalent
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ⭐ Rating and Sector
                    Row(
                      children: [
                        const Icon(Icons.star_border, color: AppColors.ratingGreen, size: 16),
                        const SizedBox(width: 4),
                        Text('${mentor.rating}', style: const TextStyle(fontWeight: FontWeight.bold,color: AppColors.ratingGreen)),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.chipYellow, width: 2),
                          ),
                          child: Text(
                            mentor.sector,
                            style: AppTextStyles.chip,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
      
                    // 👤 Name
                    Text(
                      mentor.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
      
                    const SizedBox(height: 6),
      
                    // ⏳ Experience + 🏫 Domain
                    Row(
                      children: [
                        const Icon(Icons.alarm_sharp, size: 14,color: AppColors.textPrimary,),
                        const SizedBox(width: 4),
                        Text('${mentor.experienceYears} years'),
                        const SizedBox(width: 8),
                        const Icon(Icons.school, size: 14,color: AppColors.textPrimary,),
                        const SizedBox(width: 2),
                        Flexible(
                          child: Text(
                            mentor.domain,
                            style: const TextStyle(fontSize: 12,
                            color: AppColors.textPrimary),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
      
                  
                    Row(
                      children: [
                        const Icon(Icons.message_outlined, size: 14,color: AppColors.textPrimary,),
                        const SizedBox(width: 4),
                        Text(
                          '${mentor.reviews} Reviews',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
      
                    const SizedBox(height: 6),
      
                    // 📝 Description
                    Text(
                      mentor.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
      
                    const SizedBox(height: 8),
      
                    // ✅ Compatibility
                    Text(
                      "${mentor.compatibility}% compatibility",
                      style: AppTextStyles.compatibility.copyWith(
                        color: mentor.compatibility > 90
                            ? AppColors.compatibilityHigh
                            : mentor.compatibility > 80
                                ? AppColors.compatibilityMedium
                                : AppColors.compatibilityLow,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
