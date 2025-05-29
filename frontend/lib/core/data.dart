import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/grade.dart';

class Data {
  static List<String> getGoals(Area area) => List<String>.from(
    (_data.firstWhere((e) => e['area'] == area.name)['goals'] as Map).entries
        .map((e) => e.key),
  );
  static List<String> getCompetencies(
    Area area, {
    String? goal,
    List<String> goals = const [],
  }) =>
      List<String>.from(
            (_data.firstWhere((e) => e['area'] == area.name)['competencies']
                    as Map)
                .entries
                .map((e) => e.key as String),
          )
          .where(
            (e) =>
                goal != null
                    ? e.startsWith('${goal.split('G-').join('-')}.')
                    : goals.isNotEmpty
                    ? goals
                        .map((g) => '${g.split('G-').join('-')}.')
                        .contains('${e.split('.').first}.')
                    : true,
          )
          .toList();

  static String getGoal(String v) =>
      _data
              .map((e) => (e['goals'] as Map).entries)
              .expand((e) => e)
              .where((e) => e.key == v)
              .firstOrNull
              ?.value
          as String? ??
      '';

  static String getCompetency(String v) =>
      _data
              .map((e) => (e['competencies'] as Map).entries)
              .expand((e) => e)
              .where((e) => e.key == v)
              .firstOrNull
              ?.value
          as String? ??
      '';

  static const tagMap = {
    "VA": "Visual Arts",
    "T": "Theatre",
    "MU": "Music",
    "DM": "Dance and Movement",
    "AE": "Visual and Performing Arts",
    "P1": "Learning Standard 1",
    "P2": "Learning Standard 2",
  };

