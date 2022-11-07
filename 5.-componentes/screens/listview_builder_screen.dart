import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListVierBuilderScreen extends StatefulWidget {
  const ListVierBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListVierBuilderScreen> createState() => _ListVierBuilderScreenState();
}

class _ListVierBuilderScreenState extends State<ListVierBuilderScreen> {
  final List<int> imagesId = [1, 2, 3, 4, 5, 6, 7, 8, 10];
  final ScrollController scrollController = ScrollController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // add5();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    add5();
    isLoading = false;
    setState(() {});

    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void add5() {
    final lastiId = imagesId.last;
    imagesId.addAll([
      1,
      2,
      3,
      4,
    ].map((e) => lastiId + e));
    setState(() {});
  }

  //un future que retorna un vodi
  Future<void> onRefresh() async {
    //esperamos 2 segundos
    await Future.delayed(const Duration(seconds: 2));
    //guardamos el id del ultomo elento
    final lastId = imagesId.last;
    //limpiamos
    imagesId.clear();
    //agregamos 1 al id
    imagesId.add(lastId + 1);
    // agregamos 1
    add5();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    //esta variable sabe atravez del mediaquery el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            //el refreshindicator nos sire para poder hacer el pull request de manera sencilla
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: imagesId.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${imagesId[index]}'));
                },
              ),
            ),
            if (isLoading)
              Positioned(
                  left: (size.width * 0.5) - 30,
                  bottom: 40,
                  child: _lodingIcon())
            else
              Positioned(
                left: (size.width * 0.5) - 30,
                bottom: 40,
                child: const Text("hola mundo"),
              ),
          ],
        ),
      ),
    );
  }
}

class _lodingIcon extends StatelessWidget {
  const _lodingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      child: CircularProgressIndicator(
        color: AppTheme.primary,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
    );
  }
}
