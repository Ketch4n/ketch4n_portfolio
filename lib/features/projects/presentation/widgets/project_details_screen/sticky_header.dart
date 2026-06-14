import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/animations/slide_direction.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/buttons/button_header.dart';
import 'package:ketch4n/core/widgets/buttons/button_item_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';

class ProjectDetailsStickyHeader extends StatefulWidget {
  const ProjectDetailsStickyHeader({
    super.key,
    required this.projectDetails,
    required this.isMobile,
  });

  final ProjectEntity projectDetails;
  final bool isMobile;

  @override
  State<ProjectDetailsStickyHeader> createState() =>
      _ProjectDetailsStickyHeaderState();
}

class _ProjectDetailsStickyHeaderState
    extends State<ProjectDetailsStickyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.previewColor,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget
                    .projectDetails
                    .appName, // Ensure this matches exactly!
                child: Material(
                  color: Colors.transparent, // Prevents white box during flight
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.projectDetails.iconPath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SlideInTransition(
                  direction: SlideDirection.leftToRight,
                  delay: Duration(milliseconds: 250),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      widget.projectDetails.appName,
                      textAlign: widget.isMobile
                          ? TextAlign.center
                          : TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      widget.projectDetails.longName,
                      textAlign: widget.isMobile
                          ? TextAlign.center
                          : TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          SlideInTransition(
            direction: SlideDirection.rightToLeft,
            delay: Duration(milliseconds: 500),
            child: ButtonHeaderWidget(
              actionButtons: [],
              textTags: [
                ...widget.projectDetails.tag.map(
                  (tag) => TextTagWidget(text: tag),
                ),
              ],
              iconLinks: [
                if (widget.projectDetails.githubLink != null)
                  ButtonItemEntity(
                    icon: const FaIcon(FontAwesomeIcons.github),
                    tooltip: "Github",
                    url: widget.projectDetails.githubLink!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
