import 'package:flutter/material.dart';
import 'package:test1/widgets/SizeOverlay.dart';


class BarSort extends StatefulWidget {
  @override
  _BarSortState createState() => _BarSortState();
}

class _BarSortState extends State<BarSort> {
  int selectedOptionIndex = 0;

  final List<String> options = ['0', 'On Sale', 'Price', 'Sort by', 'Men'];

  // This method will open the SizeOverlay when called
  void _showSizeOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to take more space if necessary
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SizeOverlay(), // Display the SizeOverlay widget
    );
  }

  // Handles option selection and displays the SizeOverlay
  void _onOptionSelected(int index) {
    setState(() {
      selectedOptionIndex = index;
    });

    // Only show SizeOverlay for sorting options like 'Sort by', 'Price', etc.
    if (options[index] == 'Sort by' || options[index] == 'Price') {
      _showSizeOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = screenWidth > 600;

          return Column(
            children: [
              Container(
                width: isLargeScreen ? screenWidth * 0.5 : screenWidth * 0.9,
                height: 27,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(options.length, (index) {
                    bool isActive = selectedOptionIndex == index;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                        onTap: () => _onOptionSelected(index), // Handle tap
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: ShapeDecoration(
                            color: isActive ? Color(0xFF8E6CEE) : Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (options[index] == '2') ...[
                                Icon(Icons.circle, size: 16, color: Colors.white),
                                const SizedBox(width: 4),
                              ],
                              Text(
                                options[index],
                                style: TextStyle(
                                  color: isActive ? Colors.white : Color(0xFF272727),
                                  fontSize: isLargeScreen ? 14 : 12,
                                  fontFamily: 'Circular Std',
                                  fontWeight: FontWeight.w500,
                                  height: 0.13,
                                ),
                              ),
                              if (options[index] != '2') const SizedBox(width: 4),
                              if (options[index] != '2') ...[
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 16,
                                  color: isActive ? Colors.white : Color(0xFF272727),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
