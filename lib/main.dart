import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
 // 1
 @override
 Widget build(BuildContext context) {
 // 2
 final ThemeData theme = ThemeData();
 // 3
 return MaterialApp(
 // 4
 title: 'Recipe Calculator',
 // 5
 theme: theme.copyWith(
 colorScheme: theme.colorScheme.copyWith(
 primary: Colors.grey,
 secondary: Colors.black,
 ),
 ),
 // 6
 home: const MyHomePage(title: 'Recipe Calculator'),
 );
 }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 @override
 Widget build(BuildContext context) {
 // 1
 return Scaffold(
 // 2
 appBar: AppBar(
 title: Text(widget.title),
 ),
 // 3
 body: SafeArea(
 // 4
child: ListView.builder(
 // 5
 itemCount: Recipe.samples.length,
 // 6
 itemBuilder: (BuildContext context, int index) {
 // 7
// 7
return GestureDetector(
 // 8
 onTap: () {
 // 9
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) {
 // 10
 // TODO: Replace return with return RecipeDetail()
return RecipeDetail(recipe: Recipe.samples[index]);
 },
 ),
 );
 },
 // 11
 child: buildRecipeCard(Recipe.samples[index]),
);
 
 },
),
 ),
 );
 }
 Widget buildRecipeCard(Recipe recipe) {
 return Card(
 // 1
 elevation: 2.0,
 // 2
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(10.0)),
 // 3
 child: Padding(
 padding: const EdgeInsets.all(16.0),
 // 4
 child: Column(
 children: <Widget>[
  Container(
  height: 300,
  width: 400,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image(
      image: AssetImage(recipe.imageUrl),
      fit: BoxFit.cover,
    ),
  ),
),
 // 5
 const SizedBox(
 height: 14.0,
 ),
 // 6
 Text(
 recipe.label,
 style: const TextStyle(
 fontSize: 20.0,
 fontWeight: FontWeight.w700,
 fontFamily: 'Palatino',
 ),
 )
 ],
 ),
 ),
 );
}
}