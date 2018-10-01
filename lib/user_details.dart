import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String info =
      'As a beginning Android developer, you face a steep learning curve.'
      'Learning Android is like moving to a foreign city. Even if you speak'
      'the language, it will not feel like home at first. Android has a culture'
      'that culture speaks Java, but knowing Java alone is not enough,'
      'without knowing the frameworks.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Color(0xFFFBAB66),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Image.asset(
                  'assets/logo.png',
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFBA767), Color(0xFFF85685)],
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        _leftTextView('12', 'Posts', 1),
                        _leftTextView('23', 'Followers', 2),
                        _leftTextView('56', 'Following', 3),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          _detailView('Scott Colon', 'Photographer', info),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            left: 50.0,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFFB3E7E),
              child: Icon(
                Icons.add,
                size: 50.0,
              ),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }

  _detailView(var name, var pro, var info) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(
              text: name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
            TextSpan(
                text: '\n' + pro,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            TextSpan(
                text: '\n\n' + info,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0)),
          ],
        ),
      ),
    );
  }

  _leftTextView(var number, var text, var id) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(
              text: (id == 1) ? ' ' + number : '   ' + number,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            TextSpan(
                text: '\n' + text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}

