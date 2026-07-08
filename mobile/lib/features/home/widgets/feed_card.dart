import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFFE5E7EB),
                  child: Icon(Icons.person),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Text(
                            "Vyrona User",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(width: 4),

                          Icon(
                            Icons.verified,
                            color: Colors.blue,
                            size: 18,
                          ),
                        ],
                      ),

                      SizedBox(height: 2),

                      Text(
                        "2 min ago",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),

                    ],
                  ),
                ),

                Icon(Icons.more_horiz),

              ],
            ),

            const SizedBox(height: 18),

            const Text(
              "Welcome to the next generation social platform. 🚀",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 18),

            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF2563EB),
                    Color(0xFF7C3AED),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Icon(Icons.favorite_border),

                Icon(Icons.chat_bubble_outline),

                Icon(Icons.repeat),

                Icon(Icons.send),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
