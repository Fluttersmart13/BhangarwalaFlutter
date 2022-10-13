import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xFFAD37E0), Color(0xFFD73992)],
    ).createShader(const Rect.fromLTWH(100.0, 100.0, 100.0, 100.0));
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: color2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Expanded(
                    child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/footer.png"),
                                fit: BoxFit.cover)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/circle.png"),
                                        fit: BoxFit.cover)),
                                child: Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                            "assets/icons/location.png")))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "50",
                                  style: TextStyle(
                                      foreground: Paint()
                                        ..shader = linearGradient,
                                      fontFamily: 'RobotoMono',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Cities"),
                              ],
                            ),
                            Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/circle.png"),
                                        fit: BoxFit.cover)),
                                child: Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                            "assets/icons/doctor.png")))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "50",
                                  style: TextStyle(
                                      foreground: Paint()
                                        ..shader = linearGradient,
                                      fontFamily: 'RobotoMono',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("clinics"),
                              ],
                            ),
                          ],
                        )),
                  ),

                  //  Positioned(
                  //   top:MediaQuery.of(context).size.height * 0.035,
                  //   right: MediaQuery.of(context).size.height * 0.060,
                  //   child: SizedBox(
                  //       height: MediaQuery.of(context).size.width * 0.28,
                  //       width: MediaQuery.of(context).size.width * 0.28,
                  //       child: Image(image: AssetImage("assets/images/circle.png"))),
                  // ),

                  //  Positioned(
                  //    top:MediaQuery.of(context).size.height * 0.035,
                  //    left: MediaQuery.of(context).size.height * 0.060,
                  //   child: SizedBox(
                  //       height: MediaQuery.of(context).size.width * 0.28,
                  //       width: MediaQuery.of(context).size.width * 0.28,
                  //       child: Image(image: AssetImage("assets/images/circle.png"))),
                  // ),

                  ///back press
                  Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      height: 30,
                      width: 30,
                      child: Icon(Icons.arrow_back_outlined)),

                  ///setting
                  Positioned(
                    right: 0,
                    child: Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        height: 30,
                        width: 30,
                        child: const Image(
                            image: AssetImage("assets/icons/Settings.png"))),
                  ),
                ],
              ),
              Expanded(
                flex: 5,
                child: ListView(
                  children: [
                    Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/profile_card.png",
                                ),
                                fit: BoxFit.cover)),
                        // color: Colors.green,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 25),
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/Frame125.png",
                                        ),
                                        fit: BoxFit.cover),
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Dr. Johnathan Gray",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Dental Specialist",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF252525)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/wtsp.png"),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/phone.png"),
                                    fit: BoxFit.fill))),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),

                    ///card details
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Image.asset("assets/images/card_details.png"),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Patients name",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'RobotoMono'),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Date & Time",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'RobotoMono'),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Service",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Date & Time",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Address",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Wayne Barnes",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "09 Nov, 11:00 am",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Dental Braces",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Clinic Consultation",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Dental Clinic",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                "12/2, Mathura Road, Sector 37, Faridabad - Delhi",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    ///invoice details
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 700,
                      color: color1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Invoice",
                              style: TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Container(
                                height: 350,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/Rectangle837.png",
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              child: Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width - 10,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Patients name",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Wayne Barnes",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "09 Nov, 11:00 am",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Dental Braces",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Clinic Consultation",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text("Dental Clinic",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text(
                                                  "12/2, Mathura Road, Sector 37, Faridabad - Delhi",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                      FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),

                    Container(color: Colors.white,
                    height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: gredient1,
          items: <Widget>[
            Icon(
              Icons.add,
              size: 20,
              color: color3,
            ),
            Icon(
              Icons.list,
              size: 20,
              color: color3,
            ),
            Icon(
              Icons.compare_arrows,
              size: 20,
              color: color3,
            ),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
