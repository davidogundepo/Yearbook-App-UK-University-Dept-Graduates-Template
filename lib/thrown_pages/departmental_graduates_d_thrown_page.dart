import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_department.dart';
import '../about_menu_details_pages/about_university.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/departmental_graduates_d_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/departmental_graduates_d_details_page.dart';
import '../notifier/departmental_graduates_d_notifier.dart';
import '../thrown_searches/departmental_graduates_d_thrown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


String universityName = "Coventry University";
String departmentName = "Architecture Department";
String thrownName = "Architecture Graduates Class D";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";


String whoWeAre = "Who We Are";
String aboutDepartment = "About $departmentName";
String aboutUniversity = "About $universityName 2021";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/thrown_uni_5.jpg";


Color backgroundColor = Color.fromRGBO(152, 109, 142, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(152, 109, 142, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Color.fromRGBO(152, 109, 142, 1);
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(152, 109, 142, 1);
Color splashColorTwo = Colors.black87;
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(152, 109, 142, 1);
Color borderColor = Colors.black;


class MyDepartmentalGraduatesPageD extends StatefulWidget with NavigationStates {
  @override
  _MyDepartmentalGraduatesPageDState createState() => _MyDepartmentalGraduatesPageDState();
}

class _MyDepartmentalGraduatesPageDState extends State<MyDepartmentalGraduatesPageD> {

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    DepartmentalGraduatesDNotifier departmentalGraduatesDNotifier = Provider.of<DepartmentalGraduatesDNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              departmentalGraduatesDNotifier.currentDepartmentalGraduatesD = departmentalGraduatesDNotifier.departmentalGraduatesDList[index];
              navigateToDepartmentalGraduatesDetailsPageD(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                departmentalGraduatesDNotifier.departmentalGraduatesDList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  departmentalGraduatesDNotifier.departmentalGraduatesDList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              (() {
                                if (departmentalGraduatesDNotifier.departmentalGraduatesDList[index].departmentExecutive == "Yes") {
                                  return
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon (
                                          MdiIcons.checkboxMarkedCircle,
                                          color: iconColor,
                                        ),
                                      ],
                                    );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon (
                                      MdiIcons.checkboxMarkedCircle,
                                      color: iconColor,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),
                        ),
                        (() {
                          if (departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter.toString().isNotEmpty) {
                            if (!departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter.toString().contains("@")) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter == departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter ? '@'+departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter : departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                            else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                          } else {
                            return Visibility(
                              visible: !_isVisible,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    departmentalGraduatesDNotifier.departmentalGraduatesDList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              ),
                            );
                          }
                        }()),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToDepartmentalGraduatesDetailsPageD(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyDepartmentalGraduatesDetailsPageD()));
  }
  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutDepartment(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutDepartment()));
  }
  Future navigateToAboutUniversityState(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUniversityState()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  @override
  void initState() {
    DepartmentalGraduatesDNotifier departmentalGraduatesDNotifier = Provider.of<DepartmentalGraduatesDNotifier>(context, listen: false);
    getDepartmentalGraduatesD(departmentalGraduatesDNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DepartmentalGraduatesDNotifier departmentalGraduatesDNotifier = Provider.of<DepartmentalGraduatesDNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: modalBackgroundColor,
                            context: context,
                            builder: (context) => Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: modalColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColorTwo,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom, color: iconColor),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                          Navigator.of(context).pop(false);
                                          navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: iconColor),
                                        title: new Text(aboutDepartment,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),),
                                        onTap: () {
                                          Navigator.of(context).pop(false);
                                          navigateToAboutDepartment(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessKing, color: iconColor),
                                        title: new Text(aboutUniversity,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),),
                                        onTap: () {
                                          Navigator.of(context).pop(false);
                                          navigateToAboutUniversityState(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: iconColor),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                          Navigator.of(context).pop(false);
                                          navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: iconColor),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                            color: textColor,
                                          ),),
                                        onTap: () {
                                          Navigator.of(context).pop(false);
                                          navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: departmentalGraduatesDNotifier.departmentalGraduatesDList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyDepartmentalGraduatesSearchD(all: departmentalGraduatesDNotifier.departmentalGraduatesDList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Center(
                      heightFactor: 0.6,
                      child: Text(
                          thrownName,
                          style: GoogleFonts.abel(
                              color: textColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    background: Image.asset(imgAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: departmentalGraduatesDNotifier.departmentalGraduatesDList.length
                ),
              ),
            ),
          ),
        ),
      ),
    );


  }
}
