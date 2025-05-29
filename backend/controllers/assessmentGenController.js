const Assessment = require('../models/Assessment');
const Activity = require('../models/Activity');



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
const createAssessment = async (req, res) => {
    try {

        /// type: about, peer, parent, activity

        const { schoolId, term, classId, grade, medium, type, area, activityId } = req.body;


        var data = {
            schoolId,
            classId,
            medium,
            type,
            area,
            term
        }


        if (type === 'activity' && activityId) {
            const activity = await Activity.findById(activityId);

            if (activity) {
                data.activity = activity;
            }
        }


        if (type === 'activity') {
            data.name = areaLabels[area] || '';
            if (['nursery', 'lkg', 'ukg', 'grade1', 'grade2'].includes(grade)) {

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
                                        type: 'text',
                                    },
                                    // {
                                    //     index: 1,
                                    //     key: 'challenges',
                                    //     question: 'What challenges did the learner face?',
                                    //     type: 'text',
                                    // },
                                    // {
                                    //     index: 2,
                                    //     key: 'overcome',
                                    //     question: 'How did they overcome them? / How did you help them?',
                                    //     type: 'text',
                                    // },
                                ]
                            },
                        ]
                    }
                ];


                data.sections = sections;




            } else if (['grade3', 'grade4', 'grade5'].includes(grade)) {

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
                                        type: 'text',
                                    },
                                    {
                                        index: 1,
                                        key: 'challenges',
                                        question: 'What challenges did the learner face?',
                                        type: 'text',
                                    },
                                    {
                                        index: 2,
                                        key: 'overcome',
                                        question: 'How did they overcome them? / How did you help them?',
                                        type: 'text',
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


            if (['nursery', 'lkg', 'ukg', 'grade1', 'grade2'].includes(grade)) {





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
                                        type: "text",
                                    },
                                    {
                                        index: 1,
                                        key: 'birthday',
                                        question: "My Birthday Is On",
                                        type: "text",
                                    },
                                    {
                                        index: 2,
                                        key: 'place',
                                        question: "I Live In",
                                        type: "text",
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
                                key: 'photo'
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
                                key: 'family-photo'
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
                                        type: "multi-text",
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
                                        type: "text",
                                    },
                                    {
                                        index: 1,
                                        key: 'food',
                                        question: "Favourite Food",
                                        type: "text",
                                    },
                                    {
                                        index: 2,
                                        key: 'flower',
                                        question: "Favourite Flower",
                                        type: "text",
                                    },
                                    {
                                        index: 3,
                                        key: 'sport',
                                        question: "Favourite Sport",
                                        type: "text",
                                    },
                                    {
                                        index: 4,
                                        key: 'animal',
                                        question: "Favourite Animal",
                                        type: "text",
                                    },
                                    {
                                        index: 5,
                                        key: 'subject',
                                        question: "Favourite Subject",
                                        type: "text",
                                    },
                                ]
                            },

                        ]
                    },

                ];


                data.sections = sections;




            } else if (['grade3', 'grade4', 'grade5'].includes(grade)) {
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
                                        type: "text",
                                    },
                                    {
                                        index: 1,
                                        key: 'age',
                                        question: "I Am ___ Years Old",
                                        type: "text",
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
                                key: 'family-photo',
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
                                        type: "text",
                                    },
                                    {
                                        index: 1,
                                        key: 'notGoodAt',
                                        question: "I Am Not So Good At",
                                        type: "text",
                                    },
                                    {
                                        index: 2,
                                        key: 'improveSkill',
                                        question: "I Would Like to Improve My Skill Of",
                                        type: "text",
                                    },
                                    {
                                        index: 3,
                                        key: 'like',
                                        question: "I Like To",
                                        type: "text",
                                    },
                                    {
                                        index: 4,
                                        key: 'unlike',
                                        question: "I Don't Like To",
                                        type: "text",
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
                                        type: "text",
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
                                        type: "multi-text",
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
                                        type: "text",
                                    },
                                    {
                                        index: 1,
                                        key: 'games',
                                        question: "Favourite Games",
                                        type: "text",
                                    },
                                    {
                                        index: 2,
                                        key: 'festivals',
                                        question: "Favourite Festivals",
                                        type: "text",
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
                                        type: "text",
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

            if (['nursery', 'lkg', 'ukg', 'grade1', 'grade2'].includes(grade)) {

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
                                        type: "text"
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

            } else if (['grade3', 'grade4', 'grade5'].includes(grade)) {
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
                                        type: "text"
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

            if (['nursery', 'lkg', 'ukg', 'grade1', 'grade2'].includes(grade)) {


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
                                        type: "multi-choice"
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

            } else if (['grade3', 'grade4', 'grade5'].includes(grade)) {

                data.name = 'Your Child Matters!';

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
                                        type: "text"
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
        }











        const newAssessment = await Assessment.create(req.body);
        res.status(201).json(newAssessment);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};
