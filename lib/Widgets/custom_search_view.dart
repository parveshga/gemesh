import 'package:flutter/material.dart';

class BottomSearchSection extends StatelessWidget {
  final Function(String)? onSearch;
  final VoidCallback? onVoiceSearch;
  final VoidCallback? onFilterTap;

  const BottomSearchSection({
    super.key,
    this.onSearch,
    this.onVoiceSearch,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search For Devices',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onChanged: onSearch,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.mic_none,
                color: Colors.grey[600],
              ),
              onPressed: onVoiceSearch,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
