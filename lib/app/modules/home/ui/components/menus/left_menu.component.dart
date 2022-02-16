import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/home/ui/models/menu.model.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';

class LeftMenu extends StatefulWidget {
  final List<MenuLeftItem> menus;

  const LeftMenu({Key? key, required this.menus}) : super(key: key);

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {

  int index = 0;
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double maxScreen = 1000;

    if(widthScreen<=768){
      collapseDrawer(false);
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 100,
            offset: const Offset(5, 0), // changes position of shadow
          ),
        ],
      ),
      width: isExpanded?300:78,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.10),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !isExpanded?Container():
                    Image.asset("assets/images/logo_h.png",
                      width: 120,
                    ),
                    widthScreen<=790?SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/images/logo.png")):SizedBox(
                      height: 40,
                      width: 40,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            side: MaterialStateProperty.all(BorderSide(color: Colors.grey.withOpacity(0.05)))
                        ),
                        onPressed: () => collapseDrawer(!isExpanded),
                        child: SvgPicture.asset(widthScreen<=768?"assets/images/logo.png":"assets/images/menu/drawer.svg",
                          color: primaryColor,
                          width: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.menus.map((item) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.only(left: 20)),
                            alignment: Alignment.centerLeft,
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                          ),
                          onPressed: ()=>animationToPage(widget.menus.indexOf(item)),
                          label: !isExpanded?Container():Text(item.label, style: GoogleFonts.cairo(textStyle: TextStyle(color: getTextColor(item), fontWeight: FontWeight.w600, fontSize: 14)) ,),
                          icon: Badge(
                            position: BadgePosition.topEnd(),
                            showBadge: item.badgeNum!=0,
                            badgeColor: Colors.lightBlue,
                            padding: const EdgeInsets.all(3),
                            badgeContent: Text(item.badgeNum.toString(), style: GoogleFonts.cairo(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10))),
                            child: SvgPicture.asset(
                                item.assetIcon,
                                width: 20,
                                color: getSvgColor(item),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: index==widget.menus.indexOf(item)?primaryColor:Colors.white,
                        borderRadius: BorderRadius.circular(100)
                      ),
                    )
                  ],
                )).toList(),
              ),
            ),
            const SizedBox(height: 50,),
            !isExpanded?Container():Column(
              children: [
                Center(
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        alignment: Alignment.bottomRight,
                        image: AssetImage("assets/images/others/background.png")
                      ),
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/images/others/drag.svg',),
                        const SizedBox(height: 10,),
                        Text("Conheça o Analytics", style: GoogleFonts.cairo(fontWeight: FontWeight.bold,
                          textStyle: const TextStyle(fontSize: 25, color: Colors.white)
                        ),),
                        const SizedBox(height: 10,),
                        const Icon(LineAwesomeIcons.arrow_right, color: Colors.white,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Value Care - Pós-Covid Dashboard", style: GoogleFonts.cairo(color: Colors.grey, fontSize: 12), textAlign: TextAlign.center,)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setIndex(int index)=> setState(() => this.index=index);
  void collapseDrawer(bool value)=> setState(() => isExpanded=value);

  Color? getSvgColor(MenuLeftItem item)=>index==widget.menus.indexOf(item)?primaryColor:greyColor;
  Color? getTextColor(MenuLeftItem item)=>index==widget.menus.indexOf(item)?primaryColor:greyColor;

  void animationToPage(int page){
    if(page==0){
      Modular.to.navigate(DASHBOARD_ROUTE);
    }else if(page==1){
      Modular.to.navigate(MONITORING_ROUTE);
    }else if(page==2){
      Modular.to.navigate(SCHEDULING_ROUTE);
    }else if(page==6){
      Modular.to.navigate(USERS_ROUTE);
    }
    setIndex(page);
  }
}
