import 'package:flutter/material.dart';

import 'base_tab.dart';

class TextOnlyTab extends BaseTab {
  const TextOnlyTab({super.key, super.label});

  @override
  Widget build(BuildContext context) => Tab(text: label);
}
