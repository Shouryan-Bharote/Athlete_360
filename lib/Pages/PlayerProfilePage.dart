import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:hugeicons/hugeicons.dart';

class PlayerProfilePage extends StatefulWidget {
  const PlayerProfilePage({super.key});

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class _PlayerProfilePageState extends State<PlayerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Color.fromRGBO(255, 49, 49, 1),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
        ),
        title: Text(
          'Player Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Card
              Stack(
                children: [
                  // PlayerBanner
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                    child: Image.asset(
                      'assets/PlayerProfile/dog-5040008.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // PlayerProfile and name
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(top: 105),
                    child: Column(
                      children: [
                        // PlayerProfile Img
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/57899051?v=4',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        // Player Name
                        Text(
                          'Player Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Info Card
              Stack(
                children: [
                  Column(
                    children: [
                      // Rating info
                      Container(
                        height: 105,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(74, 74, 74, 0.47),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      // Stats info
                      Container(
                        height: 203,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(74, 74, 74, 0.47),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill, style: TextStyle(color: Colors.white)),
      backgroundColor: Color.fromRGBO(255, 49, 49, 1),
    );
  }
}