  static const _data = [
    {
      "area": "physical",
      "goals": {
        "CG-1": "Develops habits that keep them healthy and safe.",
        "CG-2": "Develops sharpness in sensorial perceptions.",
        "CG-3": "Develops a fit and flexible body.",
      },
      "competencies": {
        "C-1.1":
            "Shows a liking for and understanding of nutritious food and does not waste food.",
        "C-1.2": "Practises basic self-care and hygiene.",
        "C-1.3": "Keeps school/classroom hygienic and organised.",
        "C-1.4": "Practises safe use of material and simple tools.",
        "C-1.5":
            "Shows awareness of safety in movements (e.g., walking, running, cycling, etc.) and acts appropriately.",
        "C-1.6": "Understands unsafe situations and asks for help.",
        "C-2.1": "Differentiates between shapes, colours, and their shades.",
        "C-2.2": "Develops visual memory for symbols and representations.",
        "C-2.3":
            "Differentiates sounds and sound patterns by their pitch, volume, and tempo.",
        "C-2.4": "Differentiates multiple smells and tastes.",
        "C-2.5": "Develops discrimination in the sense of touch.",
        "C-2.6":
            "Begins integrating sensorial perceptions to get a holistic awareness of their experiences.",
        "C-3.1":
            "Shows coordination between sensorial perceptions and body movements in various activities.",
        "C-3.2":
            "Shows balance, coordination, and flexibility in various physical activities.",
        "C-3.3":
            "Shows precision and control in working with hands and fingers.",
        "C-3.4":
            "Shows strength and endurance in carrying, walking, and running.",
      },
    },
    {
      "area": "socioEmotional",
      "goals": {
        "CG-1": "Develops habits that keep them healthy and safe.",
        "CG-2": "Develops sharpness in sensorial perceptions.",
        "CG-3": "Develops a fit and flexible body.",
        "CG-4":
            "Develops emotional intelligence, i.e., the ability to understand and manage their own emotions, and responds positively to social norms.",
        "CG-5":
            "Develops a positive attitude towards productive work and service or ‘Seva’.",
        "CG-6":
            "Develops a positive regard for the natural environment around them.",
      },
      "competencies": {
        "C-1.1":
            "Shows a liking for and understanding of nutritious food and does not waste food.",
        "C-1.2": "Practises basic self-care and hygiene.",
        "C-1.3": "Keeps school/classroom hygienic and organised.",
        "C-1.4": "Practises safe use of material and simple tools.",
        "C-1.5":
            "Shows awareness of safety in movements (e.g., walking, running, cycling, etc.) and acts appropriately.",
        "C-1.6": "Understands unsafe situations and asks for help.",
        "C-2.1": "Differentiates between shapes, colours, and their shades.",
        "C-2.2": "Develops visual memory for symbols and representations.",
        "C-2.3":
            "Differentiates sounds and sound patterns by their pitch, volume, and tempo.",
        "C-2.4": "Differentiates multiple smells and tastes.",
        "C-2.5": "Develops discrimination in the sense of touch.",
        "C-2.6":
            "Begins integrating sensorial perceptions to get a holistic awareness of their experiences.",
        "C-3.1":
            "Shows coordination between sensorial perceptions and body movements in various activities.",
        "C-3.2":
            "Shows balance, coordination, and flexibility in various physical activities.",
        "C-3.3":
            "Shows precision and control in working with hands and fingers.",
        "C-3.4":
            "Shows strength and endurance in carrying, walking, and running.",
        "C-4.1":
            "Starts recognising ‘self’ as an individual belonging to a family and community.",
        "C-4.2":
            "Recognises different emotions and makes deliberate efforts to regulate them appropriately.",
        "C-4.3": "Interacts comfortably with other children and adults.",
        "C-4.4": "Shows cooperative behaviour with other children.",
        "C-4.5":
            "Understands and responds positively to social norms in the classroom and school.",
        "C-4.6":
            "Shows kindness and helpfulness to others (including animals and plants) when they are in need.",
        "C-4.7":
            "Understands and responds positively to different thoughts, preferences, and emotional needs of other children.",
        "C-5.1": "Engages in age-appropriate work at school and/or at home.",
        "C-6.1": "Shows care for and joy in engaging with all life forms.",
      },
    },
    {
      "area": "cognitive",
      "goals": {
        "CG-1": "Develops habits that keep them healthy and safe.",
        "CG-2": "Develops sharpness in sensorial perceptions.",
        "CG-3": "Develops a fit and flexible body.",
        "CG-4":
            "Develops emotional intelligence, i.e., the ability to understand and manage their own emotions, and responds positively to social norms.",
        "CG-5":
            "Develops a positive attitude towards productive work and service or ‘Seva’.",
        "CG-6":
            "Develops a positive regard for the natural environment around them.",
        "CG-7":
            "Makes sense of the world around through observation and logical thinking.",
        "CG-8":
            "Develops mathematical understanding and abilities to recognise the world through quantities, shapes, and measures.",
      },
      "competencies": {
        "C-1.1":
            "Shows a liking for and understanding of nutritious food and does not waste food.",
        "C-1.2": "Practises basic self-care and hygiene.",
        "C-1.3": "Keeps school/classroom hygienic and organised.",
        "C-1.4": "Practises safe use of material and simple tools.",
        "C-1.5":
            "Shows awareness of safety in movements (e.g., walking, running, cycling, etc.) and acts appropriately.",
        "C-1.6": "Understands unsafe situations and asks for help.",
        "C-2.1": "Differentiates between shapes, colours, and their shades.",
        "C-2.2": "Develops visual memory for symbols and representations.",
        "C-2.3":
            "Differentiates sounds and sound patterns by their pitch, volume, and tempo.",
        "C-2.4": "Differentiates multiple smells and tastes.",
        "C-2.5": "Develops discrimination in the sense of touch.",
        "C-2.6":
            "Begins integrating sensorial perceptions to get a holistic awareness of their experiences.",
        "C-3.1":
            "Shows coordination between sensorial perceptions and body movements in various activities.",
        "C-3.2":
            "Shows balance, coordination, and flexibility in various physical activities.",
        "C-3.3":
            "Shows precision and control in working with hands and fingers.",
        "C-3.4":
            "Shows strength and endurance in carrying, walking, and running.",
        "C-4.1":
            "Starts recognising ‘self’ as an individual belonging to a family and community.",
        "C-4.2":
            "Recognises different emotions and makes deliberate efforts to regulate them appropriately.",
        "C-4.3": "Interacts comfortably with other children and adults.",
        "C-4.4": "Shows cooperative behaviour with other children.",
        "C-4.5":
            "Understands and responds positively to social norms in the classroom and school.",
        "C-4.6":
            "Shows kindness and helpfulness to others (including animals and plants) when they are in need.",
        "C-4.7":
            "Understands and responds positively to different thoughts, preferences, and emotional needs of other children.",
        "C-5.1": "Engages in age-appropriate work at school and/or at home.",
        "C-6.1": "Shows care for and joy in engaging with all life forms.",
        "C-7.1":
            "Observes and understands different categories of objects and the relationships between them.",
        "C-7.2":
            "Observes and understands cause and effect relationships in nature by forming simple hypotheses and uses observations to explain their hypotheses.",
        "C-7.3":
            "Uses appropriate tools and technology in daily life situations and for learning.",
        "C-8.1":
            "Sorts objects into groups and sub-groups based on more than one property.",
        "C-8.2":
            "Identifies and implements simple patterns in their surroundings, shapes, and numbers.",
        "C-8.3":
            "Counts up to 99 both forwards and backwards, and in groups of 5s, 10s, and 20s.",
        "C-8.4": "Arranges numbers up to 99 in ascending and descending order.",
        "C-8.5":
            "Recognises and uses numerals to represent quantities up to 99 with the understanding of the decimal place value system.",
        "C-8.6":
            "Performs addition and subtraction of 2-digit numbers fluently, using flexible strategies of composition and decomposition of both numerical and word problems.",
        "C-8.7":
            "Recognises multiplication as repeated addition and division as equal sharing.",
        "C-8.8":
            "Recognises, makes, and classifies basic geometric shapes, and their observable properties, and understands and explains the relative relation of objects in space.",
        "C-8.9":
            "Selects appropriate tools and units to perform simple measurements of length, weight, and volume of objects in their immediate environment.",
        "C-8.10":
            "Performs simple measurements of time in minutes, hours, days, weeks, and months.",
        "C-8.11": "Performs simple transactions using money up to INR 100.",
        "C-8.12":
            "Develops adequate and appropriate vocabulary for comprehending and expressing concepts and procedures related to quantities, shapes, space, and measurements.",
        "C-8.13":
            "Formulates and solves simple mathematical problems related to quantities, shapes, space, and measurements.",
        "C-8.14":
            "Feels confident and sees Mathematics as doable and worthwhile.",
      },
    },
    {
      "area": "language",
      "goals": {
        "CG-1": "Develops habits that keep them healthy and safe.",
        "CG-2": "Develops sharpness in sensorial perceptions.",
        "CG-3": "Develops a fit and flexible body.",
        "CG-4":
            "Develops emotional intelligence, i.e., the ability to understand and manage their own emotions, and responds positively to social norms.",
        "CG-5":
            "Develops a positive attitude towards productive work and service or ‘Seva’.",
        "CG-6":
            "Develops a positive regard for the natural environment around them.",
        "CG-7":
            "Makes sense of the world around through observation and logical thinking.",
        "CG-8":
            "Develops mathematical understanding and abilities to recognise the world through quantities, shapes, and measures.",
        "CG-9":
            "Develops effective communication skills for day-to-day interactions in two languages.",
        "CG-10": "Develops fluency in reading and writing in Language 1.",
        "CG-11": "Begins to read and write in Language 2.",
      },
      "competencies": {
        "C-1.1":
            "Shows a liking for and understanding of nutritious food and does not waste food.",
        "C-1.2": "Practises basic self-care and hygiene.",
        "C-1.3": "Keeps school/classroom hygienic and organised.",
        "C-1.4": "Practises safe use of material and simple tools.",
        "C-1.5":
            "Shows awareness of safety in movements (e.g., walking, running, cycling, etc.) and acts appropriately.",
        "C-1.6": "Understands unsafe situations and asks for help.",
        "C-2.1": "Differentiates between shapes, colours, and their shades.",
        "C-2.2": "Develops visual memory for symbols and representations.",
        "C-2.3":
            "Differentiates sounds and sound patterns by their pitch, volume, and tempo.",
        "C-2.4": "Differentiates multiple smells and tastes.",
        "C-2.5": "Develops discrimination in the sense of touch.",
        "C-2.6":
            "Begins integrating sensorial perceptions to get a holistic awareness of their experiences.",
        "C-3.1":
            "Shows coordination between sensorial perceptions and body movements in various activities.",
        "C-3.2":
            "Shows balance, coordination, and flexibility in various physical activities.",
        "C-3.3":
            "Shows precision and control in working with hands and fingers.",
        "C-3.4":
            "Shows strength and endurance in carrying, walking, and running.",
        "C-4.1":
            "Starts recognising ‘self’ as an individual belonging to a family and community.",
        "C-4.2":
            "Recognises different emotions and makes deliberate efforts to regulate them appropriately.",
        "C-4.3": "Interacts comfortably with other children and adults.",
        "C-4.4": "Shows cooperative behaviour with other children.",
        "C-4.5":
            "Understands and responds positively to social norms in the classroom and school.",
        "C-4.6":
            "Shows kindness and helpfulness to others (including animals and plants) when they are in need.",
        "C-4.7":
            "Understands and responds positively to different thoughts, preferences, and emotional needs of other children.",
        "C-5.1": "Engages in age-appropriate work at school and/or at home.",
        "C-6.1": "Shows care for and joy in engaging with all life forms.",
        "C-7.1":
            "Observes and understands different categories of objects and the relationships between them.",
        "C-7.2":
            "Observes and understands cause and effect relationships in nature by forming simple hypotheses and uses observations to explain their hypotheses.",
        "C-7.3":
            "Uses appropriate tools and technology in daily life situations and for learning.",
        "C-8.1":
            "Sorts objects into groups and sub-groups based on more than one property.",
        "C-8.2":
            "Identifies and implements simple patterns in their surroundings, shapes, and numbers.",
        "C-8.3":
            "Counts up to 99 both forwards and backwards, and in groups of 5s, 10s, and 20s.",
        "C-8.4": "Arranges numbers up to 99 in ascending and descending order.",
        "C-8.5":
            "Recognises and uses numerals to represent quantities up to 99 with the understanding of the decimal place value system.",
        "C-8.6":
            "Performs addition and subtraction of 2-digit numbers fluently, using flexible strategies of composition and decomposition of both numerical and word problems.",
        "C-8.7":
            "Recognises multiplication as repeated addition and division as equal sharing.",
        "C-8.8":
            "Recognises, makes, and classifies basic geometric shapes, and their observable properties, and understands and explains the relative relation of objects in space.",
        "C-8.9":
            "Selects appropriate tools and units to perform simple measurements of length, weight, and volume of objects in their immediate environment.",
        "C-8.10":
            "Performs simple measurements of time in minutes, hours, days, weeks, and months.",
        "C-8.11": "Performs simple transactions using money up to INR 100.",
        "C-8.12":
            "Develops adequate and appropriate vocabulary for comprehending and expressing concepts and procedures related to quantities, shapes, space, and measurements.",
        "C-8.13":
            "Formulates and solves simple mathematical problems related to quantities, shapes, space, and measurements.",
        "C-8.14":
            "Feels confident and sees Mathematics as doable and worthwhile.",
        "C-9.1": "Listens to and appreciates simple songs, rhymes, and poems.",
        "C-9.2": "Creates simple songs and poems on their own.",
        "C-9.3": "Converses fluently and can hold a meaningful conversation.",
        "C-9.4":
            "Understands oral instructions for a complex task and gives clear oral instructions for the same to others.",
        "C-9.5":
            "Comprehends narrated or read-out stories and identifies characters, storyline, and what the author wants to say.",
        "C-9.6": "Narrates short stories with clear plot and characters.",
        "C-9.7":
            "Knows and uses enough words to carry out day-to-day interactions effectively and can guess the meaning of new words by using existing vocabulary.",
        "C-10.1":
            "Develops phonological awareness and blends phonemes or syllables into words and segments words into phonemes or syllables.",
        "C-10.2":
            "Understands the basic structure or format of a book, idea of words in print and direction in which they are printed, and recognises basic punctuation marks.",
        "C-10.3":
            "Recognises all the letters of the alphabet (forms of Akshar) of the script, and uses this knowledge to read and write words.",
        "C-10.4":
            "Reads stories and passages with accuracy and fluency, with appropriate pauses and voice modulation.",
        "C-10.5":
            "Reads short stories and comprehends their meaning by identifying characters, storyline and what the author wants to say on their own.",
        "C-10.6":
            "Reads short poems and begins to appreciate a poem for its choice of words and imagination.",
        "C-10.7":
            "Reads and comprehends the meaning of short news items, instructions and recipes, and publicity material.",
        "C-10.8":
            "Writes a paragraph to express their understanding and experiences.",
        "C-10.9":
            "Shows interest in picking up and reading a variety of children’s books.",
        "C-11.1":
            "Develops phonological awareness and is able to blend phonemes or syllables into words and segment words into phonemes or syllables.",
        "C-11.2":
            "Recognises most frequently occurring letters of the alphabet (forms of Akshar) of the script and uses this knowledge to read and write words.",
      },
    },
    {
      "area": "aesthetic",
      "goals": {
        "CG-12":
            "Develops abilities and sensibilities in Visual and Performing Arts and expresses their emotions through art in meaningful and joyful ways.",
      },
      "competencies": {
        "C-12.1":
            "Explores and plays with a variety of materials and tools to create two-dimensional and three-dimensional artworks in varying sizes.",
        "C-12.2":
            "Explores and plays with their own voice, body, space, and a variety of objects to create music, role-play, dance, and movement.",
        "C-12.3":
            "Innovates and works imaginatively to express a range of ideas and emotions through the Arts.",
        "C-12.4": "Works collaboratively in the Arts.",
        "C-12.5":
            "Communicates and appreciates a variety of responses while creating and experiencing different forms of art, local culture, and heritage.",
      },
    },
    {
      "area": "positive",
      "goals": {
        "CG-13":
            "Develops habits of learning that allow them to engage actively in formal learning environments such as a school classroom.",
      },
      "competencies": {
        "C-13.1":
            "Acquires skills to plan, focus attention, and direct activities to achieve specific goals.",
        "C-13.2":
            "Develops adequate working memory, mental flexibility (to sustain or shift attention appropriately), and self-control (to resist impulsive actions or responses) that assist in learning in structured environments.",
        "C-13.3":
            "Observes minute details of objects, wonders, and explores using various senses, tinkers with objects, and asks questions.",
        "C-13.4":
            "Adopts and follows classroom norms with agency and understanding.",
      },
    },
    {
      "area": "languageR1",
      "goals": {
        "L1CG-1":
            "Develops oral language skills using complex sentence structures to understand and communicate ideas coherently",
        "L1CG-2":
            "Develops the ability to read with comprehension by gaining a basic understanding of different forms of familiar and unfamiliar texts (such as prose and poetry)",
        "L1CG-3":
            "Develops the ability to write simple and compound sentence structures to express their understanding and experiences",
        "L1CG-4":
            "Acquires a more comprehensive range of words in various contexts (of home and school experience) through different sources",
        "L1CG-5": "Develops interest and preference in reading",
      },
      "competencies": {
        "L1C-1.1": "Converses fluently and meaningfully in different contexts",
        "L1C-1.2": "Summarises core ideas from material read out in class",
        "L1C-1.3":
            "Makes oral presentations (show and tell, short welcome notes, anchoring of small events, short speeches, and class debates)",
        "L1C-2.1":
            "Applies varied comprehension strategies (inference, prediction, visualisation) to understand different texts",
        "L1C-2.2":
            "Understands main ideas and draws essential conclusions from the material read",
        "L1C-3.1":
            "Uses writing strategies, such as sequencing, identifying headings/sub-headings, the beginning and ending, and forming paragraphs",
        "L1C-3.2":
            "Writes clear and coherent paragraphs that convey their understanding of a given topic/concept or on reading of a text",
        "L1C-3.3":
            "Creates posters, invites, simple poems, stories and dialogues, with appropriate information and purpose",
        "L1C-3.4": "Uses appropriate grammar and structure in their writing",
        "L1C-4.1":
            "Discusses meanings of words and develops vocabulary by listening to and reading a variety of texts",
        "L1C-4.2":
            "Discusses meanings of words, and develops vocabulary by listening to and reading a variety of texts or other content areas",
        "L1C-5.1": "Borrows books from the library regularly to read at home",
        "L1C-5.2": "Demonstrates interest in reading books from the library",
      },
    },
    {
      "area": "languageR2",
      "goals": {
        "L2CG-1":
            "Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas",
        "L2CG-2":
            "Develops fluency in reading and the ability to read with comprehension",
        "L2CG-3":
            "Develops the ability to express understanding, experiences, feelings and ideas in writing",
        "L2CG-4":
            "Develops a wide range of vocabulary in various contexts and through different sources",
      },
      "competencies": {
        "L2C-1.1":
            "Listens to poems, stories and conversations, and identifies important ideas in them",
        "L2C-1.2":
            "Comprehends narrated/read out stories, and identifies characters, storyline, and key aspects",
        "L2C-1.3": "Converses meaningfully and coherently",
        "L2C-1.4":
            "Makes oral presentations and participates in group discussions",
        "L2C-2.1":
            "Develops further phonological awareness by blending phonemes or syllables into words and segmenting words into phonemes or syllables",
        "L2C-2.2":
            "Examines the basic structure of the text and recognises words and sentences in print, and basic punctuation marks",
        "L2C-2.3":
            "Reads stories and passages fluently and accurately with appropriate pauses",
        "L2C-2.4":
            "Comprehends the meaning of stories, poems, and story posters",
        "L2C-2.5":
            "Demonstrates interest in picking up and reading a variety of children’s books",
        "L2C-3.1":
            "Writes a paragraph to express understanding and experiences",
        "L2C-3.2":
            "Creates simple posters, invites, and instructions, with appropriate information and purpose",
        "L2C-3.3":
            "Writes stories, poems, and conversations based on imagination and experiences",
        "L2C-4.1":
            "Discusses meanings of words and develops vocabulary by listening to and reading a variety of texts in the other content areas",
      },
    },
    {
      "area": "maths",
      "goals": {
        "MCG-1":
            "Understands numbers (counting numbers and fractions), represents whole numbers using the Indian place value system, understands and carries out the four basic operations with whole numbers, and discovers patterns in number sequences",
        "MCG-2":
            "Analyses the characteristics and properties of two- and three-dimensional geometric shapes, specifies locations and describes spatial relationships, and recognises and creates shapes that have symmetry",
        "MCG-3":
            "Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non-standard and standard units",
        "MCG-4":
            "Develops procedural fluency to solve mathematical puzzles as well as daily-life problems, and as a step towards developing computational thinking",
        "MCG-5":
            "Knows and appreciates the development in India of the decimal place value system that is used around the world today",
      },
      "competencies": {
        "MC-1.1":
            "Represents numbers using the place value structure of the Indian number system, compares whole numbers, and knows and can read the names of very large numbers",
        "MC-1.2":
            "Represents and compares commonly used fractions in daily life (such as ½, ¼) as parts of unit wholes, as locations on number lines and as divisions of whole numbers",
        "MC-1.3":
            "Understands and visualises arithmetic operations and the relationship among them, knows addition and multiplication tables at least up to 10 x 10 (Pahade) and applies the four basic operations on whole numbers to solve daily life problems",
        "MC-1.4":
            "Recognises, describes, and extends simple number patterns such as odd numbers, even numbers, square numbers, cubes, powers of 2, powers of 10, and Virahanka–Fibonacci numbers",
        "MC-2.1":
            "Identifies, compares, and analyses attributes of two- and three-dimensional shapes and develops vocabulary to describe their attributes or properties",
        "MC-2.2":
            "Describes location and movement using both common language and mathematical vocabulary; understands the notion of map (Najri Naksha)",
        "MC-2.3":
            "Recognises and creates symmetry (reflection, rotation) in familiar 2D and 3D shapes",
        "MC-2.4":
            "Discovers, recognises, describes, and extends patterns in 2D and 3D shapes",
        "MC-3.1":
            "Measures in non-standard and standard units and evaluates the need for standard units",
        "MC-3.2":
            "Uses an appropriate unit and tool for the attribute (like length, perimeter, time, weight, volume) being measured",
        "MC-3.3":
            "Carries out simple unit conversions, such as from centimetres to metres, within a system of measurement",
        "MC-3.4":
            "Understands the definition and formula for the area of a square or rectangle as length times breadth",
        "MC-3.5":
            "Devises strategies for estimating the distance, length, time, perimeter (for regular and irregular shapes), area (for regular and irregular shapes), weight, and volume and verifies the same using standard units",
        "MC-3.6":
            "Deduces that shapes having equal areas can have different perimetres and shapes having equal perimetres can have different areas",
        "MC-3.7":
            "Evaluates the conservation of attributes like length and volume, and solves daily-life problems related to them",
        "MC-4.1":
            "Solves puzzles and daily-life problems involving one or more operations on whole numbers (including word puzzles and puzzles from ‘recreational’ areas, such as the construction of magic squares)",
        "MC-4.2":
            "Learns to systematically count and list all possible permutations or combination given a constraint, in simple situations (e.g., how to make a committee of two people from a group of five people)",
        "MC-4.3":
            "Selects appropriate methods and tools for computing with whole numbers, such as mental computation, estimation, or paper-pencil calculation, in accordance with the context",
        "MC-5.1":
            "Understands the development of zero in India and the Indian place value system for writing numerals, the history of its transmission to the world, and its modern impact on our lives and in all technology",
      },
    },

    {
      "area": "worldAround",
      "goals": {
        "TWCG-1":
            "Explores and engages with the natural and socio-cultural environment in their surroundings",
        "TWCG-2":
            "Understands the interdependence in their environment through experiences, developing the basis for the appreciation of the idea of ‘Vasudhaiva Kutumbakam’",
        "TWCG-3":
            "Explains how to ensure the safety of self and others in different (normal, as well as, emergency) situations",
        "TWCG-4": "Develops sensitivity towards social and natural environment",
        "TWCG-5": "Develops the ability to read and interpret simple maps",
        "TWCG-6":
            "Uses data and information from various sources to investigate questions related to their immediate environment",
        "TWCG-7":
            "Gains foundational familiarity with basic concepts and methods from the natural sciences (life sciences, physical sciences, and the earth and space sciences) and engineering",
      },
      "competencies": {
        "TWC-1.1":
            "Observes and identifies the natural (insects, plants, birds, animals, geographical features, sun and moon, stars, planets, natural resources) and social (houses, relationships) components in their immediate environment",
        "TWC-1.2":
            "Describes relationships (including between humans and animals/nature) and traditions (art forms, celebrations, festivals) in the family and community",
        "TWC-1.3":
            "Asks questions and makes predictions about simple patterns (season change, food chain, phases of the moon, movement of stars and planets, shapes of trees, plants, leaves, and flowers, rituals, celebrations) observed in the immediate environment",
        "TWC-1.4":
            "Explains the functioning of local institutions (family, school, bank, post office, market, and Panchayat) in different forms (story, drawing, tabulating data, reports), and analyses their roles",
        "TWC-1.5":
            "Uses local materials to create simple objects (family tree, envelopes, origami animals) on their own for display or use in class processes",
        "TWC-2.1":
            "Identifies natural and human-made systems that support their lives (water supply, water cycle, river flow systems, seasons, life cycle of plants and animals, food, household items, transport, communication, electricity) in the home",
        "TWC-2.2":
            "Describes the relationship between the natural environment and cultural practices in their immediate environment (nature of the work, food, festivals, traditions)",
        "TWC-2.3":
            "Connects changes in the environment and the lives of their family and community, as communicated by elders and through local stories (changes in occupation, food habits, resources, celebrations, communication)",
        "TWC-3.1":
            "Describes the basic safety needs and protection (health and hygiene, food, water, shelter, precautions, awareness of emergency situations, abuse, and unsafe situations) of humans, birds, and animals",
        "TWC-3.2":
            "Discusses how to prepare for emergency situations (smoke, fire, small injuries, burns, electrical safety, unseasonal rains, fallen trees) based on discussions with family and community, or personal experiences",
        "TWC-3.3":
            "Develops simple labels and slogans, and participates in roleplay on safety and protection in the local environment to be displayed/done in school and locality",
        "TWC-4.1":
            "Observes and describes diversity among plants, and birds and animals in their immediate environment (shape, sounds, food habits, growth, habitat)",
        "TWC-4.2":
            "Observes and describes cultural diversity in their immediate environment (food, clothing, games, different seasons, festivals related to harvest and sowing)",
        "TWC-4.3":
            "Describes usage of natural resources in their immediate environment",
        "TWC-4.4":
            "Demonstrates how natural resources can be shared, maintained, and conserved (trees, use of rainwater, benefits of millets)",
        "TWC-4.5":
            "Identifies needs of plants, birds, and animals, and how they can be supported (water, soil, food, care)",
        "TWC-4.6":
            "Identifies the needs of people in different situations, in terms of access to resources, equal opportunities, work distribution, and shelter",
        "TWC-4.7":
            "Learns about basic social and behavioural norms, values, and dispositions that benefit the social and natural environments and help the society function smoothly (using dustbins, standing in queues, conserving water, using public transportation, keeping one’s environment clean, always helping others in need regardless of background)",
        "TWC-5.1": "Explains a line drawing of their school, village, and ward",
        "TWC-5.2":
            "Draws a sketch of their school, village, and ward using symbols and directions",
        "TWC-5.3":
            "Reads simple maps of city, state, and country to identify natural and human-made features (well, lake, post office, school, hospital) with reference to symbols and directions",
        "TWC-6.1":
            "Performs simple inquiry related to specific questions independently or in groups",
        "TWC-6.2":
            "Presents observations and findings through different creative modes (drawing, diagram, poem, play, skit, oral and written expression)",
        "TWC-7.1":
            "Gains familiarity with using the scientific method in investigations, as well as, familiarity with other crosscutting concepts, such as, energy, matter, and systems that apply across the domains of science and engineering",
        "TWC-7.2":
            "Gains familiarity with disciplinary core ideas in the natural sciences, as well as, in engineering, technology, and applications of science, which reflect the content that will be learned across subject areas in later Grades",
      },
    },

    {
      "area": "artEd",
      "goals": {
        "VACG-1":
            "Develops confidence to explore, depict, and celebrate human experience through the arts",
        "VACG-2":
            "Exercises their imagination and creativity freely in the arts",
        "VACG-3":
            "Explores basic processes, materials, and techniques in the arts",
        "VACG-4":
            "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
        "AECG-1":
            "Develops an enjoyment of the arts and exercises their creativity and imagination in visual and performing arts activities",
        "TCG-1":
            "Develops confidence to explore, depict, and celebrate human experience through the arts",
        "TCG-2":
            "Exercises their imagination and creativity freely in the arts",
        "TCG-3":
            "Explores basic processes, materials, and techniques in the arts",
        "TCG-4":
            "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
        "MUCG-1":
            "Develops confidence to explore, depict, and celebrate human experience through the arts",
        "MUCG-2":
            "Exercises their imagination and creativity freely in the arts",
        "MUCG-3":
            "Explores basic processes, materials, and techniques in the arts",
        "MUCG-4":
            "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
        "DMCG-1":
            "Develops confidence to explore, depict, and celebrate human experience through the arts",
        "DMCG-2":
            "Exercises their imagination and creativity freely in the arts",
        "DMCG-3":
            "Explores basic processes, materials, and techniques in the arts",
        "DMCG-4":
            "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
      },
      "competencies": {
        "VAC-1.1":
            "Expresses enthusiasm to create a variety of images that depict their everyday life, emotions, and imaginations",
        "VAC-1.2":
            "Discusses a variety of ideas and responses while working collaboratively in the visual arts",
        "VAC-2.1":
            "Creatively uses different combinations of visual elements (line, form, colour, space, texture) while depicting their everyday observations, personal experiences, and feelings",
        "VAC-2.2":
            "Compares and contrasts the visual elements, themes, and expressions of artwork shared in the classroom",
        "VAC-3.1":
            "Makes choices while working with materials, tools, and techniques used in the visual arts",
        "VAC-3.2":
            "Practises steps of planning, executing, and presenting while creating visual artwork individually and collaboratively",
        "VAC-4.1":
            "Recognises visual elements in nature and describes their artistic qualities",
        "VAC-4.2": "Demonstrates curiosity towards local art forms and culture",
        "AEC-1.1":
            "Creates and presents a variety of artwork to communicate their ideas and emotions in any of the visual and performing art forms (emphasis on variety in music, painting, drawing, crafts, drama, dance and movement, and local art forms)",
        "AEC-1.2":
            "Describes the varied materials, tools, and processes used in the visual and performing arts and demonstrates familiarity with some of these in their own artwork [e.g., identifies and names some musical instruments and demonstrates simple beats on a dholak, khanjira, bells, utensils, or one’s own body (clapping, tapping, making different sounds using mouth and voice)]",
        "AEC-1.3":
            "Creates artwork collaboratively and shares own thoughts and feelings while responding to the arts and culture in their surroundings",
        "TC-1.1":
            "Expresses enthusiasm to depict a variety of objects, people, situations, and experiences in drama activities",
        "TC-1.2":
            "Discusses own thoughts and responses while working collaboratively in the dramatic arts",
        "TC-2.1":
            "Creates and performs drama in the classroom based on everyday events, by combining various characters, roles, situations, spaces, and basic props",
        "TC-2.2":
            "Compares and contrasts themes and elements of drama, and related artistic expressions created in the classroom",
        "TC-3.1":
            "Makes choices while working with materials, tools, and techniques used in the dramatic arts",
        "TC-3.2":
            "Practises steps of planning, executing, and presenting while creating drama individually and collaboratively",
        "TC-4.1":
            "Recognises elements of drama and movement in nature and describes their artistic qualities",
        "TC-4.2": "Demonstrates curiosity towards local art forms and culture",
        "MUC-1.1":
            "Expresses enthusiasm to practice and perform music that is familiar to them",
        "MUC-1.2":
            "Discusses own thoughts and responses while working collaboratively in music",
        "MUC-2.1":
            "Practises and performs songs and rhythms in a variety of musical arrangements (arrangement of vocal, instrumental, solo, duet, ensemble or group)",
        "MUC-2.2":
            "Compares and contrasts musical elements (Laya, Taala, Sur, Bhaava), lyrics, and expressions in a variety of musical styles introduced in the classroom",
        "MUC-3.1":
            "Makes choices while working with voices, instruments, and arrangements used in music",
        "MUC-3.2":
            "Contributes ideas while selecting music for performance and participates in rehearsals",
        "MUC-4.1":
            "Recognises musical elements in nature and describes their artistic qualities",
        "MUC-4.2": "Demonstrates curiosity towards local art forms and culture",
        "DMC-1.1":
            "Expresses enthusiasm to practice and perform dance and movement that is familiar to them",
        "DMC-1.2":
            "Discusses ideas and responses while working collaboratively in dance and movement",
        "DMC-2.1":
            "Creates and practises dance and movement sequences based on everyday actions and personal experiences",
        "DMC-2.2":
            "Compares and contrasts movements, rhythms, postures, themes, and expressions in a variety of dance and movement styles introduced in the classroom",
        "DMC-3.1":
            "Makes choices while working with movement steps, instruments, costumes, and arrangements used in dance and movement",
        "DMC-3.2":
            "Contributes ideas while selecting dance and movement sequences for performance and participates in rehearsals",
        "DMC-4.1":
            "Recognises elements of dance and movement in nature and describes their artistic qualities",
        "DMC-4.2": "Demonstrates curiosity towards local art forms and culture",
      },
    },
    {
      "area": "physicalEd",
      "goals": {
        "P1CG-3":
            "Demonstrates the use of basic skills (running, jumping, catching, throwing, hitting and kicking) in different physical activities/games/sports",
        "P1CG-4":
            "Develops an awareness of their personal and social behaviour towards themselves and others",
        "P1CG-5":
            "Demonstrates mental engagement in physical activity/game situations",
        "P1CG-6":
            "Develops an understanding of the need to develop themselves and self-assess their progress",
        "P2CG-1":
            "Learns the use of basic skills (running, jumping, catching, throwing, hitting and kicking a ball) to participate in different physical activities/games/sports",
        "P2CG-2":
            "Exhibits awareness of personal and social behaviour towards themselves and others",
        "P2CG-3":
            "Demonstrates mental engagement in physical activity/game situations",
      },
      "competencies": {
        "P1C-3.1":
            "Practises a combination of movement, motor skills, and manipulative skills (catching, throwing, kicking, hitting a ball towards a target while moving, focusing on visual cues to hit the target)",
        "P1C-3.2": "Moves purposefully their body to a beat/rhythm/music",
        "P1C-3.3":
            "Demonstrates coordination abilities with a partner and objects (e.g., being able to move in coordination with a partner in three-legged race, hand-eye coordination while bowling, throwing)",
        "P1C-3.4":
            "Demonstrates basic warm up exercises and stretching to develop strength and flexibility in the body",
        "P1C-4.1":
            "Demonstrates the ability to play games and activities which require and emphasise teamwork, cooperation, personal responsibility, and communication of ideas",
        "P1C-4.2":
            "Creates group norms and rules of the game/activity before playing and reviews them regularly",
        "P1C-4.3":
            "Exhibits sensitivity to injuries of others and acts empathetically when the other player is physically injured, emotionally stressed, or feeling unwell",
        "P1C-4.4":
            "Practises care and responsibility towards physical activity material, playground and facilities",
        "P1C-4.5":
            "Identifies characteristics of safe/unsafe touch in the context of physical activity and describes ways of reporting them",
        "P1C-5.1":
            "Explains the concepts of some games, their rules, playing positions, and basic moves",
        "P1C-5.2":
            "Expresses their emotions and thinking process during the game",
        "P1C-6.1":
            "Sets simple personal goals/targets and records progress (e.g., throwing a ball at 25 m, then 30 m, then 40 m; jumping 1, 2, 3 feet high/long)",

        "P2C-1.1":
            "Practises a combination of movement, motor skills, and manipulative skills (e.g., catching, throwing, kicking, hitting a ball towards a target while moving, focusing on visual cues to hit the target)",
        "P2C-1.2":
            "Demonstrates coordination abilities with a partner and objects (e.g., being able to move in coordination with a partner in three-legged race, hand-eye coordination while bowling, throwing)",
        "P2C-1.3":
            "Demonstrates basic warm up exercises and stretching to develop strength and flexibility in the body",
        "P2C-2.1":
            "Demonstrates the ability to play games and activities that require and emphasise teamwork and cooperation",
        "P2C-2.2":
            "Creates group norms and rules of the game/activity before playing and reviews these regularly",
        "P2C-2.3":
            "Exhibits sensitivity to injuries of others and acts empathetically when the other player is physically injured, emotionally stressed, or feeling unwell",
        "P2C-2.4":
            "Practises care and responsibility towards physical activity material, playground and facilities",
        "P2C-2.5":
            "Identifies characteristics of safe/unsafe touch in the context of physical activity and describes ways of reporting them",
        "P2C-3.1":
            "Explains the concepts of some games, their rules, playing positions, and basic moves",
        "P2C-3.2":
            "Expresses their emotions and thinking process during the game",
      },
    },
  ];

