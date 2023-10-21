import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.close),
          iconSize: 26,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.download_outlined,
          ),
          iconSize: 26,
        ),
      ],
    );
  }
}
