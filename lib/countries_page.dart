import 'package:covid19tracker/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class CountriesPage extends StatefulWidget {
  final Map<String, dynamic> countryData;
  CountriesPage({Key key, @required this.countryData}) : super(key: key);
  @override
  _CountriesPageState createState() => _CountriesPageState();
}
class _CountriesPageState extends State<CountriesPage> {
  List arr;
  var selected;
//  void printval(dynamic value) => print("--> ${value}");
  List<CovidInfoInterfaceForCountries> conArr = [];

  int countryIndex;

  int indexValue = 101;

  void changeToModel() {
    List<dynamic> countries = widget.countryData["Countries"];
    int size = widget.countryData["Countries"].length;
//    print('dbg--');
//    print(size);
  for (int i = 0; i < size; i++) {
    CovidInfoInterfaceForCountries covNations = new CovidInfoInterfaceForCountries(countries[i]["Country"],countries[i]["TotalConfirmed"],countries[i]["TotalDeaths"],countries[i]["TotalRecovered"],countries[i]["NewDeaths"],countries[i]["NewRecovered"],countries[i]["NewConfirmed"], i, countries[i]["CountryCode"] );
    conArr.add(covNations);
  }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//     arr = widget.countryData["Countries"].toList();
//    print(arr);
      changeToModel();
//      print(conArr);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Text('Countries', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.pinkAccent,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.0,),
                Text("Choose country", style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 30.0
                ),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton<String>(
                    icon: Icon(Icons.flag, color: Colors.blue,),
                    iconSize: 20,
                    items: conArr.map((CovidInfoInterfaceForCountries countryArray) {
                      return DropdownMenuItem<String>(

                        value: countryArray.indexVal.toString(),
                        child: Center(child: Text(countryArray.country, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900]),)),
                      );
                    }).toList(),
                    onChanged: (String val) {
               setState(() {
                   this.selected = val;
                   this.indexValue = int.parse(selected);
               });
        },
                  value: this.selected,
                    hint: Center(child: Text('India', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900]),)),
              ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(conArr[this.indexValue].country, style: TextStyle(color: Colors.blue[900], fontSize: 30)),
                      Flags.getFlag(country: conArr[this.indexValue].countryCode, height: 100, width: 500),
                      SizedBox(height: 20.0,),
                      Ink(
                        color: Colors.blue[200],
                        child:
                        ListTile(
                          title: Center(child: Text('Total Confirmed Cases', style: TextStyle(color: Colors.blue[900], fontSize: 30),)),
                          subtitle: Center(child: Text(conArr[this.indexValue].confirmed.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                          onTap: () {
                            // do something
                          },
                        ),),
                      SizedBox(height: 5.0,),
                      Ink(
                        color: Colors.blue[200],
                        child:
                        ListTile(
                          title: Center(child: Text('Total Deaths', style: TextStyle(color: Colors.blue[900], fontSize: 30),)),
                          subtitle: Center(child: Text(conArr[this.indexValue].deceased.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                          onTap: () {
                            // do something
                          },
                        ),),
                      SizedBox(height: 5.0,),
                      Ink(
                        color: Colors.blue[200],
                        child:
                        ListTile(
                          title: Center(child: Text('Total Recovered', style: TextStyle(color: Colors.blue[900], fontSize: 30),)),
                          subtitle: Center(child: Text(conArr[this.indexValue].recovered.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                          onTap: () {
                            // do something
                          },
                        ),),
                      SizedBox(height: 5.0,),
                      Ink(
                        color: Colors.blue[200],
                        child:
                        ListTile(
                          title: Center(child: Text('New Confirmed Cases', style: TextStyle(color: Colors.blue[900], fontSize: 30),)),
                          subtitle: Center(child: Text(conArr[this.indexValue].newConfirmed.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                          onTap: () {
                            // do something
                          },
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Ink(
                        color: Colors.blue[200],
                        child:
                        ListTile(
                          title: Center(child: Text('New Deaths', style: TextStyle(color: Colors.blue[900], fontSize: 30),)),
                          subtitle: Center(child: Text(conArr[this.indexValue].newDeaths.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                          onTap: () {
                            // do something
                          },
                        ),),
                      SizedBox(height: 5.0,),
                      Ink(
                        color: Colors.blue[200],
                        child:
                        ListTile(
                          title: Center(child: Text('New Recovered', style: TextStyle(color: Colors.blue[900], fontSize: 30),)),
                          subtitle: Center(child: Text(conArr[this.indexValue].newRecovered.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                          onTap: () {
                            // do something
                          },
                        ),),
                      SizedBox(height: 10.0,)
                    ],
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
