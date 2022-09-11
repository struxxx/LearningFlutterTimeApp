import 'package:flutter/material.dart';
import 'package:learning_flutter_second_project/pages/choose_location.dart';
import 'package:learning_flutter_second_project/pages/loading.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'package:learning_flutter_second_project/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
  /*home: QuoteList(),*/
  /*home: NinjaCard(), ovo je za komentarini dio*/
));


/*class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}*/

/*class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(authorName:'Loša',text:'bolje biti pijan nego star'),
    Quote(authorName: 'Oscar Wilde', text: 'Uci uci... mozes ti to'),
    Quote(authorName: 'Mato Neretljak', text: 'dodaj loptu da puknem u kuruzu'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Text('Awesome quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent[100],
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
                print(quotes.length);
              });
            }
        )).toList(),
      )
    );
  }
}*/



/*Ovo je id card*/
/*class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjaLevel = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ninjaLevel += 1;
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/hero.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.blueGrey[50]
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Chun-Li',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 3.0),
                Text(
                  'chun.li@thentninja.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 1.0,
                )
                )
              ]
            ),
          ]
        ),
      ),
    );
  }
}*/



