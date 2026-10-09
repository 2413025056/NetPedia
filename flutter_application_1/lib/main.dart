import 'package:flutter/material.dart';

void main() {
  runApp(const NetPediaApp());
}

// ============================================================
// NETPEDIA APP
// Aplikasi Kamus Interaktif Istilah Jaringan Komputer
// Untuk Siswa SMK TJKT
// ============================================================

class NetPediaApp extends StatelessWidget {
  const NetPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NetPedia',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3155D9),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ============================================================
// MODEL DATA
// ============================================================

class Category {
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  const Category({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class Term {
  final String name;
  final String abbreviation;
  final String category;
  final String definition;
  final String explanation;
  final String example;
  final IconData icon;

  const Term({
    required this.name,
    required this.abbreviation,
    required this.category,
    required this.definition,
    required this.explanation,
    required this.example,
    required this.icon,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

// ============================================================
// DATA KATEGORI
// ============================================================

const List<Category> categories = [
  Category(
    name: 'Perangkat Jaringan',
    description:
        'Perangkat keras yang digunakan untuk membangun dan menghubungkan jaringan.',
    icon: Icons.router_outlined,
    color: Color(0xFF3155D9),
  ),
  Category(
    name: 'Alamat Jaringan',
    description:
        'Istilah yang berkaitan dengan identitas dan pengalamatan perangkat.',
    icon: Icons.location_on_outlined,
    color: Color(0xFF8B5CF6),
  ),
  Category(
    name: 'Layanan Jaringan',
    description:
        'Layanan dan protokol yang membantu perangkat berkomunikasi.',
    icon: Icons.miscellaneous_services_outlined,
    color: Color(0xFF0EA5A4),
  ),
];

// ============================================================
// DATA ISTILAH
// ============================================================

const List<Term> terms = [
  // ----------------------------------------------------------
  // PERANGKAT JARINGAN
  // ----------------------------------------------------------

  Term(
    name: 'Router',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition:
        'Perangkat jaringan yang digunakan untuk menghubungkan dua atau lebih jaringan dan menentukan jalur pengiriman data.',
    explanation:
        'Router meneruskan paket data berdasarkan informasi alamat jaringan sehingga data dapat mencapai jaringan tujuan.',
    example:
        'Router digunakan untuk menghubungkan jaringan komputer di sekolah dengan jaringan internet.',
    icon: Icons.router,
  ),

  Term(
    name: 'Switch',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition:
        'Perangkat jaringan yang menghubungkan beberapa perangkat dalam satu jaringan lokal.',
    explanation:
        'Switch menerima data dari suatu perangkat kemudian meneruskannya ke perangkat tujuan berdasarkan alamat perangkat yang diketahui.',
    example:
        'Beberapa komputer di laboratorium dapat dihubungkan menggunakan switch.',
    icon: Icons.hub_outlined,
  ),

  Term(
    name: 'Hub',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition:
        'Perangkat jaringan yang digunakan untuk menghubungkan beberapa perangkat dalam jaringan.',
    explanation:
        'Berbeda dengan switch, hub meneruskan data yang diterima ke seluruh port yang terhubung.',
    example:
        'Hub dapat digunakan untuk menghubungkan beberapa komputer dalam jaringan sederhana.',
    icon: Icons.device_hub,
  ),

  Term(
    name: 'Access Point',
    abbreviation: 'AP',
    category: 'Perangkat Jaringan',
    definition:
        'Perangkat yang memungkinkan perangkat seperti laptop dan smartphone terhubung ke jaringan melalui Wi-Fi.',
    explanation:
        'Access Point menyediakan akses jaringan nirkabel sehingga perangkat dapat terhubung tanpa menggunakan kabel jaringan langsung.',
    example:
        'Access Point digunakan untuk menyediakan koneksi Wi-Fi di ruang kelas.',
    icon: Icons.wifi,
  ),

  Term(
    name: 'Modem',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition:
        'Perangkat yang digunakan untuk menghubungkan perangkat atau jaringan dengan layanan internet.',
    explanation:
        'Modem melakukan proses komunikasi antara perangkat pengguna dengan media atau layanan komunikasi yang digunakan.',
    example:
        'Modem dapat digunakan untuk menyediakan koneksi internet pada jaringan rumah.',
    icon: Icons.settings_input_antenna,
  ),

  Term(
    name: 'Repeater',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition:
        'Perangkat yang menerima dan meneruskan kembali sinyal jaringan agar jangkauannya menjadi lebih luas.',
    explanation:
        'Repeater membantu memperluas jangkauan sinyal ketika jarak antara perangkat terlalu jauh.',
    example:
        'Repeater dapat dipasang di area sekolah yang sinyal Wi-Fi-nya lemah.',
    icon: Icons.repeat,
  ),

  Term(
    name: 'NIC',
    abbreviation: 'Network Interface Card',
    category: 'Perangkat Jaringan',
    definition:
        'Komponen yang memungkinkan komputer terhubung ke jaringan.',
    explanation:
        'NIC menyediakan antarmuka jaringan pada komputer, baik menggunakan koneksi kabel maupun nirkabel.',
    example:
        'Komputer desktop dapat menggunakan LAN Card sebagai NIC untuk terhubung ke switch.',
    icon: Icons.computer,
  ),

  Term(
    name: 'Bridge',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition:
        'Perangkat yang digunakan untuk menghubungkan atau membagi jaringan berdasarkan segmen tertentu.',
    explanation:
        'Bridge bekerja dengan meneruskan data antarsegmen jaringan sesuai informasi alamat perangkat.',
    example:
        'Bridge dapat digunakan untuk menghubungkan dua segmen jaringan lokal.',
    icon: Icons.account_tree_outlined,
  ),

  // ----------------------------------------------------------
  // ALAMAT JARINGAN
  // ----------------------------------------------------------

  Term(
    name: 'IP Address',
    abbreviation: 'Internet Protocol Address',
    category: 'Alamat Jaringan',
    definition:
        'Alamat yang digunakan untuk mengidentifikasi perangkat dalam suatu jaringan.',
    explanation:
        'IP Address membantu perangkat dikenali dan berkomunikasi dengan perangkat lain pada jaringan.',
    example:
        'Contoh alamat IPv4 adalah 192.168.1.10.',
    icon: Icons.location_on,
  ),

  Term(
    name: 'IPv4',
    abbreviation: 'Internet Protocol version 4',
    category: 'Alamat Jaringan',
    definition:
        'Versi protokol IP yang menggunakan alamat sepanjang 32 bit.',
    explanation:
        'IPv4 biasanya ditulis dalam empat bagian angka desimal yang dipisahkan dengan tanda titik.',
    example:
        '192.168.1.10 merupakan salah satu contoh penulisan alamat IPv4.',
    icon: Icons.pin_outlined,
  ),

  Term(
    name: 'IPv6',
    abbreviation: 'Internet Protocol version 6',
    category: 'Alamat Jaringan',
    definition:
        'Versi protokol IP yang menggunakan alamat sepanjang 128 bit.',
    explanation:
        'IPv6 dikembangkan untuk menyediakan jumlah alamat yang jauh lebih banyak dibandingkan IPv4.',
    example:
        'IPv6 menggunakan penulisan dalam bentuk bilangan heksadesimal.',
    icon: Icons.language,
  ),

  Term(
    name: 'MAC Address',
    abbreviation: 'Media Access Control Address',
    category: 'Alamat Jaringan',
    definition:
        'Alamat yang digunakan untuk mengidentifikasi antarmuka jaringan pada perangkat.',
    explanation:
        'MAC Address berkaitan dengan antarmuka jaringan perangkat dan digunakan dalam komunikasi pada jaringan lokal.',
    example:
        'Kartu jaringan pada komputer memiliki MAC Address yang berbeda dengan perangkat lainnya.',
    icon: Icons.fingerprint,
  ),

  Term(
    name: 'Subnet Mask',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition:
        'Nilai yang digunakan untuk menentukan bagian network dan host pada alamat IPv4.',
    explanation:
        'Subnet Mask membantu menentukan apakah sebuah alamat berada pada jaringan yang sama atau berbeda.',
    example:
        '255.255.255.0 merupakan salah satu contoh subnet mask IPv4.',
    icon: Icons.grid_3x3,
  ),

  Term(
    name: 'Default Gateway',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition:
        'Alamat perangkat yang menjadi jalur keluar dari jaringan lokal menuju jaringan lain.',
    explanation:
        'Gateway biasanya digunakan ketika perangkat ingin berkomunikasi dengan jaringan di luar jaringan lokalnya.',
    example:
        'Komputer dalam jaringan lokal dapat menggunakan alamat router sebagai default gateway.',
    icon: Icons.exit_to_app,
  ),

  Term(
    name: 'Network Address',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition:
        'Alamat yang digunakan untuk menunjukkan suatu jaringan dan bukan perangkat tertentu.',
    explanation:
        'Network Address digunakan sebagai identitas sebuah jaringan dalam pengalamatan IPv4.',
    example:
        'Pada jaringan tertentu, alamat awal dapat digunakan sebagai network address.',
    icon: Icons.account_tree,
  ),

  Term(
    name: 'Broadcast Address',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition:
        'Alamat yang digunakan untuk mengirim data kepada seluruh perangkat dalam suatu jaringan tertentu.',
    explanation:
        'Broadcast memungkinkan sebuah paket dikirim secara bersamaan kepada perangkat yang berada dalam jaringan yang sama.',
    example:
        'Broadcast dapat digunakan ketika sebuah perangkat perlu mengirim informasi kepada semua host dalam jaringan.',
    icon: Icons.campaign_outlined,
  ),

  // ----------------------------------------------------------
  // LAYANAN JARINGAN
  // ----------------------------------------------------------

  Term(
    name: 'DHCP',
    abbreviation: 'Dynamic Host Configuration Protocol',
    category: 'Layanan Jaringan',
    definition:
        'Layanan jaringan yang memberikan konfigurasi jaringan seperti IP Address secara otomatis kepada perangkat.',
    explanation:
        'DHCP membantu administrator jaringan karena perangkat tidak perlu dikonfigurasi alamat IP secara manual satu per satu.',
    example:
        'Ketika laptop terhubung ke Wi-Fi sekolah, DHCP dapat memberikan IP Address secara otomatis.',
    icon: Icons.settings_ethernet,
  ),

  Term(
    name: 'DNS',
    abbreviation: 'Domain Name System',
    category: 'Layanan Jaringan',
    definition:
        'Layanan yang menerjemahkan nama domain menjadi alamat IP.',
    explanation:
        'DNS membantu pengguna mengakses layanan internet menggunakan nama yang lebih mudah diingat dibandingkan alamat IP.',
    example:
        'DNS membantu menerjemahkan nama domain menjadi alamat IP server yang dituju.',
    icon: Icons.dns_outlined,
  ),

  Term(
    name: 'HTTP',
    abbreviation: 'Hypertext Transfer Protocol',
    category: 'Layanan Jaringan',
    definition:
        'Protokol yang digunakan untuk pertukaran data antara web browser dan web server.',
    explanation:
        'HTTP digunakan dalam komunikasi antara client dan server ketika mengakses sumber daya pada layanan web.',
    example:
        'Browser menggunakan HTTP ketika melakukan komunikasi dengan web server yang menggunakan protokol tersebut.',
    icon: Icons.http,
  ),

  Term(
    name: 'HTTPS',
    abbreviation: 'Hypertext Transfer Protocol Secure',
    category: 'Layanan Jaringan',
    definition:
        'Protokol komunikasi web yang menggunakan mekanisme keamanan untuk melindungi komunikasi data.',
    explanation:
        'HTTPS digunakan untuk membantu menjaga keamanan komunikasi antara browser dan server.',
    example:
        'Website yang menggunakan HTTPS biasanya ditampilkan dengan simbol gembok pada browser.',
    icon: Icons.lock_outline,
  ),

  Term(
    name: 'FTP',
    abbreviation: 'File Transfer Protocol',
    category: 'Layanan Jaringan',
    definition:
        'Protokol yang digunakan untuk melakukan transfer file melalui jaringan.',
    explanation:
        'FTP dapat digunakan untuk mengirim atau mengambil file antara komputer client dan server.',
    example:
        'FTP dapat digunakan untuk memindahkan file dari komputer ke server.',
    icon: Icons.folder_open,
  ),

  Term(
    name: 'Web Server',
    abbreviation: '',
    category: 'Layanan Jaringan',
    definition:
        'Server yang menyediakan halaman atau sumber daya web kepada client.',
    explanation:
        'Web server menerima permintaan dari client kemudian memberikan sumber daya web yang diminta.',
    example:
        'Web server digunakan untuk menyediakan halaman website yang dibuka melalui browser.',
    icon: Icons.web,
  ),

  Term(
    name: 'Proxy Server',
    abbreviation: '',
    category: 'Layanan Jaringan',
    definition:
        'Server perantara yang meneruskan permintaan client ke server tujuan.',
    explanation:
        'Proxy berada di antara client dan server tujuan dan dapat digunakan dalam pengelolaan akses jaringan.',
    example:
        'Proxy server dapat digunakan untuk mengatur akses pengguna terhadap sumber daya tertentu.',
    icon: Icons.swap_horiz,
  ),

  Term(
    name: 'VPN',
    abbreviation: 'Virtual Private Network',
    category: 'Layanan Jaringan',
    definition:
        'Teknologi yang membuat koneksi jaringan melalui jalur yang diamankan antara perangkat dan jaringan tujuan.',
    explanation:
        'VPN dapat digunakan untuk membuat koneksi virtual melalui jaringan yang tersedia.',
    example:
        'VPN dapat digunakan untuk menghubungkan pengguna dengan jaringan tertentu melalui koneksi internet.',
    icon: Icons.shield_outlined,
  ),
];

// ============================================================
// DATA SOAL LATIHAN
// ============================================================

const List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: 'Perangkat yang digunakan untuk menghubungkan beberapa jaringan adalah...',
    options: ['Switch', 'Router', 'Hub', 'Repeater'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Alamat yang digunakan untuk mengidentifikasi perangkat dalam jaringan disebut...',
    options: ['IP Address', 'DNS', 'HTTP', 'FTP'],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: 'Perangkat yang menghubungkan beberapa komputer dalam jaringan lokal adalah...',
    options: ['Router', 'Switch', 'Modem', 'DNS'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Layanan yang memberikan IP Address secara otomatis adalah...',
    options: ['DNS', 'HTTP', 'DHCP', 'FTP'],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: 'Layanan yang menerjemahkan nama domain menjadi alamat IP adalah...',
    options: ['DHCP', 'DNS', 'VPN', 'FTP'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Protokol yang digunakan untuk transfer file adalah...',
    options: ['FTP', 'HTTP', 'DNS', 'DHCP'],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: 'Alamat perangkat pada antarmuka jaringan disebut...',
    options: ['DNS', 'MAC Address', 'Gateway', 'HTTP'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Teknologi yang digunakan untuk membuat koneksi jaringan virtual adalah...',
    options: ['VPN', 'Hub', 'Switch', 'NIC'],
    correctAnswer: 0,
  ),
];

// ============================================================
// WELCOME SCREEN
// ============================================================

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEAF0FF),
              Color(0xFFF9FAFD),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const Spacer(),

                // Logo
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3155D9).withOpacity(.18),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.hub,
                    size: 62,
                    color: Color(0xFF3155D9),
                  ),
                ),

                const SizedBox(height: 26),

                const Text(
                  'NetPedia',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Kamus Interaktif Istilah\nJaringan Komputer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF5D6472),
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9EEFF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Untuk Siswa SMK TJKT',
                    style: TextStyle(
                      color: Color(0xFF3155D9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 55),

                // Ilustrasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _welcomeDevice(Icons.router_outlined),
                    Container(
                      width: 65,
                      height: 3,
                      color: const Color(0xFF3155D9),
                    ),
                    _welcomeDevice(Icons.laptop_mac_outlined),
                  ],
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainScreen(),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3155D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MULAI BELAJAR',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Belajar istilah jaringan jadi lebih mudah 🚀',
                  style: TextStyle(
                    color: Color(0xFF777E8B),
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _welcomeDevice(IconData icon) {
    return Container(
      width: 82,
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFDDE3F2),
        ),
      ),
      child: Icon(
        icon,
        size: 45,
        color: const Color(0xFF3155D9),
      ),
    );
  }
}

// ============================================================
// MAIN SCREEN
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final Set<String> favorites = {};
  final Set<String> studiedTerms = {};

