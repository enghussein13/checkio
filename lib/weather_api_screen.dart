import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/auth_services.dart';
import 'home_screen.dart';
class WeatherApiScreen extends StatefulWidget {
  const WeatherApiScreen({Key? key}) : super(key: key);

  @override
  State<WeatherApiScreen> createState() => _WeatherApiScreenState();
}

class _WeatherApiScreenState extends State<WeatherApiScreen> {

  String _CountryName='';
  String _cityName = '';
  String _description = '';
  String _iconUrl = '';
  String _temperature = '';
  bool isClicked=false;


  Future<void> _fetchWeather() async {
    setState(() {
      isClicked=true;
    });
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${AuthServices.cl!.latitude}&lon=${AuthServices.cl!.longitude}&appid=8a03c8a25d7cad32bef1d387cf0f651b&units=metric&lang=ar'));
    final jsonData = json.decode(response.body);
    setState(() {
      isClicked=false;
      _CountryName = jsonData['sys']['country'];
      _cityName = jsonData['name'];
      _description = jsonData['weather'][0]['description'];
      _iconUrl =
      'https://openweathermap.org/img/w/${jsonData['weather'][0]['icon']}.png';
      _temperature = '${jsonData['main']['temp']}°C';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar() ,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const SizedBox(height: 10),
            isClicked==true?const CircularProgressIndicator():ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              icon:const Icon(Icons.arrow_forward);
            } , child: const Text('Go TO Geolocator Screen')),
            _iconUrl.isNotEmpty
                ? Image.network(_iconUrl)
                : SizedBox.shrink(),
            SizedBox(height: 20),
            Text(_CountryName, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text(_cityName, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text(_description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(_temperature, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
