import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HalamanPembayaran()),
            );
          },
          child: Text('Go to Payment Page'),
        ),
      ),
    );
  }
}

class HalamanPembayaran extends StatefulWidget {
  @override
  _HalamanPembayaranState createState() => _HalamanPembayaranState();
}

class _HalamanPembayaranState extends State<HalamanPembayaran> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  double totalPembayaran = 450000;

  void updateTotalPayment() {
    setState(() {
      totalPembayaran = 0;
      if (isSelected1) totalPembayaran += 450000;
      if (isSelected2) totalPembayaran += 240000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.yellow[100],
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Perlu diketahui, proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text('Choose All')),
                Checkbox(
                  value: isSelected1 && isSelected2,
                  onChanged: (bool? value) {
                    setState(() {
                      isSelected1 = value ?? false;
                      isSelected2 = value ?? false;
                      updateTotalPayment();
                    });
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      color: Colors.blue,
                    ), // Placeholder for the logo image
                    title: Text('Rp450.000'),
                    subtitle: Text('Due date on 16 Feb 2024'),
                    trailing: Checkbox(
                      value: isSelected1,
                      onChanged: (bool? value) {
                        setState(() {
                          isSelected1 = value!;
                          updateTotalPayment();
                        });
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(), // Empty widget to push "See Details" to the right
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Add detail functionality here
                          },
                          child: Text(
                            'See Details',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(), // Empty widget to push "See Details" to the left
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      color: Colors.orange,
                    ), // Placeholder for the logo image
                    title: Row( // Wrap title and spacer in a Row
                      children: [
                        Text('Rp240.000'), // Centered text
                        Spacer(), // Add spacer to push text to left
                      ],
                    ),
                    subtitle: Text('Due date on 20 Feb 2024'),
                    trailing: Checkbox(
                      value: isSelected2,
                      onChanged: (bool? value) {
                        setState(() {
                          isSelected2 = value!;
                          updateTotalPayment();
                        });
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Align(
                    alignment: Alignment.center, // Center the button horizontally
                    child: TextButton(
                      onPressed: () {
                        // Add detail functionality here
                      },
                      child: Text(
                        'See Details',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Transaction History'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to transaction history
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Rp$totalPembayaran', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add payment functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'PAY NOW',
                  style: TextStyle(color: Colors.white), // Mengubah warna teks menjadi putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
