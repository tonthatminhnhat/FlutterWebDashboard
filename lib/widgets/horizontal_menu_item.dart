import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../constants/controllers.dart';
import '../constants/style.dart';
import 'custom_text.dart';

class HorizontalmenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const HorizontalmenuItem({Key? key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap(),
      onHover:(value){
        value?
        menuController.onHover(itemName):
        menuController.onHover('not hovering');
      },
      child: Obx(()=>Container(
        color:menuController.isHovering(itemName)?
            lightGrey.withOpacity(.1):Colors.transparent,
        child:Row(
        children:[
          Visibility(visible: menuController.isHovering(itemName)
              ||menuController.isActive(itemName),
            child: Container(width:6,height: 40,color:dark,),
          maintainSize: true,maintainState: true,maintainAnimation: true,
          ),
          SizedBox(width:_width/80),
          Padding(padding: EdgeInsets.all(16),
          child: menuController.returnIconFor(itemName),),
          if(!menuController.isActive(itemName))
            Flexible(
                child: CustomText(
                    text:itemName,
                color:menuController.isHovering(itemName)?dark:lightGrey))
          else
            Flexible(child: CustomText(
              text: itemName,
              color:dark,
              size:18,
              weight: FontWeight.bold,
            ))
        ]
      ))
      )
    );
  }
}