  static Map<String, String> getPeerQuestionsMap(Grade grade) {
    if ([
      Grade.ukg,
      Grade.ukg,
      Grade.nursery,
      Grade.grade1,
      Grade.grade2,
    ].contains(grade)) {
      return {
        "F.PE.1": "Helps in completing task/activity.",
        "F.PE.2": "Likes to play with others.",
        "F.PE.3": "Shares stationery (crayons/ glue/chalk) with classmates.",
      };
    } else if ([Grade.grade3, Grade.grade4, Grade.grade5].contains(grade)) {
      return {
        "P.PE.1":
            "My friend can talk about how he/she feels, e.g., happy, confident, upset, or angry.",
        "P.PE.2":
            "My friend can calm himself/herself down during difficult situations.",
        "P.PE.3": "My friend can understand how his/her friends feel.",
        "P.PE.4": "My friend respects everyone's opinions.",
        "P.PE.5": "My friend can help others make up after a fight.",
        "P.PE.6": "When someone is sad, my friend can make them feel better.",
      };
    } else {
      return {};
    }
  }

  static Map<String, String> getParentQuestionsMap(Grade grade) {
    if ([
      Grade.ukg,
      Grade.ukg,
      Grade.nursery,
      Grade.grade1,
      Grade.grade2,
    ].contains(grade)) {
      return {
        "F.PA.1": "My child enjoys participating in ...",
        "F.PA.2": "My child can be supported for ...",
        "F.PA.3": "I would also like to share ...",
        "F.PA.4":
            "Have I completed age appropriate vaccination schedule for my child?",
      };
    } else if ([Grade.grade3, Grade.grade4, Grade.grade5].contains(grade)) {
      return {
        "P.PA.1":
            "My child finds the classroom and school a welcoming and safe space.",
        "P.PA.2":
            "My child participates in academic and other activities in school.",
        "P.PA.3": "My child finds the grade-level curriculum difficult.",
        "P.PA.4": "My child is making good progress as per their grade.",
        "P.PA.5": "My child is getting the support needed from school.",
        "P.PA.6":
            "My child can talk about how he/she feels, e.g., happy, upset, or angry.",
        "P.PA.7":
            "My child can calm himself/herself down during difficult situations.",
        "P.PA.8": "My child can understand how his/her friends feel.",
        "P.PA.9": "My child respects everyone's opinions.",
        "P.PA.10": "My child can help his/her friends make up after a fight.",
        "P.PA.11": "When someone is sad, my child can make them feel better.",
      };
    } else {
      return {};
    }
  }

