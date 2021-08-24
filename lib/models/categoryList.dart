class CategoryData{
  String imageUrl;
  String title;

  CategoryData({this.imageUrl,this.title});
}

class CategoryTileData{
  static final List<CategoryData> categories=[
    CategoryData(imageUrl: 'https://images.unsplash.com/photo-1588392382834-a891154bca4d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',title: 'NATURE'),
    CategoryData(imageUrl: 'https://images.unsplash.com/photo-1496196614460-48988a57fccf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80',title: 'ANIMALS'),
    CategoryData(imageUrl: 'https://images.unsplash.com/photo-1511884642898-4c92249e20b6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',title: 'LANDSCAPE'),
    CategoryData(imageUrl: 'https://images.unsplash.com/photo-1499781350541-7783f6c6a0c8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=815&q=80',title: 'STREET ART'),
  ];
}