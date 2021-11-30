import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/services.dart';
import 'package:nahwu/generated/club.dart';
import 'package:nahwu/generated/json_helper.dart';

class MainNahwu extends StatefulWidget {
  const MainNahwu({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainNahwu> {
  Club? club;
  List<Club> clubs = [];

  final TextEditingController _textFieldController = TextEditingController();

  Future<List<Club>> loadJson() async {
    final result = await JsonHelper.readJsonFromAssets("assets/clubs.json");

    final data = (result['clubs'] as List<dynamic>)
        .map((e) => Club.fromJson(e))
        .toList();

    return data;
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('Cari Nahwu'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: FutureBuilder<List<Club>>(
        future: loadJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final result = snapshot.data;
            return _buildContainer(result!);
          } else if (snapshot.hasError) {
            final String error = snapshot.error as String;
            return Center(
              child: Text('Error when load data! \n Error $error'),
            );
          } else {
            return const Center(
              child: Text('Load Data'),
            );
          }
        },
      ),
    );
  }

  Widget _buildContainer(List<Club> clubs) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height - 80.0,
        child: Center(
          child: Column(
            children: [
              _buildTextField(clubs),
              const SizedBox(height: 20.0),
              _buildOutput(),
              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: Card(
                  color: Colors.green[50],
                  child: _buildfooter(),
                  margin: const EdgeInsets.fromLTRB(16, 0.0, 16, 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(List<Club>? clubs) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          autofocus: false,
          controller: _textFieldController,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 24.0,
          ),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            // labelText: "Cari Nahwu",
            // labelStyle: TextStyle(
            //   color: Colors.black38,
            //   fontSize: 18.0,
            // ),
            hintText: "Cari Nahwu di sini",
            hintStyle: TextStyle(
              color: Colors.black38,
              fontSize: 18.0,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
        ),
        suggestionsCallback: (query) {
          final result = getClubSuggestions(query, clubs);
          return result;
        },
        onSuggestionSelected: (Club value) {
          setState(() {
            club = value;
          });
          _textFieldController.text = value.kata;
        },
        noItemsFoundBuilder: (BuildContext context) {
          return const ListTile(
            title: Text('nahwu not found..'),
          );
        },
        itemBuilder: (BuildContext context, Club club) {
          return Column(
            children: [
              const SizedBox(
                height: 8.0,
              ),
              ListTile(
                hoverColor: Colors.blue,
                title: Text(
                  club.kata,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 19.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'kata : ${club.kata}, katagori : ${club.katagori}, irob : ${club.irob}, tandairob : ${club.tandairob}',
                  style: const TextStyle(
                    fontSize: 19.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(
                height: 4.0,
              ),
            ],
          );
        },
        hideSuggestionsOnKeyboardHide: false,
      ),
    );
  }

  Widget _buildOutput() {
    if (club == null) {
      return const Text("\n \n \n \n CARI NAHWU YUUUK !!",
          style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.w900,
          ));
    } else {
      return Text(
        """
    
Kata  : ${club!.kata}
    
Bentuk  : ${club!.bentuk}
    
Katagori : ${club!.katagori}
    
I'rob  : ${club!.irob}
  
Tanda I'rob  : ${club!.tandairob}""",
        style: const TextStyle(fontSize: 24.0),
      );
    }
  }
}

_buildfooter() {
  return CarouselSlider(
    items: [
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/footer.jpg')),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/images.png')),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/ju4.png')),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/ju3.png')),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/ju1.png'))
    ],

    //Slider Container properties
    options: CarouselOptions(
      autoPlay: true,
    ),
  );
}

List<Club> getClubSuggestions(String query, List<Club>? clubs) {
  List<Club> matchedClubs = [];

  matchedClubs.addAll(clubs!);
  matchedClubs.retainWhere(
      (club) => club.kata.toLowerCase().contains(query.toLowerCase()));

  if (query == '') {
    return clubs;
  } else {
    return matchedClubs;
  }
}
