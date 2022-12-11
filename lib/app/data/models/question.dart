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
    "question": "Saya mengetahui betul apa yang saya sukai dan tidak disukai ",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Saya tahu apa kelebihan saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Saya mengetahui apa yang saya butuhkan",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Saya dapat mengekspresikan perasaan dengan tepat",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Saya dapat memotivasi diri sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Saya dapat memfokuskan diri menjadi lebih baik",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Saya bisa mengontrol emosi dengan cara saya sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question":
        "Ketika mempunyai masalah, saya akan berusaha untuk tenang dalam menghadapi masalah tersebut",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 9,
    "question":
        "Saya mampu menerima segala resiko atas keputusan yang saya ambil",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "Saya mengerti sifat diri saya sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "Saya mampu membuat keputusan sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 12,
    "question":
        "Saya mampu bertindak sesuai keinginan saya tanpa harus diarahkan oleh orang lain",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 13,
    "question":
        "Saya dapat merencanakan segala sesuatu dengan matang tanpa bantuan orang lain",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 14,
    "question":
        "Saya tidak memaksakan sesuatu  ketika sudah diluar batas kemampuan saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 15,
    "question": "Saya menerima kekurangan pada diri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 16,
    "question": "Saya bersyukur atas kelebihan yang saya miliki ",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 17,
    "question": "Saya mencari cara untuk menanggulangi kekurangan saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 18,
    "question": "Saya mengakui kesalahan diri sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 19,
    "question": "Saya merasa senang dengan penampilan saya selama ini",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 20,
    "question": "Saya tidak minder dengan diri saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 21,
    "question":
        "Saya tidak mempedulikan orang yang membicarakan kekurangan saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 22,
    "question": "Saya tidak mau merendahkan diri saya sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 23,
    "question": "Saya bahagia dengan segala sesuatu yang saya miliki",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 24,
    "question":
        "Saya fokus untuk mengembangkan kelebihan atau potensi diri saya ",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 25,
    "question": "Saya puas menjadi diri saya sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 26,
    "question": "Saya percaya dengan diri saya sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 27,
    "question": "Saya terus memperbaiki diri kearah yang lebih baik lagi",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 28,
    "question": "Saya berlatih untuk mengoptimalkan kemampuan yang saya miliki",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 29,
    "question": "Saya tidak peduli dengan omongan orang lain",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 30,
    "question": "Saya makan dengan teratur",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 31,
    "question": "Saya istirahat 8-9 jam sehari",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 32,
    "question": "saya makan makanan 4 sehat 5 sempurna",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 33,
    "question": "Saya berpenampilan rapi dan wangi ",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 34,
    "question": "Saya dapat menenangkan diri ketika merasa cemas atau gelisah",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 35,
    "question": "Saya menghibur diri sendiri ketika stress",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 36,
    "question": "Saya minum obat saat sakit ",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 37,
    "question": "Saya melakukan apa yang membuat saya bahagia",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 38,
    "question": "Saya membeli apa pun yang membuat saya senang",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 39,
    "question": "Saya senang ketika bermain dengan teman-teman.",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 40,
    "question":
        "Saya memuji diri sendiri setelah berhasil melewati suatu masalah",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 41,
    "question": "Saya meluangkan waktu untuk diri sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 42,
    "question": "Saya menyemangati di sendiri di depan kaca",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 43,
    "question": "Saya bersikap jujur dengan diri sendiri",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 44,
    "question": "Saya menghiraukan orang yang menggosipkan saya",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 45,
    "question": "Saya mengucapkan kata-kata positif setiap pagi hari ",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 46,
    "question":
        "Saya mengucapkan kata-kata positif ketika akan melakukan suatu kegiatan. ",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 47,
    "question":
        "Saya selalu berpikir positif saat mengerjakan sesuatu atau menunggu suatu hasil.",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
];
