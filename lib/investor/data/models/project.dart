class Project {
  String name;
  String description;

  Project({
    required this.name,
    required this.description,
  });

  factory Project.mock() {
    return Project(
      name: 'DogsAndHorses',
      description: 'Alimentar animais de rua',
    );
  }
}
