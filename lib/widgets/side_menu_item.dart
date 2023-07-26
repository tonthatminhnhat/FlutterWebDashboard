import 'package:flutter/material.dart';
import 'package:web_dashboard_flutter/widgets/vertical_menu_item.dart';

import '../helpers/responsiveness.dart';
import 'horizontal_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const SideMenuItem({Key? key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
if(ResponsiveWidget.isCustomScreen(context))
  return VerticalMenuItem(itemName: itemName, onTap: onTap);

  return HorizontalmenuItem(itemName: itemName, onTap: onTap);

  }
}
