import 'package:covidapp/screens/android/login.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Login()
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right:25, left:25),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _topMessage(),
            _centerImage(),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _ElementItem('Pacientes', Icons.accessibility_new, onClick: () {
                    debugPrint('Pacientes');
                  }),
                  _ElementItem('Resultados', Icons.check, onClick: () {
                    debugPrint('Resultados');
                  }),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _centerImage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset('images/ban.jpg'),
    );
  }

  Widget _topMessage() {
    return Container(
      // color: Colors.blue,
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Checklist Covid-19',
          style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
        )
    );
  }
}

class _ElementItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function onClick;

  _ElementItem(this.title, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10.0,
        child: InkWell(
          onTap: this.onClick,
          child: Container(
            padding: EdgeInsets.all(16.0),
            // color: Colors.green,
            width: 150,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  this.icon,
                  color: Colors.white,
                ),
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

