import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/icons.dart';

class OptionSelector extends StatelessWidget {
  const OptionSelector({
    Key? key,
    required this.title,
    this.icon,
    this.onTap,
    required this.iconContainerColor,
    this.alternateIcon,
  }) : super(key: key);
  final String title;
  final IconData? icon;
  final Function()? onTap;
  final Color iconContainerColor;
  final Widget? alternateIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: iconContainerColor,
            ),
            child: icon == null
                ? Center(child: alternateIcon!)
                : Center(
                    child: FaIcon(
                      icon,
                      size: 20.5,
                      color: Colors.white,
                    ),
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 17.5),
          ),
          const Spacer(),
          const Icon(
            kFowardIcon,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
