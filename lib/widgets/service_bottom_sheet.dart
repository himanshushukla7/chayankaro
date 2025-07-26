import 'package:flutter/material.dart';

class ServiceBottomSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> images;

  const ServiceBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 448,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xE5E47830), // Figma orange stroke
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Subtitle
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFProSemibold',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: 'SFProRegular',
              ),
            ),
            const SizedBox(height: 12),

            // Services Grid (scrollable inside fixed height)
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            images[index],
                            height: 90,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),

                        const Text(
                          'Service Title',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SFProSemibold',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        Row(
                          children: const [
                            Icon(Icons.star, color: Color(0xFFFFC107), size: 14),
                            SizedBox(width: 4),
                            Text(
                              '4.8 (23k)',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFProRegular',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        Row(
                          children: const [
                            Text(
                              '₹499',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFA9441),
                                fontFamily: 'SFProBold',
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              '₹599',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontFamily: 'SFProRegular',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
