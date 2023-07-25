import 'package:flutter/material.dart';
import 'package:web_dashboard_flutter/widgets/large_screen.dart';
import 'package:web_dashboard_flutter/widgets/small_screen.dart';
import 'package:web_dashboard_flutter/widgets/top_nav.dart';
import 'helpers/responsiveness.dart';

class SiteLayout extends StatelessWidget {
final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
      appBar:  topNavigationBar(context, scaffoldKey),
      drawer: Drawer(),
      body: ResponsiveWidget(largeScreen: LargeScreen(),smallScreen: SmallScreen(), mediumScreen: null,),

    );
  }
}
