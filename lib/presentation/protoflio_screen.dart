import 'package:flutter/material.dart';
import 'package:portfolio/presentation/myself_intro_info.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ✅ Hero Section
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.4, // Responsive height
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=1600&q=80"), // ✅ This image will always work
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.4,
                  color: Colors.black.withOpacity(0.7),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/143972847?s=400",
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Hi, I'm Ahmed Mohamed 👋",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text("Flutter Developer | Mobile & Web Apps",
                          style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 20),

                      // ✅ Social Links
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 15,
                        children: [
                          _buildSocialButton("GitHub",
                              "https://github.com/Ahm3dmohamed", Icons.code),
                          _buildSocialButton(
                              "LinkedIn",
                              "https://www.linkedin.com/in/ahmed-mohamed-21a812265/",
                              Icons.business),
                          _buildSocialButton("Portfolio",
                              "http://flowcv.me/ahmed-mohamed", Icons.web),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ✅ About Me Section
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: MyselfIntroInfo(),
            ),

            // ✅ Projects Section
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600
                  ? 3
                  : 2, // ✅ Adaptive grid layout
              children: [
                _buildProjectCard(
                  "Bookly",
                  "https://github.com/Ahm3dmohamed/bookly_app",
                  "https://raw.githubusercontent.com/Ahm3dmohamed/bookly_app/main/assets/images/book.jpeg",
                ),
                _buildProjectCard(
                  "NewsApp",
                  "https://github.com/Ahm3dmohamed/newapp",
                  "https://raw.githubusercontent.com/Ahm3dmohamed/newapp/main/assets/images/logo.png?raw=true",
                ),
                _buildProjectCard(
                  "Design Task",
                  "https://github.com/Ahm3dmohamed/design_task",
                  "https://raw.githubusercontent.com/Ahm3dmohamed/design_task/main/assets/img/splash_screen.png?raw=true",
                ),
                _buildProjectCard(
                  "Todo App",
                  "https://github.com/Ahm3dmohamed/todo_app",
                  "https://raw.githubusercontent.com/Ahm3dmohamed/todo_app/main/assets/images/logo.png?raw=true",
                ),
                _buildProjectCard(
                  "Islamic App",
                  "https://github.com/Ahm3dmohamed/islami_app",
                  "https://raw.githubusercontent.com/Ahm3dmohamed/islami_app/develop/assets/images/appHome.jpg?raw=true",
                ),
                _buildProjectCard(
                  "Flower App",
                  "https://github.com/Ahm3dmohamed/FLOWER_APP",
                  "https://raw.githubusercontent.com/Ahm3dmohamed/FLOWER_APP/main/flower__app/assets/img/flower00.jpg?raw=true",
                ),
              ],
            ),

            // ✅ Contact Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text("Contact Me",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => _launchURL("mailto:ahm3dmo00@gmail.com"),
                    child: const Text("Email Me"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Social Button Component (Fixes Overflow)
  Widget _buildSocialButton(String text, String url, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () => _launchURL(url),
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
    );
  }

  // ✅ Project Card Component (Handles Image Loading)
  static Widget _buildProjectCard(String title, String url, String imagePath) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // ✅ Ensures correct scaling
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Function to Open URLs Safely
  static void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
