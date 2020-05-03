import 'package:covid19tracker/fetch_data.dart';
import 'package:covid19tracker/model/model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'countries_page.dart';

    class MainPage extends StatefulWidget {
    @override
    _MainPageState createState() => _MainPageState();
    }

    class _MainPageState extends State<MainPage> {

      var covDate;
      Map<String, dynamic> covInCountries;

    Future<List<CovidInfoInterfaceForWorld>> _getInfoFromFetchClass() async {
    var res = await FetchData.getInfo();
    var jsonData = json.decode(res.body);
//    print(jsonData["Global"]);
      covDate = jsonData["Date"].substring(0, 10);

    List<CovidInfoInterfaceForWorld> covidInfo = [];
    CovidInfoInterfaceForWorld covIn = CovidInfoInterfaceForWorld(
        jsonData["Global"]["TotalConfirmed"], jsonData["Global"]["TotalDeaths"],
        jsonData["Global"]["TotalRecovered"], jsonData["Global"]["NewDeaths"],
        jsonData["Global"]["NewRecovered"], jsonData["Global"]["NewConfirmed"],);
    print(covIn.confirmed);
    covInCountries = json.decode(res.body);
    covidInfo.add(covIn);
    print(covidInfo.length);
    print(covidInfo);
    print("MAP");
    print(covInCountries.length);
    print(covInCountries['Countries'].length);
    return covidInfo;
  }

  @override
  void initState() {
    super.initState();
    _getInfoFromFetchClass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid-19 Tracker', style: TextStyle(
            color: Colors.white,
          ),),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          child: FutureBuilder(
              future: _getInfoFromFetchClass(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 20.0),
                                  Image(image: new AssetImage('images/world.png',), width: 80.0),
                                  SizedBox(height: 20.0),
                                  ListTile(
                                    title: Center(child: Text(covDate, style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[900]
                                    ),))


                                  ),
                                  Ink(
                                    color: Colors.blue[200],
                                  child:
//                                  SizedBox(width: 10),
//                                  Center(child: Text('Total Confirmed Cases', style: TextStyle(color: Colors.pink, fontSize: 30),)),
                                  ListTile(
                                    title: Center(child: Text('Total Confirmed Cases', style: TextStyle(color: Colors.blue[900], fontSize: 30),)),
                                    subtitle: Center(child: Text(snapshot.data[index].confirmed.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
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
                                    subtitle: Center(child: Text(snapshot.data[index].deceased.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
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
                                    subtitle: Center(child: Text(snapshot.data[index].recovered.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
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
                                    subtitle: Center(child: Text(snapshot.data[index].newConfirmed.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
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
                                    subtitle: Center(child: Text(snapshot.data[index].newDeaths.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
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
                                    subtitle: Center(child: Text(snapshot.data[index].newRecovered.toString() , style: TextStyle(color: Colors.black, fontSize: 30),)),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                                    onTap: () {
                                      // do something
                                    },
                                  ),),
                                  SizedBox(height: 10.0,),
                              ListTile(
                                title: Center(child: Text('Countries', style: TextStyle(color: Colors.black, fontSize: 50),)),
                              trailing: Icon(Icons.navigate_next, size: 55,),
                                contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => new CountriesPage(countryData: this.covInCountries,))
                                  );
                                },
                              ),
                                  SizedBox(height: 10.0,),
                                ],
                              ),
                            ),

                          );
                      }
//                  return ListTile(
//
//                    title: Center(child: Text('Total Confirmed Cases', style: TextStyle(color: Colors.pink, fontSize: 30),)),
//                    subtitle: Center(child: Text(snapshot.data[index].confirmed.toString() , style: TextStyle(color: Colors.pink, fontSize: 30),)),
//                    isThreeLine: true,
//                  );
//                },
                  );
                }
              }),
        )
    );
  }
}