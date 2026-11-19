import 'package:flutter/material.dart';

void main() => runApp(const PixoraApp());

class PixoraApp extends StatelessWidget {
  const PixoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PIXORA AI',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090B16),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5CF6),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF090B16),
        title: const Row(
          children: [
            Icon(Icons.auto_awesome, color: Color(0xFF9B8CFF)),
            SizedBox(width: 8),
            Text('PIXORA', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2)),
            SizedBox(width: 5),
            Text('AI', style: TextStyle(color: Color(0xFF9B8CFF), fontWeight: FontWeight.w900)),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B1B35),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF51418B)),
            ),
            child: const Row(
              children: [
                Icon(Icons.bolt, size: 17, color: Color(0xFFFFD166)),
                SizedBox(width: 4),
                Text('20 credits', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Color(0xFF34216D), Color(0xFF152B55), Color(0xFF10172D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: const Color(0xFF6250A5).withOpacity(.5)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('IMAGINE IT. CREATE IT.',
                    style: TextStyle(fontSize: 11, letterSpacing: 2, color: Color(0xFFD7D0FF), fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Text('Turn your ideas\\ninto amazing videos.',
                    style: TextStyle(fontSize: 27, height: 1.15, fontWeight: FontWeight.w800)),
                  SizedBox(height: 10),
                  Text('Create with AI — from text, images and imagination.',
                    style: TextStyle(color: Color(0xFFD1D5E8), height: 1.4)),
                ],
              ),
            ),
            const SizedBox(height: 26),
            const Text('Create with AI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Choose how you want to create', style: TextStyle(color: Colors.white60)),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.12,
              children: const [
                FeatureCard(icon: Icons.edit_note, title: 'Text to Video', subtitle: 'Describe your idea', color: Color(0xFF8B5CF6)),
                FeatureCard(icon: Icons.image_outlined, title: 'Image to Video', subtitle: 'Animate a picture', color: Color(0xFF2D9CDB)),
                FeatureCard(icon: Icons.animation, title: 'AI Cartoon', subtitle: 'Create animated scenes', color: Color(0xFFFF9F43)),
                FeatureCard(icon: Icons.record_voice_over, title: 'AI Voice', subtitle: 'Voiceovers in many languages', color: Color(0xFF27AE8A)),
              ],
            ),
            const SizedBox(height: 26),
            const Text('Your creations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFF121629),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white10),
              ),
              child: const Column(
                children: [
                  Icon(Icons.video_library_outlined, size: 38, color: Colors.white38),
                  SizedBox(height: 10),
                  Text('No videos yet', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Your generated videos will appear here.',
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('Preview build • AI generation will be connected in a later step.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white38, fontSize: 11)),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF101426),
        indicatorColor: const Color(0xFF45347B),
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.video_collection_outlined), label: 'My Videos'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title will be enabled when the AI service is connected.')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF14192B),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withOpacity(.16),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: color, size: 23),
            ),
            const Spacer(),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 4),
            Text(subtitle, maxLines: 2, style: const TextStyle(color: Colors.white54, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
