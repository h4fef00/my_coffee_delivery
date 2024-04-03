import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profilo"), automaticallyImplyLeading: false),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        // background solo per saluto con nome
        // decoration: const BoxDecoration(
        //   color: Color.fromARGB(255, 221, 165, 144),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ciao nome!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //aggiungere gesture detector per portare alle route
            ListView(
              shrinkWrap: true,
              children: const [
                SizedBox(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          "Le mie informazioni",
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Icon(Icons.manage_accounts),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          "FAQ",
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Icon(Icons.quiz),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          "Elimina account",
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          "Logout",
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Icon(Icons.logout),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
