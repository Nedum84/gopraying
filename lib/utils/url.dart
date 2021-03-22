const BASE_URL = 'http://192.168.44.236/gopraying/api/';
// const BASE_URL = 'https://iclass.school/api/';

//PRAYERS & TESTIMONY
const GET_PRAYER_URL = BASE_URL + 'class/class.php?';
const GET_PRAYER_COMMENT_URL = BASE_URL + 'class/subject.php?';
const GET_TESTIMONY_URL = BASE_URL + 'class/topic.php?';
const GET_TESTIMONY_COMMENT_URL = BASE_URL + 'class/video_and_pdf.php?';
const POST_ADD_PRAYER_URL = BASE_URL + 'question/ask_question.php';
const POST_ADD_PRAYER_COMMENT_URL = BASE_URL + 'question/ask_question.php';
const POST_ADD_TESTIMONY_URL = BASE_URL + 'question/ask_question.php';
const POST_ADD_TESTIMONY_COMMENT_URL = BASE_URL + 'question/ask_question.php';

// CATEGORY
const GET_CATEGORY = BASE_URL + 'category/get_category.php?';

// GLOBAL PRAYER
const GET_SUBJECT_GENERAL_URL = BASE_URL + 'subject_general/subject_general.php?';

//QUESTION
const GET_QUESTION_URL = BASE_URL + 'question/get_question.php?';
const GET_USER_QUESTIONS_URL = BASE_URL + 'question/get_user_question.php?';
const POST_QUESTION_URL = BASE_URL + 'question/ask_question.php';
const DELETE_QUESTION_URL = BASE_URL + 'question/delete_question.php?';
const DELETE_QUESTION_IMAGE_URL = BASE_URL + 'question/delete_image.php?';
const GET_QUESTION_ANSWER_STATUS = BASE_URL + 'question/question_answer_status.php?';
const GET_CHECK_QUESTION_UNIT = BASE_URL + 'question/check_question_unit.php?';
//--teacher
const GET_QUESTION_FOR_TEACHERS_URL = BASE_URL + 'question/t/get_question_for_teacher.php?'; //TEACHER
const POST_ASSIGN_Q_TO_TEACHERS = BASE_URL + 'question/t/assign_question_to_teacher.php'; //TEACHER
const GET_SALARY_PAYMENT_URL = BASE_URL + 'question/t/salary_payment.php?'; //TEACHER
const GET_QUESTIONS_ASSIGNED_URL = BASE_URL + 'question/t/get_question.php?'; //TEACHER

//ANSWER
const GET_ANSWER_URL = BASE_URL + 'questionanswer/get_answer.php?';
const POST_ANSWER_URL = BASE_URL + 'questionanswer/answer_question.php';
const DELETE_ANSWER_URL = BASE_URL + 'questionanswer/delete_answer.php?';
const DELETE_ANSWER_IMAGE_URL = BASE_URL + 'questionanswer/delete_image.php?';

// ACTIVATION
//CLASS
const POST_COURSE_KEY_ACTIVATION_URL = BASE_URL + 'activation/course_key_activation.php';
const POST_COURSE_CARD_ACTIVATION_URL = BASE_URL + 'activation/course_card_activation.php';
const POST_COURSE_CHECK_SUBSCRIBED_URL = BASE_URL + 'activation/course_check_activation.php';
const GET_COURSE_SUBSCRIPTION_URL = BASE_URL + 'activation/course_user_subscription.php?';
//QUESTION
const GET_QUESTION_UNIT_URL = BASE_URL + 'activation/get_question_unit.php?';
const POST_QUESTION_ACTIVATION_URL = BASE_URL + 'activation/question_activation.php';
const GET_QUESTION_SUBSCRIPTION_URL = BASE_URL + 'activation/question_topup_user_subscription.php?';

//AUTHENTICATION
const GET_USER = BASE_URL + 'auth/user.php?';
const AUTHENTICATE_USER = BASE_URL + 'auth/check_if_registered.php?';
const POST_UPDATE_PROFILE_URL = BASE_URL + 'auth/edit_profile.php';
const POST_REGISTER_URL = BASE_URL + 'auth/registration.php';

//EXAM
// --topic quiz
const GET_QUIZ_EXAM_URL = BASE_URL + 'exam/quiz.php?';
// --cbt exam
const GET_CBT_EXAM_URL = BASE_URL + 'exam/cbt.php?';
const GET_SUBJECT_EXAM_URL = BASE_URL + 'exam/cbt_subject.php?';
const GET_CLASS_EXAM_URL = BASE_URL + 'exam/cbt_class.php?';
const GET_YEAR_EXAM_URL = BASE_URL + 'exam/cbt_year.php?';

//Comments
const POST_COMMENT_URL = BASE_URL + 'videocomment/post_comment.php';
const GET_COMMENT_URL = BASE_URL + 'videocomment/get_comment.php?';
