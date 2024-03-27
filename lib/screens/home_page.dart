import 'dart:async';
import 'package:flutter/material.dart';
import '../data/banner_data.dart';
import '../data/card_data.dart';
import '../data/category_data.dart';
import '../models/card_model.dart';
import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    int currentPage = 0;

    Timer.periodic(const Duration(seconds: 5), (timer) {
      if(currentPage < banners.length - 1){
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      itemCount: cards.length ~/ 2 + 1,
      padding: const EdgeInsets.only(bottom: 12),
      separatorBuilder: (_, index) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        return index != 0 ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              card(cards[index * 2 - 2]),
              const SizedBox(width: 10),
              card(cards[index * 2 - 1])
            ],
          ),
        ) : SizedBox(
          height: size.height * 0.37,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: banners.length,
                  controller: _pageController,
                  itemBuilder: (_, index) => Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(banners[index])
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                  itemBuilder: (context, index) => category(categories[index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget card(CardModel cardModel){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 240,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(cardModel.img)
                    )
                ),
              ),
              SizedBox(
                height: 240,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => setState(() => cardModel.isFavorite = !cardModel.isFavorite),
                          icon: cardModel.isFavorite ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_border),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                    const Spacer(),
                    if(cardModel.isAksiya)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 5),
                          Container(
                            width: 60,
                            height: 18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text('Aksiya', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                    const SizedBox(height: 5),
                  ],
                ),
              )
            ],
          ),
          Text(cardModel.title)
        ],
      ),
    );
  }

  Widget category(CategoryModel categoryModel) => SizedBox(
    width: 70,
    child: Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15)
          ),
        ),
        const SizedBox(height: 2),
        Text(categoryModel.title, maxLines: 2, textAlign: TextAlign.center)
      ],
    ),
  );
}

