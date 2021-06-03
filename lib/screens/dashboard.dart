import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dashboard extends StatefulWidget {

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildButton(),
                    BuildNotification()
                  ],
                ),
              ),
              BuildVitualCard(),
              SizedBox(height: 30,),
              GridViewItems()
            ],
          ),
        ),
      ),
    );
  }
}

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        childAspectRatio: 1.4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          TabGridButtons(
            icon: (FaIcon(FontAwesomeIcons.solidPaperPlane)),
            ontap: (){
              showModalBottomSheet(
                context: context,
                builder: (context)=> ButtomSheet(key: key,),
              );
            },
            title: 'Send Money',
          ),
          TabGridButtons(
            icon: RotatedBox( quarterTurns: 2, child: (FaIcon(FontAwesomeIcons.solidPaperPlane))),
            ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
            },
            title: 'Receive Money',
          ),
          TabGridButtons(
            icon: (FaIcon(FontAwesomeIcons.piggyBank)),
            ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
            },
            title: 'Savings',
          ),
          TabGridButtons(
            icon: (FaIcon(FontAwesomeIcons.receipt)),
            ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
            },
            title: 'Pill Bills',
          ),
        ],
      ),
    );
  }
}

class ButtomSheet extends StatelessWidget {
  const ButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            BottomSheetTitle(),
            Text('You can send money here in any currency\n USD,Euro, Pounds and many more.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffCBCBCB),
                letterSpacing: 1.0
              ),
            ),
            SizedBox(height: 12),
            BottomSheetCard(
              title: 'Send money to US Dollar Account',
              text: "USD",
              icon: FaIcon(FontAwesomeIcons.solidPaperPlane),
            ),
            SizedBox(height: 7,),
            BottomSheetCard(
              title: 'Send money to Pound Account',
              text: "GBP",
              icon: FaIcon(FontAwesomeIcons.solidPaperPlane),
            ),
            SizedBox(height: 7,),
            BottomSheetCard(
              title: 'Send money to Euros Account',
              text: "EUR",
              icon: FaIcon(FontAwesomeIcons.solidPaperPlane),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetCard extends StatelessWidget {
  final String title, text;
  final Widget icon;

  const BottomSheetCard({Key? key, required this.title, required this.text,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffDFCAC8),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, //todo: title here
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xffBF372A),
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  text,  //todo: put text here
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xffBF372A),
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
            child: Container(
              height: 50,
              width: 55,
              decoration: BoxDecoration(
                color: Color(0xffD9B0AB),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(
                child: IconButton(
                  icon: icon, //todo: here put icon
                  color: Color(0xffbf372a),
                  onPressed: (){},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:15.0, bottom: 8.0),
          child: Text(
            'Send Money',
            style: TextStyle(
              color: Color(0xffbf372a),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          icon: (FaIcon(FontAwesomeIcons.solidPaperPlane)),
          color: Color(0xffbf372a),
          onPressed: (){},
        )
      ],
    );
  }
}

class TabGridButtons extends StatelessWidget {
  final Widget icon;
  final Function ontap;
  final String title;

  const TabGridButtons({Key? key, required this.icon,required this.ontap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffDFCAC8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
              child: Container(
                height: 50,
                width: 55,
                decoration: BoxDecoration(
                  color: Color(0xffD9B0AB),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: IconButton(
                    icon: icon,
                    color: Color(0xffbf372a),
                    onPressed: (){},
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xffbf372a),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildVitualCard extends StatelessWidget {
  const BuildVitualCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height/3.7,
      width: 330,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        children: [
          Positioned(
            left: 225,
            top: 115,
            child: Container(
              height: 160,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xffD9AF8B),
              ),
            ),
          ),
          Positioned(
            left: 260,
            top: 130,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Color(0xff234A42)
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 30,
            child: Text(
              'Jones Gabriel',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 30,
            child: Text(
              'Total Value (NGN)',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          Positioned(
            top: 105,
            left: 30,
            child: Text(
              '128,000',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Positioned(
            top: 165,
            left: 30,
            child: Text(
              'Account: 21338823293',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildNotification extends StatelessWidget {
  const BuildNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 55,
          decoration: BoxDecoration(
            color: Color(0xffDFCAC8),
            borderRadius: BorderRadius.circular(15)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 12),
          child: Icon(Icons.notifications_none, size: 35,color: Color(0xffbf372a)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Color(0xffbf372a),
              border: Border.all(color: Color(0xffDFCAC8), width: 2),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text('4', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
          ),
        ),
      ]
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){}, //todo: Put in here action to add new card...
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:16.0),
          child: Center(
            child: Row(
              children: [
                Text('Add Money ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.add,size: 20, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


