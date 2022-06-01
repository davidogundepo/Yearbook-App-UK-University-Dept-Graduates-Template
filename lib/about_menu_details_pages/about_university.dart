import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../notifier/university_achievement_images_notifier.dart';
import '../api/university_achievement_images_api.dart';
import '../api/university_arial_images_api.dart';
import '../notifier/university_arial_images_notifier.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

String universityName = "Coventry University";
String aboutUniversity = "About $universityName";

String visionSwipe = "Swipe left on 'OUR VISION STATEMENT'  >>>";
String visionTitle = "OUR VISION STATEMENT";
String visionStatement = "A global Education Group with a reputation for equity and innovation that empowers students and communities to transform their lives and society through teaching, learning, research and enterprise.";
String missionTitle = "OUR MISSION STATEMENT";
String missionStatement = "Creating Better Futures embodies our purpose, defining the diverse nature of Coventry University Group, from delivering inclusive and impactful global education for our learners, to addressing societal challenges through our research and innovation.";
String strategyTitle = "OUR 2030 GROUP STRATEGY STATEMENT";
String strategyStatement = "Our Strategy is about who we are, why we’re here and how we want to create better futures for our students, colleagues, partners and stakeholders. Driven by our mission vision and values, we will deliver against our four strategy themes – Education and Student Experience; Research and Impact; Enterprise and Innovation; and Global University.";
String civicRoleTitle = "OUR 2030 GROUP STRATEGY STATEMENT";
String civicRoleStatement = "OUR 2030 GROUP STRATEGY STATEMENT";

String coreValues = "OUR CORE VALUES";
String cvStatement1 = "1. Collaboration\n\n";
String cvStatement2 = "2. Determination\n\n";
String cvStatement3 = "3. Diversity and inclusion\n\n";
String cvStatement4 = "4. Innovation\n\n";
String cvStatement5 = "5. Integrity\n\n";


String whyUniversity = "WHY $universityName?".toUpperCase();
String whyUniversityStatement = "$universityName scheme was created in a bid to reconstruct, reconcile and rebuild the country after the British Civil war.";
String staffBody = "$universityName Staff Body all over Nigeria\n\n";
String staffBodyStatement = "We have 454 Academic Staff in $universityName.";
String populationChart = "$universityName 2020/2021 Population Chart";
String studentBody = "Students of $universityName\n\n";
String studentBodyStatement = "We currently have 6,263 students in $universityName.\n36,541 male students and 21,523 female students have graduated from $universityName, since the inception, 12th July 1993.";
String studentPopulationChart = "$universityName 2020/2021 Student Population Chart since Inception";

String universityDepartments = "Some Departments $universityName have running B.Sc, M.Sc. and Ph.D programs provided to it's Student Body\n\n";
String someDepartments1 = "1. Civil Engineering\n";
String someDepartments2 = "2. Forestry\n";
String someDepartments3 = "3. Medicine\n";
String someDepartments4 = "4. Accounting\n";
String someDepartments5 = "5. Mathematics & Statistics\n";
String someDepartments6 = "6. Business Administration\n";
String someDepartments7 = "7. Architecture\n";
String someDepartments8 = "8. Political Science\n";
String someDepartments9 = "9. Law\n";


String universityArialViewsSwipe = "Swipe left or right for more photos";
String universityArialViews = "Some Arial views of $universityName activities";
String universityAchievementsSwipe = "Swipe left or right for more photos";
String universityAchievements = "Some past $universityName achievements during their service year";
String moreInfoAboutUniversity = "For more information about $universityName please trust and click me";
String moreInfoAboutUniversityURL = "https://www.coventry.ac.uk/";

double currentMaleStudentPopulation = 2510;
double currentFemaleStudentPopulation = 3753;
double currentStaffPopulation = 454;

double currentAndPastMaleStudentPopulation = 36541;
double currentAndPastFemaleStudentPopulation = 21523;


Color backgroundColor = Color.fromRGBO(198, 99, 99, 1.0);
Color appBarBackgroundColor = Color.fromRGBO(198, 99, 99, 1.0);
Color appBarIconColor = Colors.white;
Color appBarBackgroundTextColor = Colors.white;
Color cardBackgroundColor = Color.fromRGBO(171, 80, 80, 1.0);
Color textColor = Colors.white;
Color cardTextColor = Colors.white;
Color materialColor = Color.fromRGBO(148, 61, 61, 1.0).withAlpha(50);
Color materialInkWellColor = Colors.white.withAlpha(80);
Color materialTextColor = Colors.white;
Color containerColor = Color.fromRGBO(148, 61, 61, 1.0).withAlpha(50);
Color containerTextColor = Colors.white;
Color containerColor2 = Color.fromRGBO(148, 61, 61, 1.0);
Color chartBackgroundColor = Colors.white;
Color chartTextColor = Color.fromRGBO(148, 61, 61, 1.0);
Color chartTextColorTwo = Color.fromRGBO(198, 99, 99, 1.0);
Color firstCurrentUniversityChartColor = Color.fromRGBO(198, 99, 99, 1.0);
Color secondCurrentUniversityChartColor = Color.fromRGBO(148, 61, 61, 1.0);
Color thirdCurrentUniversityChartColor = Colors.white.withAlpha(80);
Color firstCurrentAndPastUniversityStudentsChartColor = Color.fromRGBO(198, 99, 99, 1.0);
Color secondCurrentAndPastUniversityStudentsChartColor = Color.fromRGBO(148, 61, 61, 1.0);

