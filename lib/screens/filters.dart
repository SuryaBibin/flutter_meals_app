import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
              value: activeFilters[Filter.glutenfree]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.glutenfree, isChecked);
              },
              title: 'Gluten-Free',
              subTitle: 'Only include gluten-free meals'),
          FilterItem(
              value: activeFilters[Filter.lactosefree]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.lactosefree, isChecked);
              },
              title: 'Lactose-Free',
              subTitle: 'Only include lactose-free meals'),
          FilterItem(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              title: 'Vegetarian',
              subTitle: 'Only include vegetarian meals'),
          FilterItem(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
              title: 'Vegan',
              subTitle: 'Only include Vegan meals'),
        ],
      ),
    );
  }
}
