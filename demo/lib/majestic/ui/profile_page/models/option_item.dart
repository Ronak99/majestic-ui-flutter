import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionItem {
  final IconData icon;
  final String label;
  final VoidCallback onClick;
  final Color color;

  OptionItem({
    required this.icon,
    required this.label,
    required this.onClick,
    required this.color,
  });
}

final List<OptionItem> profileOptions = [
  OptionItem(
    icon: Icons.edit_outlined,
    color: const Color(0xff5ca6d0),
    label: "Edit Profile",
    onClick: () {},
  ),
  OptionItem(
    icon: Icons.shopify_rounded,
    color: const Color(0xff62b667),
    label: "My Orders",
    onClick: () {},
  ),
  OptionItem(
    icon: CupertinoIcons.power,
    color: const Color(0xffa62c3c),
    label: "Logout",
    onClick: () {},
  ),
];