  static Map<String, String> getSelfQuestionsMap(Grade grade) {
    if ([
      Grade.ukg,
      Grade.ukg,
      Grade.nursery,
      Grade.grade1,
      Grade.grade2,
    ].contains(grade)) {
      return {
        "F.SE.1": "I followed my teacher's instructions.",
        "F.SE.2": "I liked doing this work.",
        "F.SE.3": "I found this work easy.",
        // "F.SE.3": "To do this work, I needed ...",
      };
    } else if ([Grade.grade3, Grade.grade4, Grade.grade5].contains(grade)) {
      return {
        "P.SE.1": "I followed my teacher's instructions.",
        "P.SE.2": "I liked doing this work.",
        "P.SE.3": "I asked for help if I didn't understand.",
        "P.SE.4": "I tried my best in this task.",
        "P.SE.5": "I am proud of my work.",
        "P.SE.6": "I want to do this task again.",
        "P.SE.7": "I liked working with my classmate/s.",
        "P.SE.8": "I could ask my classmates for help, and they helped me.",
      };
    } else {
      return {};
    }
  }
}



//  "forms": [
//         {
//           "form": "Learning Standard 1 - Visual Arts",
//           "goals": {
//         "VACG-1":
//             "Develops confidence to explore, depict, and celebrate human experience through the arts",
//         "VACG-2":
//             "Exercises their imagination and creativity freely in the arts",
//         "VACG-3":
//             "Explores basic processes, materials, and techniques in the arts",
//         "VACG-4":
//             "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
//         "AECG-1":
//             "Develops an enjoyment of the arts and exercises their creativity and imagination in visual and performing arts activities",
//       },
//           "competencies": {
//             "VAC-1.1":
//                 "Expresses enthusiasm to create a variety of images that depict their everyday life, emotions, and imaginations",
//             "VAC-1.2":
//                 "Discusses a variety of ideas and responses while working collaboratively in the visual arts",
//             "VAC-2.1":
//                 "Creatively uses different combinations of visual elements (line, form, colour, space, texture) while depicting their everyday observations, personal experiences, and feelings",
//             "VAC-2.2":
//                 "Compares and contrasts the visual elements, themes, and expressions of artwork shared in the classroom",
//             "VAC-3.1":
//                 "Makes choices while working with materials, tools, and techniques used in the visual arts",
//             "VAC-3.2":
//                 "Practises steps of planning, executing, and presenting while creating visual artwork individually and collaboratively",
//             "VAC-4.1":
//                 "Recognises visual elements in nature and describes their artistic qualities",
//             "VAC-4.2":
//                 "Demonstrates curiosity towards local art forms and culture",
//             "AEC-1.1":
//                 "Creates and presents a variety of artwork to communicate their ideas and emotions in any of the visual and performing art forms (emphasis on variety in music, painting, drawing, crafts, drama, dance and movement, and local art forms)",
//             "AEC-1.2":
//                 "Describes the varied materials, tools, and processes used in the visual and performing arts and demonstrates familiarity with some of these in their own artwork [e.g., identifies and names some musical instruments and demonstrates simple beats on a dholak, khanjira, bells, utensils, or one’s own body (clapping, tapping, making different sounds using mouth and voice)]",
//             "AEC-1.3":
//                 "Creates artwork collaboratively and shares own thoughts and feelings while responding to the arts and culture in their surroundings",
//           },
//         },
//         {
//           "form": "Learning Standard 1 - Theatre",
//           "goals": {
//             "TCG-1":
//                 "Develops confidence to explore, depict, and celebrate human experience through the arts",
//             "TCG-2":
//                 "Exercises their imagination and creativity freely in the arts",
//             "TCG-3":
//                 "Explores basic processes, materials, and techniques in the arts",
//             "TCG-4":
//                 "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
//             "AECG-1":
//                 "Develops an enjoyment of the arts and exercises their creativity and imagination in visual and performing arts activities",
//           },
//           "competencies": {
//             "TC-1.1":
//                 "Expresses enthusiasm to depict a variety of objects, people, situations, and experiences in drama activities",
//             "TC-1.2":
//                 "Discusses own thoughts and responses while working collaboratively in the dramatic arts",
//             "TC-2.1":
//                 "Creates and performs drama in the classroom based on everyday events, by combining various characters, roles, situations, spaces, and basic props",
//             "TC-2.2":
//                 "Compares and contrasts themes and elements of drama, and related artistic expressions created in the classroom",
//             "TC-3.1":
//                 "Makes choices while working with materials, tools, and techniques used in the dramatic arts",
//             "TC-3.2":
//                 "Practises steps of planning, executing, and presenting while creating drama individually and collaboratively",
//             "TC-4.1":
//                 "Recognises elements of drama and movement in nature and describes their artistic qualities",
//             "TC-4.2":
//                 "Demonstrates curiosity towards local art forms and culture",
//             "AEC-1.1":
//                 "Creates and presents a variety of artwork to communicate their ideas and emotions in any of the visual and performing art forms (emphasis on variety in music, painting, drawing, crafts, drama, dance and movement, and local art forms)",
//             "AEC-1.2":
//                 "Describes the varied materials, tools, and processes used in the visual and performing arts and demonstrates familiarity with some of these in their own artwork [e.g., identifies and names some musical instruments and demonstrates simple beats on a dholak, khanjira, bells, utensils, or one’s own body (clapping, tapping, making different sounds using mouth and voice)]",
//             "AEC-1.3":
//                 "Creates artwork collaboratively and shares own thoughts and feelings while responding to the arts and culture in their surroundings",
//           },
//         },
//         {
//           "form": "Learning Standard 1 - Music",
//           "goals": {
//             "MUCG-1":
//                 "Develops confidence to explore, depict, and celebrate human experience through the arts",
//             "MUCG-2":
//                 "Exercises their imagination and creativity freely in the arts",
//             "MUCG-3":
//                 "Explores basic processes, materials, and techniques in the arts",
//             "MUCG-4":
//                 "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
//             "AECG-1":
//                 "Develops an enjoyment of the arts and exercises their creativity and imagination in visual and performing arts activities",
//           },
//           "competencies": {
//             "MUC-1.1":
//                 "Expresses enthusiasm to practice and perform music that is familiar to them",
//             "MUC-1.2":
//                 "Discusses own thoughts and responses while working collaboratively in music",
//             "MUC-2.1":
//                 "Practises and performs songs and rhythms in a variety of musical arrangements (arrangement of vocal, instrumental, solo, duet, ensemble or group)",
//             "MUC-2.2":
//                 "Compares and contrasts musical elements (Laya, Taala, Sur, Bhaava), lyrics, and expressions in a variety of musical styles introduced in the classroom",
//             "MUC-3.1":
//                 "Makes choices while working with voices, instruments, and arrangements used in music",
//             "MUC-3.2":
//                 "Contributes ideas while selecting music for performance and participates in rehearsals",
//             "MUC-4.1":
//                 "Recognises musical elements in nature and describes their artistic qualities",
//             "MUC-4.2":
//                 "Demonstrates curiosity towards local art forms and culture",
//             "AEC-1.1":
//                 "Creates and presents a variety of artwork to communicate their ideas and emotions in any of the visual and performing art forms (emphasis on variety in music, painting, drawing, crafts, drama, dance and movement, and local art forms)",
//             "AEC-1.2":
//                 "Describes the varied materials, tools, and processes used in the visual and performing arts and demonstrates familiarity with some of these in their own artwork [e.g., identifies and names some musical instruments and demonstrates simple beats on a dholak, khanjira, bells, utensils, or one’s own body (clapping, tapping, making different sounds using mouth and voice)]",
//             "AEC-1.3":
//                 "Creates artwork collaboratively and shares own thoughts and feelings while responding to the arts and culture in their surroundings",
//           },
//         },
//         {
//           "form": "Learning Standard 1 - Dance and Movement",
//           "goals": {
//             "DMCG-1":
//                 "Develops confidence to explore, depict, and celebrate human experience through the arts",
//             "DMCG-2":
//                 "Exercises their imagination and creativity freely in the arts",
//             "DMCG-3":
//                 "Explores basic processes, materials, and techniques in the arts",
//             "DMCG-4":
//                 "Explores beauty in their surroundings, and develops an interest in a variety of local art forms and cultural practices",
//             "AECG-1":
//                 "Develops an enjoyment of the arts and exercises their creativity and imagination in visual and performing arts activities",
//           },
//           "competencies": {
//             "DMC-1.1":
//                 "Expresses enthusiasm to practice and perform dance and movement that is familiar to them",
//             "DMC-1.2":
//                 "Discusses ideas and responses while working collaboratively in dance and movement",
//             "DMC-2.1":
//                 "Creates and practises dance and movement sequences based on everyday actions and personal experiences",
//             "DMC-2.2":
//                 "Compares and contrasts movements, rhythms, postures, themes, and expressions in a variety of dance and movement styles introduced in the classroom",
//             "DMC-3.1":
//                 "Makes choices while working with movement steps, instruments, costumes, and arrangements used in dance and movement",
//             "DMC-3.2":
//                 "Contributes ideas while selecting dance and movement sequences for performance and participates in rehearsals",
//             "DMC-4.1":
//                 "Recognises elements of dance and movement in nature and describes their artistic qualities",
//             "DMC-4.2":
//                 "Demonstrates curiosity towards local art forms and culture",
//             "AEC-1.1":
//                 "Creates and presents a variety of artwork to communicate their ideas and emotions in any of the visual and performing art forms (emphasis on variety in music, painting, drawing, crafts, drama, dance and movement, and local art forms)",
//             "AEC-1.2":
//                 "Describes the varied materials, tools, and processes used in the visual and performing arts and demonstrates familiarity with some of these in their own artwork [e.g., identifies and names some musical instruments and demonstrates simple beats on a dholak, khanjira, bells, utensils, or one’s own body (clapping, tapping, making different sounds using mouth and voice)]",
//             "AEC-1.3":
//                 "Creates artwork collaboratively and shares own thoughts and feelings while responding to the arts and culture in their surroundings",
//           },
//         },
//         {
//           "form": "Learning Standard 2 - Visual and Performing Arts",
//           "goals": {
//             "AECG-1":
//                 "Develops an enjoyment of the arts and exercises their creativity and imagination in visual and performing arts activities",
//           },
//           "competencies": {
//             "AEC-1.1":
//                 "Creates and presents a variety of artwork to communicate their ideas and emotions in any of the visual and performing art forms (emphasis on variety in music, painting, drawing, crafts, drama, dance and movement, and local art forms)",
//             "AEC-1.2":
//                 "Describes the varied materials, tools, and processes used in the visual and performing arts and demonstrates familiarity with some of these in their own artwork [e.g., identifies and names some musical instruments and demonstrates simple beats on a dholak, khanjira, bells, utensils, or one’s own body (clapping, tapping, making different sounds using mouth and voice)]",
//             "AEC-1.3":
//                 "Creates artwork collaboratively and shares own thoughts and feelings while responding to the arts and culture in their surroundings",
//           },
//         },
//       ],