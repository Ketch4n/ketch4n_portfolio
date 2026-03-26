import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      width: 390,
      height: 70,
      borderRadius: 10,
      child: Center(
        child: Row(
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: .center,
          spacing: 20,
          children: [
            // SizedBox(height: 0.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(FontAwesomeIcons.solidAddressCard),
                SizedBox(height: 4),
                Text("About", style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(FontAwesomeIcons.layerGroup),
                SizedBox(height: 4),
                Text("Skills", style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(FontAwesomeIcons.code),
                SizedBox(height: 4),
                Text("Projects", style: TextStyle(fontSize: 12)),
              ],
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(FontAwesomeIcons.briefcase),
                SizedBox(height: 4),
                Text("Work Exp", style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(FontAwesomeIcons.solidEnvelope),
                SizedBox(height: 4),
                Text("Contacts", style: TextStyle(fontSize: 12)),
              ],
            ),

            // Expanded(
            //   child: Align(
            //     alignment: .bottomCenter,
            //     child: FaIcon(
            //       FontAwesomeIcons.batteryQuarter,
            //       ,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
