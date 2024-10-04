import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String)? onSearch;

  const CustomSearchBar({Key? key, this.onSearch}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // This will trigger when the user taps the search bar
        print("Search bar tapped");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xFF272727)),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (widget.onSearch != null) {
                    widget.onSearch!(value); // Pass the search query back to the parent widget
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Color(0xFF272727),
                    fontSize: 12,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w400,
                  ),
                  // Add suffixIcon (clear icon)
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Color(0xFF272727)),
                          onPressed: () {
                            _controller.clear(); // Clear the text field
                            setState(() {}); // Update the UI
                          },
                        )
                      : null,
                ),
                style: const TextStyle(
                  color: Color(0xFF272727),
                  fontSize: 12,
                ),
                onChanged: (text) {
                  setState(() {}); // Trigger UI rebuild to show/hide clear icon
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
