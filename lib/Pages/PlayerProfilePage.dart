import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:hugeicons/hugeicons.dart';

class PlayerProfilePage extends StatefulWidget {
  const PlayerProfilePage({super.key});

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class _PlayerProfilePageState extends State<PlayerProfilePage> {
  final List<String> sports = ['Football', 'Cricket', 'Tennis','Basketball','Swimming','Badminton','Hockey','Baseball','Golf','Rugby'];
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
                  // Who's Profile
                  Container(
                    margin: EdgeInsets.fromLTRB(125, 100, 50, 0),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Text(
                      'Myself',
                      style: TextStyle(
                        color: Color.fromRGBO(9, 9, 9, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Sports Skills
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  'Sports',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      sports.map((sport) => _buildSkillChip(sport)).toList(),
                ),
              ),
              // Posts 
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  'Posts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(skill, style: TextStyle(color: Colors.black87)),
        backgroundColor: Color.fromRGBO(255, 49, 49, 1),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}
