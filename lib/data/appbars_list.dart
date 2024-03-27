import 'package:flutter/material.dart';

List<PreferredSizeWidget> appBars = [
  PreferredSize(
    preferredSize: const Size.fromHeight(62),
    child: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: (){},
                    // controller: controller,
                    // readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.deepPurple.withOpacity(0.15),
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      hintText: 'Mahsulot va toyifalarni qidirish',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.favorite_border),
                )
              ],
            ),
          ),
          const SizedBox(height: 12)
        ],
      ),
    ),
  ),
  AppBar(
    title: const Text("Saqlangan", style: TextStyle(fontWeight: FontWeight.bold)),
    foregroundColor: Colors.white,
    backgroundColor: Colors.amber,
    centerTitle: true,
  ),
  AppBar(
    title: const Text("Qidirish", style: TextStyle(fontWeight: FontWeight.bold)),
    foregroundColor: Colors.white,
    backgroundColor: Colors.amber,
    centerTitle: true,
  ),
  AppBar(
    title: const Text("settings", style: TextStyle(fontWeight: FontWeight.bold)),
    foregroundColor: Colors.white,
    backgroundColor: Colors.amber,
    centerTitle: true,
  ),
  AppBar(
    title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
    foregroundColor: Colors.white,
    backgroundColor: Colors.amber,
    centerTitle: true,
  )
];
