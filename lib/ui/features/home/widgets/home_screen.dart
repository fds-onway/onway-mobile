import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF5BBF7F), Color(0xFF2E8B57)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquise aqui...',
                          hintStyle:
                              TextStyle(color: Colors.grey[500], fontSize: 16),
                          border: InputBorder.none,
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Categories
                    Wrap(
                      spacing: 8,
                      children: [
                        _CategoryChip('Categoria 1'),
                        _CategoryChip('Categoria 2'),
                        _CategoryChip('Categoria 3'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: const [
                    _TravelCard(
                      title: 'Caminho de Santiago',
                      rating: 4.5,
                      imageUrl: 'https://www.elcaminoconcorreos.com/imagenes-blog/352/km-camino-santiago.jpg',
                    ),
                    SizedBox(height: 16),
                    _TravelCard(
                      title: 'O que fazer no Paraná?',
                      rating: 3.5,
                      imageUrl:'https://media.istockphoto.com/id/1372346536/pt/foto/curitiba.jpg?s=2048x2048&w=is&k=20&c=2tk7HV6d6ZzpEAn-oVFXfECobRL3v4URvGR1CjCBDIo=',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5BBF7F), Color(0xFF2E8B57)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 36),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String text;
  const _CategoryChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.white,
      side: const BorderSide(color: Colors.grey, width: 0.3),
      labelStyle: const TextStyle(color: Colors.black87),
    );
  }
}

class _TravelCard extends StatelessWidget {
  final String title;
  final double rating;
  final String imageUrl;

  const _TravelCard({
    required this.title,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent , Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 36,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.black54, blurRadius: 6),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 12,
            child: Text(
              'Avaliação: ${rating.toStringAsFixed(1)}/5',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 12,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5BBF7F),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text('Ver mais'),
            ),
          ),
        ],
      ),
    );
  }
}
