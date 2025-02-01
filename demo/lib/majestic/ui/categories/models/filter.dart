enum FilterType { dropdown, normal }

class Filter {
  String label;
  String value;
  FilterType filterType;

  Filter({
    required this.label,
    required this.value,
    required this.filterType,
  });

  bool get isDropdown => filterType == FilterType.dropdown;
}
