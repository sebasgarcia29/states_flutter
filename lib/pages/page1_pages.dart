import 'package:flutter/material.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: const InformationUser(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/page2'),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class InformationUser extends StatelessWidget {
  const InformationUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('General: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Name: '),
          ),
          ListTile(
            title: Text('Age: '),
          ),
          Text('Professions: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Profesion1: '),
          ),
          ListTile(
            title: Text('Profesion2: '),
          ),
          ListTile(
            title: Text('Profesion3: '),
          ),
        ],
      ),
    );
  }
}
