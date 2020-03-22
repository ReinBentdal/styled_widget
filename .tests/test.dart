[
  Text('kok'),
  Text('kok'),
]
  .listView()
  .padding(all: 20)

...list
  .padding(all: 20)

List<Widget> _children = [
  Text('kok'),
  Text('kok'),
]

Column(
  children: _children.expand((element) => [e, SizedBox(height: 40)]).toList()
)