  int bestQuizScore = 0;
  int totalQuiz = 0;

  void toggleFavorite(String termName) {
    setState(() {
      if (favorites.contains(termName)) {
        favorites.remove(termName);
      } else {
        favorites.add(termName);
      }
    });
  }

  void markStudied(String termName) {
    if (!studiedTerms.contains(termName)) {
      setState(() {
        studiedTerms.add(termName);
      });
    }
  }

  void updateQuizResult(int score) {
    setState(() {
      totalQuiz++;
      if (score > bestQuizScore) {
        bestQuizScore = score;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardPage(
        favorites: favorites,
        studiedTerms: studiedTerms,
        onFavorite: toggleFavorite,
        onStudied: markStudied,
        onOpenCategory: (category) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CategoryTermsPage(
                category: category,
                favorites: favorites,
                onFavorite: toggleFavorite,
                onStudied: markStudied,
              ),
            ),
          );
        },
        onOpenQuiz: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuizPage(
                onFinished: updateQuizResult,
              ),
            ),
          );
        },
      ),
      FavoritesPage(
        favorites: favorites,
        onFavorite: toggleFavorite,
        onStudied: markStudied,
      ),
      ProgressPage(
        studiedCount: studiedTerms.length,
        favoriteCount: favorites.length,
        bestQuizScore: bestQuizScore,
        totalQuiz: totalQuiz,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE4EAFF),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardPage extends StatelessWidget {
  final Set<String> favorites;
  final Set<String> studiedTerms;
  final Function(String) onFavorite;
  final Function(String) onStudied;
  final Function(String) onOpenCategory;
  final VoidCallback onOpenQuiz;

  const DashboardPage({
    super.key,
    required this.favorites,
    required this.studiedTerms,
    required this.onFavorite,
    required this.onStudied,
    required this.onOpenCategory,
    required this.onOpenQuiz,
  });

  @override
  Widget build(BuildContext context) {
    final progress = studiedTerms.length / terms.length;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EDFF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.hub,
                      color: Color(0xFF3155D9),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NetPedia',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Belajar TJKT lebih seru',
                          style: TextStyle(
                            color: Color(0xFF737A89),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),
            ),
          ),

          // Greeting
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3155D9),
                      Color(0xFF5272E8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Halo, Siswa TJKT! 👋',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Siap belajar istilah jaringan hari ini?',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.16),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${studiedTerms.length} istilah sudah dipelajari',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                      size: 72,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Search
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            sliver: SliverToBoxAdapter(
              child: InkWell(
                borderRadius: BorderRadius.circular(17),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchPage(
                        favorites: favorites,
                        onFavorite: onFavorite,
                        onStudied: onStudied,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: const Color(0xFFDDE2EC),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: Color(0xFF687083),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Cari istilah...',
                        style: TextStyle(
                          color: Color(0xFF8A91A0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Categories
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Kategori',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoriesPage(
                            favorites: favorites,
                            onFavorite: onFavorite,
                            onStudied: onStudied,
                          ),
                        ),
                      );
                    },
                    child: const Text('Lihat Semua'),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => onOpenCategory(category.name),
                      child: Container(
                        width: 145,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFE2E6EF),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: category.color.withOpacity(.12),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Icon(
                                category.icon,
                                color: category.color,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              category.name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '${terms.where((t) => t.category == category.name).length} istilah',
                              style: TextStyle(
                                fontSize: 11,
                                color: category.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Learning cards
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Belajar & Latihan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: _DashboardActionCard(
                      title: 'Latihan',
                      subtitle: 'Uji pemahamanmu',
                      icon: Icons.quiz_outlined,
                      color: const Color(0xFFFF8A4C),
                      buttonText: 'Mulai Latihan',
                      onTap: onOpenQuiz,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ProgressCard(progress: progress),
                  ),
                ],
              ),
            ),
          ),

          // Favorite
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Favorit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  if (favorites.isNotEmpty)
                    Text(
                      '${favorites.length} istilah',
                      style: const TextStyle(
                        color: Color(0xFF3155D9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            sliver: SliverToBoxAdapter(
              child: favorites.isEmpty
                  ? _EmptyFavoriteCard()
                  : Column(
                      children: favorites.take(3).map((name) {
                        final term = terms.firstWhere(
                          (t) => t.name == name,
                        );

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TermTile(
                            term: term,
                            isFavorite: true,
                            onFavorite: () => onFavorite(term.name),
                            onTap: () {
                              onStudied(term.name);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TermDetailPage(
                                    term: term,
                                    isFavorite:
                                        favorites.contains(term.name),
                                    onFavorite: () =>
                                        onFavorite(term.name),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DASHBOARD WIDGETS
// ============================================================

class _DashboardActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DashboardActionCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E6EF),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF737A89),
              fontSize: 11,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color.withOpacity(.5)),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final double progress;

  const _ProgressCard({
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (progress * 100).round();

    return Container(
      height: 175,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E6EF),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Progress Belajar',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              width: 68,
              height: 68,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 7,
                    backgroundColor: const Color(0xFFE8EBF1),
                    color: const Color(0xFF3155D9),
                  ),
                  Text(
                    '$percentage%',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              '${(progress * terms.length).round()} / ${terms.length} istilah',
              style: const TextStyle(
                color: Color(0xFF737A89),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyFavoriteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E6EF),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.bookmark_border,
            size: 32,
            color: Color(0xFF8A91A0),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              'Belum ada istilah favorit.\nSimpan istilah penting untuk dipelajari kembali.',
              style: TextStyle(
                color: Color(0xFF737A89),
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY PAGE
// ============================================================

class CategoriesPage extends StatelessWidget {
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const CategoriesPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 5),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kategori Materi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 22),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Pilih materi yang ingin kamu pelajari.',
                style: TextStyle(
                  color: Color(0xFF737A89),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = categories[index];
                  final categoryTerms = terms
                      .where((t) => t.category == category.name)
                      .toList();

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryTermsPage(
                              category: category.name,
                              favorites: favorites,
                              onFavorite: onFavorite,
                              onStudied: onStudied,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: const Color(0xFFE1E5EE),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                color: category.color.withOpacity(.12),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                category.icon,
                                size: 31,
                                color: category.color,
                              ),
                            ),
                            const SizedBox(width: 17),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category.name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    category.description,
                                    style: const TextStyle(
                                      color: Color(0xFF737A89),
                                      fontSize: 12,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 9),
                                  Text(
                                    '${categoryTerms.length} materi istilah',
                                    style: TextStyle(
                                      color: category.color,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 17,
                              color: Color(0xFF8A91A0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY TERMS PAGE
// ============================================================

class CategoryTermsPage extends StatelessWidget {
  final String category;
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const CategoryTermsPage({
    super.key,
    required this.category,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  Widget build(BuildContext context) {
    final categoryData = categories.firstWhere(
      (c) => c.name == category,
    );

    final categoryTerms =
        terms.where((t) => t.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: categoryData.color.withOpacity(.10),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: categoryData.color.withOpacity(.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    categoryData.icon,
                    color: categoryData.color,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    categoryData.description,
                    style: TextStyle(
                      color: categoryData.color,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Text(
            'Materi ${category}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            '${categoryTerms.length} istilah tersedia untuk dipelajari.',
            style: const TextStyle(
              color: Color(0xFF737A89),
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 15),

          ...categoryTerms.map(
            (term) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TermTile(
                term: term,
                isFavorite: favorites.contains(term.name),
                onFavorite: () => onFavorite(term.name),
                onTap: () {
                  onStudied(term.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TermDetailPage(
                        term: term,
                        isFavorite: favorites.contains(term.name),
                        onFavorite: () => onFavorite(term.name),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TERM TILE
// ============================================================

class TermTile extends StatelessWidget {
  final Term term;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  const TermTile({
    super.key,
    required this.term,
    required this.isFavorite,
    required this.onFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFE2E6EF),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF0FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.network_check,
                color: Color(0xFF3155D9),
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    term.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (term.abbreviation.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      term.abbreviation,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF737A89),
                      ),
                    ),
                  ],
                  const SizedBox(height: 5),
                  Text(
                    term.definition,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      height: 1.4,
                      color: Color(0xFF737A89),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onFavorite,
              icon: Icon(
                isFavorite
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: isFavorite
                    ? const Color(0xFF3155D9)
                    : const Color(0xFF8A91A0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DETAIL ISTILAH
// ============================================================

class TermDetailPage extends StatefulWidget {
  final Term term;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const TermDetailPage({
    super.key,
    required this.term,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  State<TermDetailPage> createState() => _TermDetailPageState();
}

class _TermDetailPageState extends State<TermDetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void favorite() {
    widget.onFavorite();
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = categories.firstWhere(
      (c) => c.name == widget.term.category,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Istilah'),
        actions: [
          IconButton(
            onPressed: favorite,
            icon: Icon(
              isFavorite
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: isFavorite
                  ? const Color(0xFF3155D9)
                  : const Color(0xFF555D6D),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 35),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  category.color,
                  category.color.withOpacity(.75),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.term.icon,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.term.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (widget.term.abbreviation.isNotEmpty) ...[
                  const SizedBox(height: 7),
                  Text(
                    widget.term.abbreviation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 22),

          _DetailSection(
            icon: Icons.lightbulb_outline_rounded,
            title: 'Pengertian',
            child: Text(
              widget.term.definition,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Color(0xFF555D6D),
              ),
            ),
          ),

          const SizedBox(height: 15),

          _DetailSection(
            icon: Icons.menu_book_rounded,
            title: 'Penjelasan',
            child: Text(
              widget.term.explanation,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Color(0xFF555D6D),
              ),
            ),
          ),

          const SizedBox(height: 15),

          _DetailSection(
            icon: Icons.school_outlined,
            title: 'Contoh Penggunaan',
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                widget.term.example,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Color(0xFF46516A),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: favorite,
            icon: Icon(
              isFavorite
                  ? Icons.bookmark_remove_outlined
                  : Icons.bookmark_add_outlined,
            ),
            label: Text(
              isFavorite
                  ? 'Hapus dari Favorit'
                  : 'Simpan ke Favorit',
            ),
            style: FilledButton.styleFrom(
              backgroundColor: category.color,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _DetailSection({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E6EF),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF3155D9),
                size: 21,
              ),
              const SizedBox(width: 9),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          child,
        ],
      ),
    );
  }
}

// ============================================================
// SEARCH PAGE
// ============================================================

class SearchPage extends StatefulWidget {
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const SearchPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final results = terms.where((term) {
      final q = query.toLowerCase();

      return term.name.toLowerCase().contains(q) ||
          term.abbreviation.toLowerCase().contains(q) ||
          term.category.toLowerCase().contains(q) ||
          term.definition.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cari Istilah',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Ketik istilah jaringan...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: query.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            query = '';
                          });
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: const BorderSide(
                    color: Color(0xFFE0E4EC),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: const BorderSide(
                    color: Color(0xFFE0E4EC),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: results.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 60,
                          color: Color(0xFF9BA2AF),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Istilah tidak ditemukan',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Coba gunakan kata kunci lain.',
                          style: TextStyle(
                            color: Color(0xFF737A89),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final term = results[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TermTile(
                          term: term,
                          isFavorite:
                              widget.favorites.contains(term.name),
                          onFavorite: () {
                            widget.onFavorite(term.name);
                            setState(() {});
                          },
                          onTap: () {
                            widget.onStudied(term.name);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TermDetailPage(
                                  term: term,
                                  isFavorite: widget.favorites
                                      .contains(term.name),
                                  onFavorite: () {
                                    widget.onFavorite(term.name);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FAVORITES PAGE
// ============================================================

class FavoritesPage extends StatelessWidget {
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteTerms = terms
        .where((term) => favorites.contains(term.name))
        .toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 4),
            child: Text(
              'Favorit',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              'Istilah yang kamu simpan untuk dipelajari kembali.',
              style: TextStyle(
                color: Color(0xFF737A89),
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: favoriteTerms.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border_rounded,
                          size: 70,
                          color: Color(0xFF9BA2AF),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Belum ada Favorit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Simpan istilah penting agar mudah\nkamu pelajari kembali.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF737A89),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    itemCount: favoriteTerms.length,
                    itemBuilder: (context, index) {
                      final term = favoriteTerms[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TermTile(
                          term: term,
                          isFavorite: true,
                          onFavorite: () => onFavorite(term.name),
                          onTap: () {
                            onStudied(term.name);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TermDetailPage(
                                  term: term,
                                  isFavorite: true,
                                  onFavorite: () =>
                                      onFavorite(term.name),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROGRESS PAGE
// ============================================================

class ProgressPage extends StatelessWidget {
  final int studiedCount;
  final int favoriteCount;
  final int bestQuizScore;
  final int totalQuiz;

  const ProgressPage({
    super.key,
    required this.studiedCount,
    required this.favoriteCount,
    required this.bestQuizScore,
    required this.totalQuiz,
  });

  @override
  Widget build(BuildContext context) {
    final progress = studiedCount / terms.length;
    final percentage = (progress * 100).round();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
        children: [
          const Text(
            'Progress Belajar',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Pantau perkembangan belajarmu di NetPedia.',
            style: TextStyle(
              color: Color(0xFF737A89),
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF3155D9),
                  Color(0xFF607BE8),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Text(
                  'Total Progress',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 140,
                  height: 140,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 12,
                        backgroundColor: Colors.white24,
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$percentage%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Text(
                            'selesai',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  '$studiedCount dari ${terms.length} istilah telah dipelajari',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.menu_book_rounded,
                  value: '$studiedCount',
                  label: 'Dipahami',
                  color: const Color(0xFF3155D9),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Icons.bookmark_rounded,
                  value: '$favoriteCount',
                  label: 'Favorit',
                  color: const Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.quiz_rounded,
                  value: '$totalQuiz',
                  label: 'Latihan',
                  color: const Color(0xFFFF8A4C),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Icons.emoji_events_rounded,
                  value: '$bestQuizScore',
                  label: 'Skor Terbaik',
                  color: const Color(0xFF0EA5A4),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            'Kategori yang Tersedia',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 12),

          ...categories.map((category) {
            final categoryTerms = terms
                .where((term) => term.category == category.name)
                .toList();

            final studiedInCategory = categoryTerms
                .where((term) => _containsStudied(term.name))
                .length;

            final categoryProgress =
                studiedInCategory / categoryTerms.length;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _CategoryProgress(
                category: category,
                progress: categoryProgress,
                studied: studiedInCategory,
                total: categoryTerms.length,
              ),
            );
          }),
        ],
      ),
    );
  }

  bool _containsStudied(String name) {
    // Progress kategori akan ditampilkan berdasarkan
    // progress umum pada versi single-file ini.
    return false;
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE2E6EF),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 25,
          ),
          const SizedBox(height: 13),
          Text(
            value,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF737A89),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryProgress extends StatelessWidget {
  final Category category;
  final double progress;
  final int studied;
  final int total;

  const _CategoryProgress({
    required this.category,
    required this.progress,
    required this.studied,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E6EF),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                category.icon,
                color: category.color,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  color: category.color,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: const Color(0xFFE8EBF1),
            color: category.color,
          ),
          const SizedBox(height: 7),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$studied dari $total istilah',
              style: const TextStyle(
                color: Color(0xFF737A89),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUIZ PAGE
// ============================================================

class QuizPage extends StatefulWidget {
  final Function(int) onFinished;

  const QuizPage({
    super.key,
    required this.onFinished,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int? selectedAnswer;
  int correctCount = 0;

  void selectAnswer(int index) {
    setState(() {
      selectedAnswer = index;
    });
  }

  void nextQuestion() {
    if (selectedAnswer == null) return;

    if (selectedAnswer == quizQuestions[currentQuestion].correctAnswer) {
      correctCount++;
    }

    if (currentQuestion == quizQuestions.length - 1) {
      final score =
          ((correctCount / quizQuestions.length) * 100).round();

      widget.onFinished(score);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuizResultPage(
            score: score,
            correct: correctCount,
            total: quizQuestions.length,
          ),
        ),
      );
    } else {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[currentQuestion];
    final progress =
        (currentQuestion + 1) / quizQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Latihan NetPedia',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFE3E7EF),
                    color: const Color(0xFF3155D9),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${currentQuestion + 1}/${quizQuestions.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF3155D9),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0FF),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.quiz_rounded,
                  color: Color(0xFF3155D9),
                  size: 28,
                ),
                SizedBox(width: 12),
                Text(
                  'Uji Pemahamanmu!',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3155D9),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Text(
            question.question,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 25),

          ...List.generate(
            question.options.length,
            (index) {
              final selected = selectedAnswer == index;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => selectAnswer(index),
                  borderRadius: BorderRadius.circular(17),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFFE7ECFF)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(
                        color: selected
                            ? const Color(0xFF3155D9)
                            : const Color(0xFFE0E4EC),
                        width: selected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected
                                ? const Color(0xFF3155D9)
                                : const Color(0xFFF0F2F6),
                          ),
                          child: Text(
                            String.fromCharCode(65 + index),
                            style: TextStyle(
                              color: selected
                                  ? Colors.white
                                  : const Color(0xFF626A79),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            question.options[index],
                            style: TextStyle(
                              fontWeight: selected
                                  ? FontWeight.w800
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                        if (selected)
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFF3155D9),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 54,
            child: FilledButton(
              onPressed:
                  selectedAnswer == null ? null : nextQuestion,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF3155D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Text(
                currentQuestion == quizQuestions.length - 1
                    ? 'SELESAI'
                    : 'SOAL BERIKUTNYA',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUIZ RESULT
// ============================================================

class QuizResultPage extends StatelessWidget {
  final int score;
  final int correct;
  final int total;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.correct,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    String message;

    if (score >= 80) {
      message = 'Hebat! Pemahamanmu sudah bagus 🚀';
    } else if (score >= 60) {
      message = 'Bagus! Tingkatkan lagi pemahamanmu 💪';
    } else {
      message = 'Jangan menyerah! Yuk pelajari lagi 📚';
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 105,
                  height: 105,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEAF0FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    score >= 70
                        ? Icons.emoji_events_rounded
                        : Icons.menu_book_rounded,
                    size: 55,
                    color: const Color(0xFF3155D9),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Latihan Selesai!',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF737A89),
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xFFE1E5EE),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'SKOR KAMU',
                        style: TextStyle(
                          color: Color(0xFF737A89),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$score',
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF3155D9),
                        ),
                      ),
                      const Text(
                        'dari 100',
                        style: TextStyle(
                          color: Color(0xFF737A89),
                        ),
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          _ResultStat(
                            value: '$correct',
                            label: 'Benar',
                            icon: Icons.check_circle_outline,
                          ),
                          _ResultStat(
                            value: '${total - correct}',
                            label: 'Salah',
                            icon: Icons.cancel_outlined,
                          ),
                          _ResultStat(
                            value: '$total',
                            label: 'Soal',
                            icon: Icons.quiz_outlined,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 53,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3155D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: const Text(
                      'KEMBALI KE NETPEDIA',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizPage(
                          onFinished: (_) {},
                        ),
                      ),
                    );
                  },
                  child: const Text('Coba Latihan Lagi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultStat extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _ResultStat({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF3155D9),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF737A89),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}