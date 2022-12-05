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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
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
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 48,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 49,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 50,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 51,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 52,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 53,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 54,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 55,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 56,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 57,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 58,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 59,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 60,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 61,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 62,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 63,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 64,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 65,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 66,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 67,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 68,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 69,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 70,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 71,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
  {
    "id": 72,
    "question": "_____",
    "options": [
      'Sangat Sesuai',
      'Sesuai',
      'Tidak Sesuai',
      'Sangat Tidak Sesuai'
    ],
    "answer_index": 1,
  },
];
