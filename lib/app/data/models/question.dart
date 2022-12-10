class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Saya bukan orang yang mudah tersinggung",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question":
        "Saya tidak akan bertindak sembarangan saat amarah saya sedang tinggi",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question":
        "Saya selalu memikirkan solusi dari suatu permasalahan dengan kepala dingin",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question":
        "Saya menghadapi situasi sulit dengan menganggapnya sebagai tantangan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Saya terbuka terhadap kritik maupun saran",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question":
        "Saya melampiaskan amarah saya dengan merusak barang-barang yang ada di sekitar saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Saya dapat mengatasi stress yang saya alami dengan baik",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "Saya sering mengalami kesulitan tidur",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 9,
    "question": "Saya sering tiba-tiba merasa cemas",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question":
        "Saya selalu menggunakan waktu luang untuk melakukan hal yang bermanfaat",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "Saya selalu konsisten dalam hal apapun",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 12,
    "question":
        "Saya selalu merancang kegiatan yang ingin saya lakukan serinci dan sebaik mungkin",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 13,
    "question":
        "Saya melakukan kegiatan sehari-hari sesuai dengan apa yang telah saya rencanakan sebelumnya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 14,
    "question": "Saya sering menunda pekerjaan yang kurang saya sukai",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 15,
    "question":
        "Saya sering beraktivitas dengan tergesa-gesa di pagi hari karena bangun kesianga",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 16,
    "question":
        "Saya tidak bisa membagi waktu antara sekolah dengan kegiatan lain",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 17,
    "question":
        "Saya selalu meluangkan waktu untuk keluarga dan teman-teman saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 18,
    "question": "Saya selalu bersikap ramah kepada siapa saja",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 19,
    "question": "Saya selalu menggunakan bahasa yang sopan dan santun",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 20,
    "question":
        "Saya tidak pernah berbicara kepada orang lain dengan nada yang tinggi",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 21,
    "question":
        "Saya sering mengatai orang lain dengan kata-kata kasar yang dapat melukai perasaan mereka",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 22,
    "question":
        "Saya selalu memberikan pendapat terbaik saya ketika orang lain memintanya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 23,
    "question": "Saya sering memberikan solusi untuk permasalahan orang lain",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 24,
    "question":
        "Saya merasa senang dan lebih nyaman jika memulai obrolan terlebih dahulu",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 25,
    "question": "Saya adalah orang yang sangat percaya diri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 26,
    "question":
        "Saya sering berfantasi yang tidak senonoh ketika melihat lawan jenis yang menurut saya menarik",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 27,
    "question":
        "Saya masih sering terbayang dan memikirkan pengalaman buruk yang terjadi di masa lalu",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 28,
    "question":
        "Saya terlalu memikirkan permasalahan yang terjadi di sekitar saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 29,
    "question":
        "Saya selalu berusaha untuk berpikir positif untuk hal-hal yang negatif sekalipun",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 30,
    "question":
        "Saya adalah tipe pemikir mendalam sehingga sering berlebihan dalam memikirkan masalah",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 31,
    "question": "Saya selalu memikirkan tentang masa depan saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 32,
    "question": "Saya mampu hidup dengan berhemat",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 33,
    "question": "Saya memiliki gengsi yang rendah",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 34,
    "question": "Saya tidak pernah mengeluarkan uang melebihi penghasilan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 35,
    "question":
        "Saya selalu membeli barang keluaran terbaru untuk memuaskan kepuasan pribadi tanpa memikirkan pengeluaran yang melebihi penghasilan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 36,
    "question":
        "Saya mampu mengelola pengeluaran dengan mempertimbangkan urgensi kebutuhan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 37,
    "question": "Saya selalu memperhitungkan jumlah pengeluaran bulanan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 38,
    "question": "Saya selalu bijak dalam menggunakan uang",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 39,
    "question":
        "Saya sering membeli barang-barang kekinian yang kurang saya perlukan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 40,
    "question":
        "Saya selalu membeli makanan yang memiliki tampilan menarik walaupun saya tidak menyukainya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 41,
    "question": "Saya sudah memiliki gambaran karir masa depan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 42,
    "question":
        "Saya hanya mau bekerja jika pekerjaan tersebut sesuai dengan hobi atau kegemaran saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 43,
    "question":
        "Saya selalu update hard skill untuk menunjang kesuksesan karir yang saya pilih",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 44,
    "question":
        "Saya memiliki segudang prestasi sehingga karir saya kedepannya terjamin",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 45,
    "question": "Saya gigih untuk mengejar karir impian saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 46,
    "question": "Saya adalah orang yang disiplin",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 47,
    "question": "Saya selalu bertanggung jawab dengan apa yang saya kerjakan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 48,
    "question":
        "Saya adalah orang yang selalu berfikir kritis dan logis dalam bekerja",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 49,
    "question": "Saya tidak pernah terlambat ketika melakukan suatu pekerjaan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 50,
    "question": "Saya adalah tipe orang yang pemilih dalam mencari pekerjaan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 51,
    "question": "Saya enggan untuk bekerja di bawah orang lain",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 52,
    "question": "Saya adalah orang yang perfeksionis",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 53,
    "question":
        "Saya tidak mudah mempercayakan suatu pekerjaan kepada orang lain",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 54,
    "question": "Saya paling menghindari penundaan pekerjaan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 55,
    "question": "Saya adalah seorang konseptor",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 56,
    "question":
        "Saya sangat menyukai pekerjaan yang melibatkan interaksi dengan orang banyak",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 57,
    "question": "Saya sudah mempersiapkan tabungan untuk kedepannya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 58,
    "question": "Saya membuat rencana keuangan setiap waktunya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 59,
    "question":
        "Saya menggunakan uang tabungan yang saya miliki untuk kepentingan yang mendesak",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 60,
    "question":
        "Saya sudah mempersiapkan tabungan tersendiri untuk investasi masa depan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 61,
    "question": "Saya sudah memiliki tabungan rumah",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 62,
    "question":
        "Saya sudah memikirkan dan menyisihkan uang untuk tabungan biaya hidup anak",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 63,
    "question":
        "Saya akan menjamin hidup anak saya makmur dalam finansial dengan mempersiapkan tabungan asuransi",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 64,
    "question":
        "Saya sering menggunakan tabungan anak untuk keperluan pribadi saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 65,
    "question": "Saya percaya akan tradisi-tradisi dalam adat",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 66,
    "question": "Saya menjunjung tinggi adat istiadat",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 67,
    "question": "Saya menerima pasangan dengan adat yang berbeda",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 68,
    "question":
        "Dalam aturan adat saya banyak hal yang perlu dipertimbangkan utnuk memilih calon pasangan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 69,
    "question": "Saya merasa pasangan saya tidak mempercayai tradisi adat saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 70,
    "question": "Saya percaya akan hal-hal yang berbau mistis dan pamali",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 71,
    "question": "Saya percaya dengan keberadaan Tuhan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 72,
    "question": "Saya beribadah sesuai dengan ajaran agama yang saya anut",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 73,
    "question": "Saya memiliki iman yang kuat",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 74,
    "question": "Saya selalu taat dalam beribadah",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 75,
    "question":
        "Saya enggan menerima pasangan yang berbeda keyakinan agama dengan saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 76,
    "question": "Saya menjalin hubungan dengan pasangan berdasarkan cinta",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 77,
    "question": "Kami saling mencintai tanpa memandang materi",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 78,
    "question":
        "Kami terpaksa untuk menjalin hubungan karena dorongan orang tua",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 79,
    "question": "Saya menilai pasangan saya tidak tulus kepada saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 80,
    "question": "Saya merasa tidak mendapatkan kasih sayang dari pasangan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Kurang Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
];
