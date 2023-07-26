import 'package:flutter/material.dart';
import 'package:web_dashboard_flutter/constants/controllers.dart';
import 'package:web_dashboard_flutter/routing/routes.dart';

import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;

    return Container(
      color:light,
      child:ListView(children:[
        if(ResponsiveWidget.isSmallScreen(context))
          Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              SizedBox(height: 40,),
              Row(
                children:[
                  SizedBox(width: _width/48,),
                  Padding(padding:EdgeInsets.only(right:12),
                  child:Image.asset('asssets/logo.png')),
                  Flexible(child: CustomText(
                    text:'Dash',
                    size:20,weight:FontWeight .bold,
                    color:active
                  ),
                  ),
                  SizedBox(width: _width/48,)
                ]
              ),
              SizedBox(height: 40,),
              Divider(color:lightGrey.withOpacity(.1)),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: sideMenuItems.map((itemNamme) => SideMenuItem(
                  itemName: itemName==AuthenticationPageRoute?'Log Out':itemName,
                  onTap:(){
                    if(itemNamme==AuthenticationPageRoute){
                      //TODO:: go to authentication page
                    }
                    if(!menuController.isActive(itemName)){
                      menuController.changeActiveitemTo(itemName);
                      if(ResponsiveWidget.isSmallScreen(context))
                        Get.back();
                      // TODO::go to item name Route
                    }
                  }
                )).toList(),
              )
            ],
          )
        ])
    );
  }
}
