import 'package:flutter/material.dart';

class MyselfIntroInfo extends StatelessWidget {
  const MyselfIntroInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("About Me",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          "I'm a dedicated Flutter developer with a strong foundation in building efficient and scalable mobile and web applications. Proficient in state management, clean architecture, and modern UI/UX principles, I focus on writing maintainable code while delivering seamless user experiences.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
