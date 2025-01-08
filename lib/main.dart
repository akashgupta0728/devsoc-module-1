import 'package:flutter/material.dart';
import 'dart:math';
int wblnc= 10;
bool twoalike= false;
bool threealike=false;
bool fouralike=false;
int wage=0;
bool isInputEnabled=true;
String res='';
void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,


        title: Text("Dice Game",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )),
        centerTitle: true,
      ),
      body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/3d-dice-nature_23-2151110332.jpg"),
    fit: BoxFit.cover,
    ),
    ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( padding: EdgeInsets.all(30.0),
                  color: Colors.black87,
                  child: Text(
                  'Dice Game',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),),
                SizedBox(height: 200),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameMode()),
                    );
                  },
                  child: Text('Play Game'),

                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletBalancePage()),
                    );
                  },
                  child: Text('Check Wallet Balance'),
                ),
              ],
            ),
          )


      ),





      );
  }
}
class GameMode extends StatefulWidget {
  const GameMode({super.key});

  @override
  State<GameMode> createState() => _GameMode();
}

class _GameMode extends State<GameMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title:
        Text('Play Game',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Game Modes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0
          )),
            SizedBox(height: 30.0),
            ElevatedButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayGamePage()));
              twoalike=true;
            },
                child: Text("2 Alike",
                style: TextStyle(
                  fontSize: 20.0
                ))),
            SizedBox(height: 10.0,),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayGamePage()));
              threealike=true;},
                child: Text("3 Alike",
                    style: TextStyle(
                        fontSize: 20.0
                    ))),
            SizedBox(height: 10.0,),
            ElevatedButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayGamePage()));
              fouralike=true;
            },
                child: Text("4 Alike",
                    style: TextStyle(
                        fontSize: 20.0
                    )

                ))
          ]

        )
      ),
    );
  }
}
class WalletBalancePage extends StatefulWidget {
  @override
  _WalletBalancePageState createState() => _WalletBalancePageState();
}

class _WalletBalancePageState extends State<WalletBalancePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Wallet Balance',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  '$wblnc ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.monetization_on,
                size: 24,
                color: Colors.amber,)
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  wblnc += 5;
                });
              },
              child: Text('Add Coins'),
            ),

          ],
        ),
      ),
    );
  }
}

class PlayGamePage extends StatefulWidget {
  const PlayGamePage({super.key});

  @override
  _PlayGamePageState createState() => _PlayGamePageState();
}

class _PlayGamePageState extends State<PlayGamePage> {
  final Random _random = Random();
  final TextEditingController _wagerController = TextEditingController();
  List<int> _diceNumbers = [1, 1, 1, 1];
  bool diceRolled = false;
  bool gameResult=false;
  bool isValidWager=false;
  List <int> freqnumbers=[0,0,0,0,0,0];
  double get maxWager {
    if (twoalike) return wblnc / 2;
    if (threealike) return wblnc / 3;
    if (fouralike) return wblnc / 4;
    return wblnc.toDouble();
  }
  void checkList() {
    freqnumbers=[0,0,0,0,0,0];
    for (int i=0;i<4;i++){
      if (_diceNumbers[i]==1){
        freqnumbers[0]+=1;
      }
      if (_diceNumbers[i]==2){
        freqnumbers[1]+=1;
      }
      if (_diceNumbers[i]==3){
        freqnumbers[2]+=1;
      }
      if (_diceNumbers[i]==4){
        freqnumbers[3]+=1;
      }
      if (_diceNumbers[i]==5){
        freqnumbers[4]+=1;
      }
      if (_diceNumbers[i]==6){
        freqnumbers[5]+=1;
      }

    }
  }
  void validateWager() {
    setState(() {
      int? wager = int.tryParse(_wagerController.text);
      if (wager != null && wager > 0 && wager <= maxWager) {
        isValidWager = true;
        wage=wager;
      } else {
        isValidWager = false;
      }
    });
  }
  void updateWallet(){
    if (twoalike){
      if (gameResult){
        wblnc+=2*wage;
      }
      if (!gameResult){
        wblnc-=2*wage;

    }
    }
    if (threealike){
      if (gameResult){
        wblnc+=3*wage;
      }
      if (!gameResult){
        wblnc-=3*wage;

      }
    }
    if (fouralike){
      if (gameResult){
        wblnc+=4*wage;
      }
      if (!gameResult){
        wblnc-=4*wage;

      }
    }}
  void rollDice() {
    FocusScope.of(context).unfocus();
    isInputEnabled=false;
    setState(() {
      _diceNumbers = List.generate(4, (_) => _random.nextInt(6) + 1);
      diceRolled=true;
      _wagerController.clear();
      isValidWager=false;
      checkList();
      if (twoalike && (freqnumbers.contains(2))) {
        gameResult = true;
      }

      if (threealike && (freqnumbers.contains(3))){
        gameResult=true;
      }
      if (fouralike && (freqnumbers.contains(4))){
        gameResult=true;
  }

      if (gameResult==true){
        res='You Win';
      }
      if (gameResult==false){
        res='You Lose';
      }
    });}

  void resetGame(){
    diceRolled=false;
    twoalike=false;
    threealike=false;
    fouralike=false;
    gameResult=false;
    isInputEnabled=true;
    _diceNumbers=[1,1,1,1];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      resetGame();
      Navigator.pop(context);
      return false; // Prevent default back button behavior
    },
    child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Play Game',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wallet balance: $wblnc coins",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 30.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
            child:
            TextField(
              controller: _wagerController,
              enabled: isInputEnabled,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter wager amount (Max: ${maxWager.toInt()}',
                errorText: isValidWager || _wagerController.text.isEmpty ? null
                    : 'Invalid wager. Must be an integer within limited balance.',


              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => validateWager(),
            ),),
            SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _diceNumbers.map((number) => Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/dice$number.jpg'
                    ),
                  ],
                ),
              )).toList(),
            ),
            SizedBox(height: 30),
             if (diceRolled == false)
               ElevatedButton(
              onPressed: isValidWager?rollDice:null,
              child: Text('Roll Dice'),
            ),

            if (diceRolled==true)... [
              ((){updateWallet();
                return Container();})(),
              Text(
                '$res',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

                Text("Your new wallet balance is $wblnc coins",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    resetGame();

                  },
                  child: Text('Proceed'),

                ),


            ],



          ],
        ),
      ),
    ));
  }
}


