import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class SimmerMyData extends StatelessWidget {
  const SimmerMyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (_, i) {
          final delay = (i * 300);
          return Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      width: 150,
                      radius: 4,
                      millisecondsDelay: delay,
                      fadeTheme: FadeTheme.light,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    FadeShimmer(
                      height: 8,
                      millisecondsDelay: delay,
                      width: 170,
                      radius: 4,
                      fadeTheme: FadeTheme.light,
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(
          height: 16,
        ),
      ),
    );
  }
}