class AboutUniversityState extends StatefulWidget {

  @override
  _AboutUniversityState createState() => _AboutUniversityState();
}

class _AboutUniversityState extends State<AboutUniversityState> {

  final controlla = PageController(
    initialPage: 0,
  );

  var scrollDirection = Axis.horizontal;

  @override
  void initState() {
    UniversityArialNotifier universityArialNotifier = Provider.of<UniversityArialNotifier>(context, listen: false);
    getUniversityArial(universityArialNotifier);

    UniversityAchievementsNotifier universityAchievementsNotifier = Provider.of<UniversityAchievementsNotifier>(context, listen: false);
    getUniversityAchievements(universityAchievementsNotifier);

    universityMap.putIfAbsent("Current Male Students", () => 25410);
    universityMap.putIfAbsent("Current Female Students", () => 3753);
    universityMap.putIfAbsent("Current University Staff", () => 454);

    universityStudentMap.putIfAbsent("Current Male Students & Past Graduates", () => 36541);
    universityStudentMap.putIfAbsent("Current Female Students & Past Graduates", () => 21523);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UniversityArialNotifier universityArialNotifier = Provider.of<UniversityArialNotifier>(context);
    UniversityAchievementsNotifier universityAchievementsNotifier = Provider.of<UniversityAchievementsNotifier>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(aboutUniversity,
        style: TextStyle(
          color: appBarBackgroundTextColor
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(visionSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: containerTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    visionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                visionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    missionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                missionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    coreValues,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: cvStatement1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement2,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement3,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement4,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement5,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    whyUniversity,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                whyUniversityStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: staffBody,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: staffBodyStatement,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 380,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10, right: 10),
                            child: Text(populationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: containerTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: universityMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 22,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: universityColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: chartTextColor,
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: containerTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: studentBody,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: studentBodyStatement,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text:TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: studentPopulationChart,
                                      style: TextStyle(
                                        color: containerTextColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PieChart(
                            dataMap: universityStudentMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 12,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: universityStudentColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: chartTextColorTwo,
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: universityDepartments,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments1,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments2,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments3,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments4,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments5,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments6,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments7,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments8,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments9,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(universityArialViews,
                style: TextStyle(
                    fontSize: 20,
                    color: containerTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(universityArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: containerTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: universityArialNotifier.universityArialList.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                universityArialNotifier.universityArialList[index].image
                            ),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: containerColor2
                      ),
                      child: ListTile(
                        title: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              universityArialNotifier.universityArialList[index].toastName,
                              style: TextStyle(
                                color: textColor.withAlpha(190),
                                fontWeight: FontWeight.w800,
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: Text(universityAchievements,
                style: TextStyle(
                    fontSize: 20,
                    color: containerTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(universityAchievementsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: containerTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: universityAchievementsNotifier.universityAchievementsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  universityAchievementsNotifier.universityAchievementsList[index].image
                              ),
                              fit: BoxFit.cover,
                              alignment: Alignment(0, -0.5)
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            color: containerColor2
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                universityAchievementsNotifier.universityAchievementsList[index].toastName,
                                style: TextStyle(
                                  color: textColor.withAlpha(190),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemWidth: 350,
                layout: SwiperLayout.STACK,
              ),

            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30, right: 20),
                child: RichText(
                  text: TextSpan(
                      text: moreInfoAboutUniversity,
                      style: TextStyle(
                        fontSize: 17,
                        color: containerTextColor,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        launch(moreInfoAboutUniversityURL);
                      }
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}


class CurrentAndPastUniversityStudentsPopulation{
  String x;
  double y;
  CurrentAndPastUniversityStudentsPopulation(this.x,this.y);
}

dynamic getCurrentAndPastUniversityStudentsPopulationData(){
  List<CurrentAndPastUniversityStudentsPopulation> currentAndPastUniversityStudentsPopulationData = <CurrentAndPastUniversityStudentsPopulation>[
    CurrentAndPastUniversityStudentsPopulation('Current Male Students & Past Graduates', currentAndPastMaleStudentPopulation),
    CurrentAndPastUniversityStudentsPopulation('Current Female Students & Past Graduates', currentAndPastFemaleStudentPopulation),
  ];
  return currentAndPastUniversityStudentsPopulationData;
}

class CurrentUniversityPopulation{
  String x;
  double y;
  CurrentUniversityPopulation(this.x,this.y);
}

dynamic getCurrentUniversityPopulationData(){
  List<CurrentUniversityPopulation> currentUniversityPopulationData = <CurrentUniversityPopulation>[
    CurrentUniversityPopulation('Current Male Students', currentMaleStudentPopulation),
    CurrentUniversityPopulation('Current Female Students', currentFemaleStudentPopulation),
    CurrentUniversityPopulation('Current University Staff', currentStaffPopulation),
  ];
  return currentUniversityPopulationData;
}


bool toggle = false;
Map<String, double> universityMap = Map();

Map<String, double> universityStudentMap = Map();

List<Color> universityColorList = [
  firstCurrentUniversityChartColor,
  secondCurrentUniversityChartColor,
  thirdCurrentUniversityChartColor,
];

List<Color> universityStudentColorList = [
  firstCurrentAndPastUniversityStudentsChartColor,
  secondCurrentAndPastUniversityStudentsChartColor.withAlpha(160),
];