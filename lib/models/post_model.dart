
class Post {
  final String id;
  final String imageUrl;
  final String authorName;
  final String date;
  final String postImage;
  final String caption;
  final int likeCount;
  final int commentCount;
  final int favoriteCount;
  final String authorId;
  final String time;

  Post({
    this.id, this.imageUrl,this.authorName, this.date, this.postImage, this.caption, this.likeCount, this.commentCount, this.favoriteCount,this.authorId, this.time
  });

  static List <Post> posts = [
    Post(id: '2', imageUrl: 'assets/images/conan.jpg' ,authorName: 'Detective Conan',date:'2020-02-13', postImage: 'assets/images/1.jpg', caption: 'Animas ka', likeCount: 50, commentCount: 20, favoriteCount: 40, authorId: '50', time: '5:30 PM'),
    Post(id: '3', imageUrl: 'assets/images/sherry.jpg' ,authorName: 'Sherry Miyano',date:'2020-02-14', postImage: 'assets/images/2.jpg',caption: 'metallica ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '4:30 PM'),
    Post(id: '4', imageUrl: 'assets/images/james.jpg' ,authorName: 'James Hitfield',date:'2020-02-15', postImage: 'assets/images/3.jpg',caption: 'asdasdas ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '3:30 PM'),
    Post(id: '5', imageUrl: 'assets/images/john.jpg' ,authorName: 'John Petrucci',date:'2020-02-16', postImage: 'assets/images/4.jpg',caption: 'Asdfsdfsd ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '2:30 PM'),
    Post(id: '6', imageUrl: 'assets/images/kirk.jpg' ,authorName: 'Kirk Hammett',date:'2020-02-17', postImage: 'assets/images/5.jpg',caption: 'A678 ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '1:30 PM'),
    Post(id: '7', imageUrl: 'assets/images/marty.jpg' ,authorName: 'Marty Friedman',date:'2020-02-18', postImage: 'assets/images/6.jpg',caption: 'yuyuyuuyi ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '12:30 PM'),
    Post(id: '8', imageUrl: 'assets/images/ran.jpg' ,authorName: 'Ran Mouri',date:'2020-02-19', postImage: 'assets/images/7.jpg',caption: 'nm,nm,nm ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '11:30 PM'),
    Post(id: '9', imageUrl: 'assets/images/save.jpg' ,authorName: 'Dave Mustaine',date:'2020-02-20', postImage: 'assets/images/1.jpg',caption: 'vvbvvn ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '10:30 PM'),
    Post(id: '10', imageUrl: 'assets/images/shinichi.jpg' ,authorName: 'Shinichi Kodou',date:'2020-02-21', postImage: 'assets/images/2.jpg',caption: 'Aniffgfgfgmas ka', likeCount: 50, commentCount: 20, favoriteCount: 40,authorId: '50', time: '9:30 PM'),
    Post(id: '11', imageUrl: 'assets/images/soo.jpg' ,authorName: 'Soo-In-Lee',date:'2020-02-22', postImage: 'assets/images/3.jpg',caption: 'rrrtrtrtrt ka', likeCount: 50, commentCount: 20, favoriteCount: 40, authorId: '50', time: '8:30 PM'),


  ];
}