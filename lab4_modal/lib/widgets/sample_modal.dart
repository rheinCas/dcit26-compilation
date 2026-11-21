import 'package:material_ui/material_ui.dart';

class SampleModal extends StatelessWidget {
  const SampleModal({super.key});

  static const Color green = Color(0xFF1F6B45);

  static const List<String> _paragraphs = [
    'One Piece is a Japanese manga series written and illustrated by '
        'Eiichiro Oda that began serialization in Weekly Shōnen Jump in July '
        '1997. The story follows Monkey D. Luffy, a young pirate whose body '
        'becomes elastic after eating a Devil Fruit, as he sets out to find '
        'the legendary "One Piece" treasure and become King of the Pirates.',
    'Along his voyage, Luffy recruits a diverse crew known as the Straw Hat '
        'Pirates, including swordsman Roronoa Zoro, navigator Nami, sniper '
        'Usopp, and cook Sanji. Other key members—such as Tony Tony Chopper, '
        'Nico Robin, Franky, and Brook—join later as each pursues a personal '
        'dream.',
    'The series is set in a vast maritime world made up of oceans, four '
        'seas, the Red Line, and the treacherous Grand Line. Travelers rely '
        'on tools like Log Poses to navigate shifting magnetic fields and '
        'reach islands with extreme climates and unique cultures.',
    'Combat and power in One Piece center on Devil Fruits, which grant '
        'supernatural abilities at the cost of the user\'s ability to swim, '
        'alongside Haki, a willpower-based power. Rival pirate crews, '
        'powerful warlords, and the World Government—backed by the '
        'Marines—constantly clash over territory, authority, and secrets.',
    'Mystery drives much of the overarching plot, particularly around the '
        'Void Century, ancient poneglyph stones, and Laugh Tale, the final '
        'island where Gol D. Roger left his treasure. Themes of freedom, '
        'friendship, justice, and inherited will recur throughout long arcs '
        'packed with foreshadowing.',
    'Beyond the manga—which reached 115 collected volumes by July 2026 and '
        'over 600 million copies in circulation by March 2026—One Piece has '
        'grown into a massive global franchise. It includes Toei '
        'Animation\'s long-running anime series since 1999, animated films, '
        'video games, a trading card game, a 2023 Netflix live-action '
        'adaptation, and an upcoming anime adaptation from Wit Studio '
        'slated for 2027.',
    'Critics and readers widely praise One Piece as one of the greatest '
        'manga series ever made for its imaginative worldbuilding, emotional '
        'payoffs, humor, and long-term storytelling. Its blend of '
        'lighthearted adventure and heavy political or historical intrigue '
        'keeps both longtime fans and newcomers engaged.',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title bar
            Container(
              width: double.infinity,
              color: green,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: const Text(
                'SampleModal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Image at the top
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/sample_modal_image.png',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Scrollable text, bounded by Flexible
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _paragraphs.join('\n\n'),
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
              ),
            ),
            // CLOSE button beneath the text
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('CLOSE'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
