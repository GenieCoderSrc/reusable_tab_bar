import 'package:flutter/material.dart';

abstract class BaseTab extends StatelessWidget {
  final String? label;

  const BaseTab({super.key, this.label});
}
