import 'dart:io';
import 'package:diple/theme/diple.dart';
import 'package:flutter/material.dart';

const double _kSearchBarBorderRadius = 10.0;
const double _kSearchTextSize = 17.0;
const int _kSearchBarAnimationDuration = 250;
final Color _kSearchBarColor = DipleColors.dipleDark.withOpacity(0.08);
final Color _kSearchBarFocusColor = DipleColors.dipleDark.withOpacity(0.09);
final Color _kSearchBarPrefixColor = DipleColors.limeGreen;
final Color _kSearchBarSuffixColor = DipleColors.dipleDark;

/// Search bar from the Eufemia Design System
class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  /// Search bar from the Eufemia Design System
  ///
  /// * [controller]: The [TextEditingController] to use
  /// * [onChanged]: Callback for when the given [controller] changes
  const SearchBar({Key key, @required this.controller, this.onChanged}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    widget.controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _controllerListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AnimatedContainer(
            width: double.infinity,
            curve: Curves.ease,
            duration: Duration(milliseconds: _kSearchBarAnimationDuration),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                _kSearchBarBorderRadius,
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: _kSearchTextSize,
                ),
                onChanged: widget.onChanged,
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  prefixIcon: _getPrefix(),
                  suffixIcon: AnimatedOpacity(
                    opacity: _showSuffix ? 1.0 : 0.0,
                    duration: Duration(
                      milliseconds: _kSearchBarAnimationDuration,
                    ),
                    child: _getSuffix(),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: _kSearchTextSize,
                  ),
                  filled: true,
                  fillColor: _focusNode.hasFocus ? _kSearchBarFocusColor : _kSearchBarColor,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        if (Platform.isIOS) ...{
          AnimatedContainer(
            duration: Duration(milliseconds: _kSearchBarAnimationDuration),
            child: _focusNode.hasFocus
                ? FlatButton(
                    child: Text('Cancel'),
                    onPressed: _clearTextField,
                  )
                : SizedBox(),
          )
        },
      ],
    );
  }

  bool get _showSuffix => widget.controller.text.isNotEmpty;

  void _clearTextField() {
    // Workaround to avoid the Input field reacting to suffix button presses
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.clear();
      _focusNode.unfocus();
      setState(() {});
    });
  }

  Widget _getSuffix() => GestureDetector(
        child: Icon(
          Icons.cancel,
          color: _kSearchBarSuffixColor,
          size: 18.0,
        ),
        onTap: _clearTextField,
      );

  Widget _getPrefix() {
    if (Platform.isIOS) {
      return Icon(
        Icons.search,
        color: _kSearchBarPrefixColor,
      );
    } else {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: _kSearchBarAnimationDuration),
        child: _focusNode.hasFocus
            ? Icon(
                Icons.arrow_back,
                color: _kSearchBarPrefixColor,
              )
            : Icon(
                Icons.search,
                color: _kSearchBarPrefixColor,
              ),
      );
    }
  }
}
