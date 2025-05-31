const Assessment = require('../models/Assessment');
const {Activity} = require('../models/Activity');



const areaLabels = {
    physical: "Physical Development",
    socioEmotional: "Socio-Emotional and Ethical Development",
    cognitive: "Cognitive Development",
    language: "Language and Literacy Development",
    aesthetic: "Aesthetic and Cultural Development",
    positive: "Positive Learning Habits",
    languageR1: "Language Education (R1)",
    languageR2: "Language Education (R2)",
    maths: "Mathematics",
    worldAround: "The World Around Us",
    artEd: "Art Education (AE)",
    physicalEd: "Physical Education (PE)"
};
// Create a new assessment
const generateAssessment = async (req, res) => {
    try {

        /// type: about, peer, parent, activity

        const { schoolId, term, classId, grade, medium, type, area, activityId, groupId, studentId } = req.body;


        var data = {
            schoolId,
            classId,
            medium,
            type,
            area,
            term,
            createdBy: req.user.id,
            groupId,
            studentId 
        }


        if (type === 'activity' && activityId) {
            const activity = await Activity.findById(activityId);

            if (activity) {
                data.activity = activity;
            }
        }


        if (type === 'activity') {

            data.name = data.activity.title;

            if (['nursery', 'lkg', 'ukg', '1', '2'].includes(grade)) {

                const sections = [
                    {
                        index: 0,
                        key: 'self-assessment',
                        name: 'Self Assessment',
                        elements: [
                            {
                                index: 0,
                                instruction: 'Select the answer that best reflects your experience with this activity.',
                                type: 'likeart',
                                value: [
                                    {
                                        index: 0,
                                        key: 'F.SE.1',
                                        value: "I followed my teacher's instructions.",
                                    },
                                    {
                                        index: 1,
                                        key: 'F.SE.2',
                                        value: "I liked doing this work.",
                                    },
                                    {
                                        index: 2,
                                        key: 'F.SE.3',
                                        value: "I found this work easy.",
                                    },
                                ]
                            },
                        ]
                    },
                    {
                        index: 1,
                        key: 'teacher-feedback',
                        name: 'Teacher Feedback',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'notes',
                                        question: 'Observational Notes',
                                        type: "long-answer",
                                    },
                                    // {
                                    //     index: 1,
                                    //     key: 'challenges',
                                    //     question: 'What challenges did the learner face?',
                                    //     type: "short-answer",
                                    // },
                                    // {
                                    //     index: 2,
                                    //     key: 'overcome',
                                    //     question: 'How did they overcome them? / How did you help them?',
                                    //     type: "short-answer",
                                    // },
                                ]
                            },
                        ]
                    }
                ];


                data.sections = sections;




            } else if (['3', '4', '5'].includes(grade)) {

                const sections = [
                    {
                        index: 0,
                        key: 'self-assessment',
                        name: 'Self Assessment',
                        elements: [
                            {
                                index: 0,
                                instruction: 'Select the answer that best reflects your experience with this activity.',
                                type: 'likeart',
                                value: [
                                    {
                                        index: 0,
                                        key: 'P.SE.1',
                                        value: "I followed my teacher's instructions.",
                                    },
                                    {
                                        index: 1,
                                        key: 'P.SE.2',
                                        value: "I liked doing this work.",
                                    },
                                    {
                                        index: 2,
                                        key: 'P.SE.3',
                                        value: "I asked for help if I didn't understand."
                                    },
                                    {
                                        index: 3,
                                        key: 'P.SE.4',
                                        value: "I tried my best in this task."
                                    },
                                    {
                                        index: 4,
                                        key: 'P.SE.5',
                                        value: "I am proud of my work."
                                    },
                                    {
                                        index: 5,
                                        key: 'P.SE.6',
                                        value: "I want to do this task again."
                                    },
                                    {
                                        index: 6,
                                        key: 'P.SE.7',
                                        value: "I liked working with my classmate/s."
                                    },
                                    {
                                        index: 7,
                                        key: 'P.SE.8',
                                        value: "I could ask my classmates for help, and they helped me."
                                    },
                                ]
                            },
                        ]
                    },
                    {
                        index: 1,
                        key: 'teacher-feedback',
                        name: 'Teacher Feedback',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'notes',
                                        question: 'Observational Notes',
                                        type: "long-answer",
                                    },
                                    {
                                        index: 1,
                                        key: 'challenges',
                                        question: 'What challenges did the learner face?',
                                        type: "long-answer",
                                    },
                                    {
                                        index: 2,
                                        key: 'overcome',
                                        question: 'How did they overcome them? / How did you help them?',
                                        type: "long-answer",
                                    },
                                ]
                            },
                        ]
                    }
                ];


                data.sections = sections;
            }
        } else if (type === 'about') {

            data.name = 'About Me';


            if (['nursery', 'lkg', 'ukg', '1', '2'].includes(grade)) {





                const sections = [
                    {
                        index: 0,
                        key: 'basic',
                        name: 'Basic Information',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'age',
                                        question: "I Am ___ Years Old",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 1,
                                        key: 'birthday',
                                        question: "My Birthday Is On",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 2,
                                        key: 'place',
                                        question: "I Live In",
                                        type: "short-answer",
                                    },
                                ]
                            },
                        ]
                    },

                    {
                        index: 1,
                        key: 'photo',
                        name: 'My Photo',
                        elements: [
                            {
                                index: 0,
                                type: 'image',
                            },
                        ]
                    },
                    {
                        index: 2,
                        key: 'family-photo',
                        name: 'My Family Photo',
                        elements: [
                            {
                                index: 0,
                                type: 'image',
                            },
                        ]
                    },

                    {
                        index: 3,
                        key: 'friends',
                        name: 'My Friends',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'friends',
                                        type: "multiple-short-answers",
                                    },
                                ]
                            },

                        ]
                    },

                    {
                        index: 3,
                        key: 'favourites',
                        name: 'My Favourites',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'color',
                                        question: "Favourite Colour",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 1,
                                        key: 'food',
                                        question: "Favourite Food",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 2,
                                        key: 'flower',
                                        question: "Favourite Flower",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 3,
                                        key: 'sport',
                                        question: "Favourite Sport",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 4,
                                        key: 'animal',
                                        question: "Favourite Animal",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 5,
                                        key: 'subject',
                                        question: "Favourite Subject",
                                        type: "short-answer",
                                    },
                                ]
                            },

                        ]
                    },

                ];


                data.sections = sections;




            } else if (['3', '4', '5'].includes(grade)) {
                const sections = [
                    {
                        index: 0,
                        key: 'basic',
                        name: 'Basic Information',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'name',
                                        question: "My Name Is",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 1,
                                        key: 'age',
                                        question: "I Am ___ Years Old",
                                        type: "short-answer",
                                    },
                                ],
                            },
                        ],
                    },
                    {
                        index: 1,
                        key: 'family-photo',
                        name: 'My Family Photo',
                        elements: [
                            {
                                index: 0,
                                type: 'image',
                            },
                        ],
                    },
                    {
                        index: 2,
                        key: 'skills',
                        name: 'My Skills and Preferences',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'goodAt',
                                        question: "I Am Good At",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 1,
                                        key: 'notGoodAt',
                                        question: "I Am Not So Good At",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 2,
                                        key: 'improveSkill',
                                        question: "I Would Like to Improve My Skill Of",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 3,
                                        key: 'like',
                                        question: "I Like To",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 4,
                                        key: 'unlike',
                                        question: "I Don't Like To",
                                        type: "short-answer",
                                    },
                                ],
                            },
                        ],
                    },
                    {
                        index: 3,
                        key: 'ambition',
                        name: 'My Ambition',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'ambition',
                                        question: "When I Grow Up I Want to Be",
                                        type: "short-answer",
                                    },
                                ],
                            },
                        ],
                    },
                    {
                        index: 4,
                        key: 'learnings',
                        name: 'Things I Want to Learn',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'learnings',
                                        type: "multiple-short-answers",
                                    },
                                ],
                            },
                        ],
                    },
                    {
                        index: 5,
                        key: 'favourites',
                        name: 'My Favourites',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'food',
                                        question: "Favourite Food",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 1,
                                        key: 'games',
                                        question: "Favourite Games",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 2,
                                        key: 'festivals',
                                        question: "Favourite Festivals",
                                        type: "short-answer",
                                    },
                                ],
                            },
                        ],
                    },
                    {
                        index: 6,
                        key: 'hero',
                        name: 'My Idol',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'hero',
                                        question: "One Person Who Inspires Me Is",
                                        type: "short-answer",
                                    },
                                ],
                            },
                        ],
                    },
                ];


                data.sections = sections;
            }
        } else if (type === 'peer') {
            data.name = 'Peer Assessment';

            if (['nursery', 'lkg', 'ukg', '1', '2'].includes(grade)) {

                const sections = [
                    {
                        index: 0,
                        key: 'peer',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'select-peer',
                                        question: "Peer name",
                                        type: "short-answer"
                                    },
                                ]
                            },
                        ]
                    },

                    {
                        index: 0,
                        key: 'peer-assessment',
                        elements: [
                            {
                                index: 0,
                                instruction: 'Assess your peer based on their performance:',
                                type: 'likeart',
                                value: [
                                    {
                                        index: 0,
                                        key: 'F.PE.1',
                                        value: "Helps in completing task/activity.",
                                    },
                                    {
                                        index: 1,
                                        key: 'F.PE.2',
                                        value: "Likes to play with others.",
                                    },
                                    {
                                        index: 2,
                                        key: 'F.PE.3',
                                        value: "Shares stationery (crayons/ glue/chalk) with classmates."
                                    },
                                ]
                            },
                        ]
                    },



                ];

                data.sections = sections;

            } else if (['3', '4', '5'].includes(grade)) {
                const sections = [
                    {
                        index: 0,
                        key: 'peer',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'select-peer',
                                        question: "Peer name",
                                        type: "short-answer"
                                    },
                                ]
                            },
                        ]
                    },

                    {
                        index: 0,
                        key: 'peer-assessment',
                        elements: [
                            {
                                index: 0,
                                instruction: 'Assess your peer based on their performance:',
                                type: 'likeart',
                                value: [
                                    {
                                        index: 0,
                                        key: 'P.PE.1',
                                        value: "My friend can talk about how he/she feels, e.g., happy, confident, upset, or angry.",
                                    },
                                    {
                                        index: 1,
                                        key: 'P.PE.2',
                                        value: "My friend can calm himself/herself down during difficult situations.",
                                    },
                                    {
                                        index: 2,
                                        key: 'P.PE.3',
                                        value: "My friend can understand how his/her friends feel."
                                    },
                                    {
                                        index: 3,
                                        key: 'P.PE.4',
                                        value: "My friend respects everyone's opinions.",
                                    },
                                    {
                                        index: 4,
                                        key: 'P.PE.5',
                                        value: "My friend can help others make up after a fight."
                                    },
                                    {
                                        index: 5,
                                        key: 'P.PE.6',
                                        value: "When someone is sad, my friend can make them feel better."
                                    },
                                ]
                            },
                        ]
                    },

                ];

                data.sections = sections;
            }
        } else if (type === 'parent') {

            if (['nursery', 'lkg', 'ukg', '1', '2'].includes(grade)) {


                data.name = 'Your Child Matters!';


                const sections = [
                    {
                        index: 0,
                        key: 'resources',
                        name: 'Select the resources available to your child at home.',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'resources',
                                        type: "multiple-choice",
                                        options: [
                                            {
                                                index: 0,
                                                value: "Books and Magazines",
                                                key: "books-magazines",
                                            },

                                            {
                                                index: 1,
                                                value: "Newspapars",
                                                key: "newspapars",
                                            },

                                            {
                                                index: 2,
                                                value: "Toys, Games and Sports",
                                                key: "toys-games-sports",
                                            },


                                            {
                                                index: 3,
                                                value: "Phone and Computer",
                                                key: "phone-computer",
                                            },

                                            {
                                                index: 4,
                                                value: "Internet",
                                                key: "internet",
                                            },


                                            {
                                                index: 5,
                                                value: "Public Broadcast System (audio/video at the panchayat/block level)",
                                                key: "public-broadcast-system",
                                            },
                                            {
                                                index: 6,
                                                value: "Resources for CWSN",
                                                key: "cwsn-resources",
                                            },
                                        ]
                                    },

                                    {
                                        index: 1,
                                        key: 'other-resource',
                                        question: "Any other (please specify)",
                                        type: "short-answer",
                                    },

                                ]
                            },
                        ]
                    },
                    {
                        index: 0,
                        key: 'parent-assessment',
                        elements: [
                            {
                                index: 0,
                                instruction: 'Please answer the following questions about your child\'s experience:',
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'F.PA.1',
                                        question: "My child enjoys participating in ...",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 1,
                                        key: 'F.PA.2',
                                        question: "My child can be supported for ...",
                                        type: "short-answer",
                                    },
                                    {
                                        index: 2,
                                        key: 'F.PA.3',
                                        question: "I would also like to share ...",
                                        type: "long-answer",
                                    },
                                    {
                                        index: 3,
                                        key: 'F.PA.4',
                                        question: "Have I completed age appropriate vaccination schedule for my child?",
                                        type: "true-false",
                                    },
                                ]
                            },
                        ]
                    },



                ];

                data.sections = sections;

            } else if (['3', '4', '5'].includes(grade)) {

                data.name = 'Your Child Matters!';


                const sections = [
                    {
                        index: 0,
                        key: 'resources',
                        name: 'Select the resources available to your child at home.',
                        elements: [
                            {
                                index: 0,
                                type: 'quiz',
                                value: [
                                    {
                                        index: 0,
                                        key: 'resources',
                                        type: "multiple-choice",
                                        options: [
                                            {
                                                index: 0,
                                                value: "Books and Magazines",
                                                key: "books-magazines",
                                            },

                                            {
                                                index: 1,
                                                value: "Newspapars",
                                                key: "newspapars",
                                            },

                                            {
                                                index: 2,
                                                value: "Toys, Games and Sports",
                                                key: "toys-games-sports",
                                            },


                                            {
                                                index: 3,
                                                value: "Phone and Computer",
                                                key: "phone-computer",
                                            },

                                            {
                                                index: 4,
                                                value: "Internet",
                                                key: "internet",
                                            },


                                            {
                                                index: 5,
                                                value: "Public Broadcast System (audio/video at the panchayat/block level)",
                                                key: "public-broadcast-system",
                                            },
                                            {
                                                index: 6,
                                                value: "Resources for CWSN",
                                                key: "cwsn",
                                            },
                                        ]
                                    },

                                    {
                                        index: 1,
                                        key: 'other-resource',
                                        question: "Any other (please specify)",
                                        type: "short-answer",
                                    },

                                ]
                            },
                        ]
                    },
                    {
                        index: 0,
                        key: 'parent-assessment',
                        elements: [
                            {
                                index: 0,
                                instruction: 'Please answer the following questions about your child\'s experience:',
                                type: 'likeart',
                                value: [
                                    {
                                        "index": 0,
                                        "key": "P.PA.1",
                                        "value": "My child finds the classroom and school a welcoming and safe space."
                                    },

                                    {
                                        "index": 1,
                                        "key": "P.PA.2",
                                        "value": "My child participates in academic and other activities in school."
                                    },
                                    {
                                        "index": 2,
                                        "key": "P.PA.3",
                                        "value": "My child finds the grade-level curriculum difficult."
                                    },
                                    {
                                        "index": 3,
                                        "key": "P.PA.4",
                                        "value": "My child is making good progress as per their grade."
                                    },
                                    {
                                        "index": 4,
                                        "key": "P.PA.5",
                                        "value": "My child is getting the support needed from school."
                                    },
                                    {
                                        "index": 5,
                                        "key": "P.PA.6",
                                        "value": "My child can talk about how he/she feels, e.g., happy, upset, or angry."
                                    },
                                    {
                                        "index": 6,
                                        "key": "P.PA.7",
                                        "value": "My child can calm himself/herself down during difficult situations."
                                    },
                                    {
                                        "index": 7,
                                        "key": "P.PA.8",
                                        "value": "My child can understand how his/her friends feel."
                                    },
                                    {
                                        "index": 8,
                                        "key": "P.PA.9",
                                        "value": "My child respects everyone's opinions."
                                    },
                                    {
                                        "index": 9,
                                        "key": "P.PA.10",
                                        "value": "My child can help his/her friends make up after a fight."
                                    },
                                    {
                                        "index": 10,
                                        "key": "P.PA.11",
                                        "value": "When someone is sad, my child can make them feel better."
                                    }
                                ]
                            },
                        ]
                    },
                ];

                data.sections = sections;
            }
        }
        const newAssessment = await Assessment.create(data);
        res.status(201).json(newAssessment);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};



module.exports = {
  generateAssessment,
};
