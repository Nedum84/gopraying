const BASE_URL = 'http://192.168.44.236/gopraying/api/';
// const BASE_URL = 'https://iclass.school/api/';

//PRAYER REQUEST
const GET_PRAYER_URL = BASE_URL + 'prayer/get_prayer.php?';
const GET_PRAYER_COMMENT_URL = BASE_URL + 'prayer/et_prayer_comment.php?';
const GET_USER_PRAYER_URL = BASE_URL + 'prayer/get_user_prayer.php?';
const POST_ADD_PRAYER_URL = BASE_URL + 'prayer/add_prayer.php';
const POST_ADD_PRAYER_COMMENT_URL = BASE_URL + 'prayer/add_prayer_comment.php';
const DELETE_PRAYER_URL = BASE_URL + 'prayer/delete_prayer.php?';
const DELETE_PRAYER_IMAGE_URL = BASE_URL + 'prayer/delete_prayer_image.php?';
const DELETE_PRAYER_COMMENT_URL = BASE_URL + 'prayer/delete_comment.php?';
const DELETE_PRAYER_COMMENT_IMAGE_URL = BASE_URL + 'prayer/delete_comment_image.php?';

const POST_ADD_PRAYER_COMMIT_URL = BASE_URL + 'prayer/add_prayer_commit.php';

//TESTIMONY
const GET_TESTIMONY_URL = BASE_URL + 'testimony/get_testimony.php?';
const GET_TESTIMONY_COMMENT_URL = BASE_URL + 'testimony/get_testimony_comment.php?';
const POST_ADD_TESTIMONY_URL = BASE_URL + 'testimony/add_testimony.php';
const POST_ADD_TESTIMONY_COMMENT_URL = BASE_URL + 'testimony/add_testimony_comment.php';
// CATEGORY
const GET_CATEGORY = BASE_URL + 'category/get_category.php?';

// GLOBAL PRAYER
const GET_SUBJECT_GENERAL_URL = BASE_URL + 'subject_general/subject_general.php?';

//AUTHENTICATION
const GET_USER = BASE_URL + 'auth/user.php?';
const AUTHENTICATE_USER = BASE_URL + 'auth/check_if_registered.php?';
const POST_UPDATE_PROFILE_URL = BASE_URL + 'auth/edit_profile.php';
const POST_REGISTER_URL = BASE_URL + 'auth/registration.php';
