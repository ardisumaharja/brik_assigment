import 'package:flutter/material.dart';

class SearchProductSection extends StatefulWidget {
  const SearchProductSection({super.key, required this.onChange});

  final ValueChanged<String> onChange;

  @override
  State<SearchProductSection> createState() => _SearchingSectionState();
}

class _SearchingSectionState extends State<SearchProductSection> {
  String text = '';
  TextEditingController searchingCtrl = TextEditingController();

  @override
  void dispose() {
    searchingCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchingCtrl,
      onChanged: (value) => {
        setState(() {
          text = value;
        }),
        widget.onChange(value),
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(bottom: 2.5),
          child: Icon(
            Icons.search,
            size: 20,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: InkWell(
          onTap: () => {
            setState(() {
              searchingCtrl.text = '';
              text = '';
            }),
            widget.onChange(''),
          },
          child: const Padding(
            padding: EdgeInsets.only(bottom: 2.5),
            child: Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
