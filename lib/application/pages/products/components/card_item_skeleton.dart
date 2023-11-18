import 'package:flutter/material.dart';

import '../../../components/atom/skeleton_base.dart';

class CardItemSkeleton extends StatelessWidget {
  const CardItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SkeletonBase(
                radius: BorderRadius.circular(8), height: 16, width: 50),
            const SizedBox(height: 10),
            SkeletonBase(
                radius: BorderRadius.circular(8), height: 16, width: 10),
            const SizedBox(height: 10),
            SkeletonBase(
              radius: BorderRadius.circular(8),
              height: 16,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
