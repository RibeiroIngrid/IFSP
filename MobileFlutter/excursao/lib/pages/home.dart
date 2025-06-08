import 'package:carousel_slider/carousel_slider.dart';
import 'package:excursao/constants/colors.dart';
import 'package:excursao/main.dart';
import 'package:excursao/pages/login_form_screen.dart';
import 'package:excursao/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> carousel1Items = [
    'assets/animalia.png',
    'assets/hopiHari.png',
    'assets/Maeda.png',
    'assets/parqueMonica.png',
  ];

  final List<String> carousel2Items = [
    'assets/arraial.png',
    'assets/balneário.png',
    'assets/campos.png',
    'assets/ubatuba.png',
  ];

  int _currentCarousel1Index = 0;
  int _currentCarousel2Index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        title: const Text(
          'Explora Tour',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkGreen,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Redirect to LoginScreen when the icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginFormScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Bem-Vindo',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Explora Tour ©2025',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _buildCarouselSection(
              title: 'Passeios',
              items: carousel1Items,
              currentIndex: _currentCarousel1Index,
              onPageChanged: (index) {
                setState(() {
                  _currentCarousel1Index = index;
                });
              },
            ),
            const SizedBox(height: 40),
            _buildCarouselSection(
              title: 'Viagens',
              items: carousel2Items,
              currentIndex: _currentCarousel2Index,
              onPageChanged: (index) {
                setState(() {
                  _currentCarousel2Index = index;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Redirect to LoginScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Criar Cadastro',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSection({
    required String title,
    required List<String> items,
    required int currentIndex,
    required Function(int) onPageChanged,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          items:
              items.map<Widget>((String item) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(item, fit: BoxFit.cover, width: 300),
                  ),
                );
              }).toList(),
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              onPageChanged(index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              items.map((url) {
                int index = items.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 2.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        currentIndex == index
                            ? Colors.blue
                            : Colors.grey.withOpacity(0.4),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
