import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  FeedbackViewState createState() => FeedbackViewState();
}

class FeedbackViewState extends State<FeedbackView> {
  List<Review> reviews = [
    Review(
      userImage: 'assets/images/feedbackuserimage.jpeg',
      userName: 'සිරිපාල පෙරේරා',
      starRating: 4.5,
      date: '2022-01-01',
      comment: 'විශාල සේවයක් ලබා දුන්නා!',
    ),
    Review(
      userImage: 'assets/images/feedbackuserimage.jpeg',
      userName: 'සේනානායක මඩුගල්ල',
      starRating: 5.0,
      date: '2022-01-02',
      comment: 'ඔහු එම විෂ සහිත සර්පයා ඉවත් කිරීමට විශාල සහයෝගයක් ලබා දුන්න',
    ),
    Review(
      userImage: 'assets/images/feedbackuserimage.jpeg',
      userName: 'සමිතා දෙව්ජි',
      starRating: 5.0,
      date: '2022-01-02',
      comment: 'බෙහෙවින් නිර්දේශිතයි!',
    ),
    Review(
      userImage: 'assets/images/feedbackuserimage.jpeg',
      userName: 'චානක් සංගක්කාර',
      starRating: 5.0,
      date: '2022-01-02',
      comment: 'එය විශාල සර්පයෙක් විය. ඔහු එය ඉතා පරිස්සමින් හැසිරවිය',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('පරිශීලක ප්රතිචාර'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewItem(review: reviews[index]);
        },
      ),
    );
  }
}

class Review {
  final String userImage;
  final String userName;
  final double starRating;
  final String date;
  final String comment;

  Review({
    required this.userImage,
    required this.userName,
    required this.starRating,
    required this.date,
    required this.comment,
  });
}

class ReviewItem extends StatelessWidget {
  final Review review;

  const ReviewItem({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF50C878),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Increase the border radius as needed
      ),
      child: Container(
        height: 180, // Adjust the height as needed
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Increase the border radius as needed
              child: Image.asset(
                review.userImage,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8), // Add spacing between name and other details
                  Text(
                    review.userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        review.starRating.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    review.date,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    review.comment,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
