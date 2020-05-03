import 'package:covid19tracker/model/model.dart';
import 'package:flutter/material.dart';

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
  void changeToModel() {
    List<dynamic> countries = widget.countryData["Countries"];
    int size = widget.countryData["Countries"].length;
//    print('dbg--');
//    print(size);
  for (int i = 0; i < size; i++) {
    CovidInfoInterfaceForCountries covNations = new CovidInfoInterfaceForCountries(countries[i]["Country"],countries[i]["TotalConfirmed"],countries[i]["TotalDeaths"],countries[i]["TotalRecovered"],countries[i]["NewDeaths"],countries[i]["NewRecovered"],countries[i]["NewConfirmed"], );
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Countries'),
          backgroundColor: Colors.blue[200],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0,),
            Text("Choose country", style: TextStyle(
              color: Colors.blue[900],
              fontSize: 30.0
            ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0 ),
              child: DropdownButton<String>(
                items: conArr.map((CovidInfoInterfaceForCountries countryArray) {
                  return DropdownMenuItem<String>(
                    value: countryArray.country,
                    child: Text(countryArray.country),
                  );
                }).toList(),
                onChanged: (String val) {
           setState(() {
               this.selected = val;
           });
      },
              value: this.selected,
          ),
            ),
          CountriesData(),
          ]
        ),

      ),
    );
  }
}

class CountriesData extends StatefulWidget {
  @override
  _CountriesDataState createState() => _CountriesDataState();
}

class _CountriesDataState extends State<CountriesData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('countries data'),
    );
  }
}
