-- --------------------------------------------------------
-- 호스트:                          legend-by.kro.kr
-- 서버 버전:                        10.3.25-MariaDB-0ubuntu0.20.04.1 - Ubuntu 20.04
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 lms.account 구조 내보내기
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` varchar(50) NOT NULL,
  `account_pw` varchar(50) NOT NULL,
  `account_state` enum('대기','활성화','탈퇴') NOT NULL COMMENT '계정 활성화 여부',
  `account_level` int(11) NOT NULL COMMENT '계정 권한',
  `account_createdate` datetime NOT NULL,
  `account_updatedate` datetime NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.address 구조 내보내기
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zip_code` char(5) NOT NULL DEFAULT '' COMMENT '우편번호',
  `province` varchar(30) NOT NULL DEFAULT '' COMMENT '시도',
  `province_eng` varchar(30) NOT NULL DEFAULT '' COMMENT '시도영문',
  `city` varchar(30) NOT NULL DEFAULT '' COMMENT '시군구',
  `city_eng` varchar(30) NOT NULL DEFAULT '' COMMENT '시군구영문',
  `town` varchar(30) NOT NULL DEFAULT '' COMMENT '읍면',
  `town_eng` varchar(30) NOT NULL DEFAULT '' COMMENT '읍면영문',
  `street_code` varchar(12) NOT NULL DEFAULT '' COMMENT '도로명코드',
  `street` varchar(50) NOT NULL DEFAULT '' COMMENT '도로명',
  `street_eng` varchar(50) NOT NULL DEFAULT '' COMMENT '도로명영문',
  `basement` char(1) NOT NULL DEFAULT '' COMMENT '지하여부',
  `building1` varchar(5) NOT NULL DEFAULT '' COMMENT '건물번호본번',
  `building2` varchar(5) NOT NULL DEFAULT '' COMMENT '건물번호부번',
  `building_manage` varchar(25) NOT NULL DEFAULT '' COMMENT '건물관리번호',
  `building_city` varchar(75) NOT NULL DEFAULT '' COMMENT '시군구용건물명',
  `dong_code` varchar(10) NOT NULL DEFAULT '' COMMENT '법정동코드',
  `dong` varchar(30) NOT NULL DEFAULT '' COMMENT '법정동명',
  `ri` varchar(30) NOT NULL DEFAULT '' COMMENT '리명',
  `dong_admin` varchar(30) NOT NULL DEFAULT '' COMMENT '행정동명',
  `mountain` varchar(4) NOT NULL DEFAULT '' COMMENT '산여부',
  `lotnum1` varchar(4) NOT NULL DEFAULT '' COMMENT '지번본번',
  `serial` varchar(2) NOT NULL DEFAULT '' COMMENT '읍면동일련번호',
  `lotnum2` varchar(4) NOT NULL DEFAULT '' COMMENT '지번부번',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` varchar(50) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_phone` varchar(200) NOT NULL,
  `admin_name` varchar(200) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.answer_sheet 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer_sheet` (
  `multiplechoice_no` int(11) NOT NULL,
  `acount_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '학생아이디',
  `answer_select` enum('1','2','3','4','5') NOT NULL COMMENT '선택한 번호',
  `score` int(11) NOT NULL COMMENT '점수',
  PRIMARY KEY (`multiplechoice_no`,`acount_id`) USING BTREE,
  KEY `FK_answersheet_account` (`acount_id`),
  CONSTRAINT `FK_answersheet_account` FOREIGN KEY (`acount_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_answersheet_multiplechoice` FOREIGN KEY (`multiplechoice_no`) REFERENCES `multiplechoice` (`multiplechoice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.attendance 구조 내보내기
CREATE TABLE IF NOT EXISTS `attendance` (
  `lecture_no` int(11) NOT NULL,
  `account_id` varchar(50) NOT NULL,
  `attendance_day` date NOT NULL,
  `attendance_createdate` datetime NOT NULL,
  `attendance_updatedate` datetime NOT NULL,
  `attendance_state` enum('출석','결석','외출','조퇴','지각') NOT NULL,
  `attendance_remark` text DEFAULT NULL,
  PRIMARY KEY (`lecture_no`,`account_id`,`attendance_day`) USING BTREE,
  KEY `FK_attendance_account` (`account_id`),
  CONSTRAINT `FK_attendance_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_attendance_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.career 구조 내보내기
CREATE TABLE IF NOT EXISTS `career` (
  `career_no` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(50) NOT NULL,
  `career_content` varchar(200) NOT NULL,
  `career_startdate` date NOT NULL,
  `career_enddate` date NOT NULL,
  PRIMARY KEY (`career_no`),
  KEY `FK_career_account` (`account_id`),
  CONSTRAINT `FK_career_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.classroom 구조 내보내기
CREATE TABLE IF NOT EXISTS `classroom` (
  `classroom_no` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_number` int(11) NOT NULL,
  `classroom_size` int(11) NOT NULL,
  `classroom_total` int(11) NOT NULL,
  PRIMARY KEY (`classroom_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.class_registration 구조 내보내기
CREATE TABLE IF NOT EXISTS `class_registration` (
  `class_registration_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '학생들 수강신청목록',
  `lecture_no` int(11) NOT NULL,
  `account_id` varchar(50) NOT NULL,
  `class_registration_state` enum('대기','수강중','수료','과락','취소') NOT NULL,
  `class_registration_point` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `class_registration_review` text DEFAULT NULL,
  `class_registration_createdate` datetime NOT NULL COMMENT '수강신청일',
  PRIMARY KEY (`class_registration_no`),
  KEY `FK_class_registration_account` (`account_id`),
  KEY `FK_class_registration_lecture` (`lecture_no`),
  CONSTRAINT `FK_class_registration_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_class_registration_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.class_registration_cancel 구조 내보내기
CREATE TABLE IF NOT EXISTS `class_registration_cancel` (
  `class_registration_no` int(11) NOT NULL,
  `cancel_createdate` datetime NOT NULL,
  `cancel_content` varchar(200) NOT NULL,
  PRIMARY KEY (`class_registration_no`),
  CONSTRAINT `FK__class_registration` FOREIGN KEY (`class_registration_no`) REFERENCES `class_registration` (`class_registration_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.education 구조 내보내기
CREATE TABLE IF NOT EXISTS `education` (
  `education_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '학력(강사,운영자)',
  `account_Id` varchar(50) NOT NULL,
  `education_school` varchar(50) NOT NULL COMMENT '학교',
  `education_major` varchar(50) NOT NULL COMMENT '전공',
  `education_startdate` date NOT NULL COMMENT '입학일',
  `education_enddate` date NOT NULL COMMENT '졸업일',
  PRIMARY KEY (`education_no`),
  KEY `FK_education_account` (`account_Id`),
  CONSTRAINT `FK_education_account` FOREIGN KEY (`account_Id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.faq 구조 내보내기
CREATE TABLE IF NOT EXISTS `faq` (
  `faq_no` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(50) NOT NULL,
  `faq_writer` varchar(50) NOT NULL DEFAULT '0',
  `faq_title` varchar(200) NOT NULL,
  `faq_content` text NOT NULL,
  `faq_createdate` datetime NOT NULL,
  `faq_updatedate` datetime NOT NULL,
  `faq_count` int(11) NOT NULL DEFAULT 0,
  `faq_category` varchar(50) NOT NULL,
  PRIMARY KEY (`faq_no`),
  KEY `FK_faq_account` (`account_id`),
  KEY `FK_faq_faq_category` (`faq_category`),
  CONSTRAINT `FK_faq_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_faq_faq_category` FOREIGN KEY (`faq_category`) REFERENCES `faq_category` (`faq_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.faq_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `faq_category` (
  `faq_category` varchar(50) NOT NULL,
  PRIMARY KEY (`faq_category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecture_no` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(50) NOT NULL,
  `subject_no` int(11) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `lecture_name` varchar(50) NOT NULL,
  `textbook_isbn` int(11) NOT NULL,
  `lecture_startdate` date NOT NULL,
  `lecture_enddate` date NOT NULL,
  `lecture_total` int(11) NOT NULL COMMENT '강좌 정원',
  `syllabus_no` int(11) NOT NULL,
  `classroom_no` int(11) NOT NULL,
  `lecture_createdate` datetime NOT NULL,
  `lecture_updatedate` datetime NOT NULL,
  PRIMARY KEY (`lecture_no`),
  KEY `FK_lecture_account` (`account_id`),
  KEY `FK_lecture_subject` (`subject_no`),
  KEY `FK_lecture_textbook` (`textbook_isbn`),
  KEY `FK_lecture_syllabus` (`syllabus_no`),
  KEY `FK_lecture_classroom` (`classroom_no`),
  CONSTRAINT `FK_lecture_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_lecture_classroom` FOREIGN KEY (`classroom_no`) REFERENCES `classroom` (`classroom_no`),
  CONSTRAINT `FK_lecture_subject` FOREIGN KEY (`subject_no`) REFERENCES `subject` (`subject_no`),
  CONSTRAINT `FK_lecture_syllabus` FOREIGN KEY (`syllabus_no`) REFERENCES `syllabus` (`syllabus_no`),
  CONSTRAINT `FK_lecture_textbook` FOREIGN KEY (`textbook_isbn`) REFERENCES `textbook` (`textbook_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.lecture_archive 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_archive` (
  `lecture_archive_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `account_id` varchar(50) NOT NULL,
  `lecture_archive_writer` varchar(50) NOT NULL,
  `lecture_archive_title` varchar(200) NOT NULL,
  `lecture_archive_content` text NOT NULL,
  `lecture_archive_createdate` datetime NOT NULL,
  `lecture_archive_updatedate` datetime NOT NULL,
  `lecture_archive_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`lecture_archive_no`),
  KEY `FK_lecture_archive_lecture` (`lecture_no`),
  KEY `FK_lecture_archive_account` (`account_id`),
  CONSTRAINT `FK_lecture_archive_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_lecture_archive_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.lecture_archive_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_archive_file` (
  `lecture_archive_file_uuid` varchar(500) NOT NULL,
  `lecture_archive_file_original` varchar(500) NOT NULL,
  `lecture_archive_no` int(11) NOT NULL,
  `lecture_archive_file_size` int(11) NOT NULL,
  `lecture_archive_file_type` varchar(50) NOT NULL,
  `lecture_archive_file_count` int(11) NOT NULL DEFAULT 0,
  `lecture_archive_file_createdate` datetime NOT NULL,
  PRIMARY KEY (`lecture_archive_file_uuid`),
  KEY `FK__lecture_archive` (`lecture_archive_no`),
  CONSTRAINT `FK__lecture_archive` FOREIGN KEY (`lecture_archive_no`) REFERENCES `lecture_archive` (`lecture_archive_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.lecture_notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_notice` (
  `lecture_notice_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `lecture_notice_title` varchar(200) NOT NULL,
  `lecture_notice_content` text NOT NULL,
  `lecture_notice_createdate` datetime NOT NULL,
  `lecture_notice_updatedate` datetime NOT NULL,
  `lecture_notice_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`lecture_notice_no`) USING BTREE,
  KEY `FK_lecture_notice_lecture` (`lecture_no`),
  CONSTRAINT `FK_lecture_notice_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.license 구조 내보내기
CREATE TABLE IF NOT EXISTS `license` (
  `license_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto increment',
  `account_id` varchar(50) NOT NULL,
  `license_number` varchar(200) NOT NULL COMMENT '자격증 번호',
  `license_name` varchar(200) NOT NULL COMMENT '자격증 이름',
  `license_agency` varchar(200) NOT NULL COMMENT '자격증 발급처',
  `license_getdate` date NOT NULL COMMENT '자격증 발급일',
  PRIMARY KEY (`license_no`),
  KEY `FK_license_account` (`account_id`),
  CONSTRAINT `FK_license_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.lms_notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `lms_notice` (
  `lms_notice_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시글 번호',
  `account_id` varchar(50) NOT NULL COMMENT '작성자 아이디',
  `lms_notice_writer` varchar(50) NOT NULL COMMENT '작성자 이름',
  `lms_notice_title` varchar(200) NOT NULL,
  `lms_notice_content` text NOT NULL,
  `lms_notice_createdate` datetime NOT NULL,
  `lms_notice_updatedate` datetime NOT NULL,
  `lms_notice_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`lms_notice_no`),
  KEY `FK_lms_notice_account` (`account_id`),
  CONSTRAINT `FK_lms_notice_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager` (
  `manager_id` varchar(50) NOT NULL,
  `manager_email` varchar(200) NOT NULL,
  `manager_phone` varchar(50) NOT NULL,
  `manager_name` varchar(50) NOT NULL,
  `manager_gender` enum('남','여') NOT NULL,
  `manager_birth` date NOT NULL,
  `manager_position` enum('대리','사원','팀장') DEFAULT NULL,
  `manager_address_main` text NOT NULL,
  `manager_address_sub` text NOT NULL,
  `manager_image` varchar(200) DEFAULT NULL,
  `manager_accessdate` datetime NOT NULL,
  `manager_updatedate` datetime NOT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `manager_email` (`manager_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.manager_queue 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager_queue` (
  `manager_id` varchar(50) NOT NULL,
  `manager_email` varchar(200) NOT NULL,
  `manager_phone` varchar(50) NOT NULL,
  `manager_name` varchar(50) NOT NULL,
  `manager_gender` enum('남','여') NOT NULL,
  `manager_birth` date NOT NULL,
  `manager_address_main` text NOT NULL,
  `manager_address_sub` text NOT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `manager_email` (`manager_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.multiplechoice 구조 내보내기
CREATE TABLE IF NOT EXISTS `multiplechoice` (
  `multiplechoice_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `multiplechoice_id` int(11) NOT NULL,
  `multiplechoice_question` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `multiplechoice_answer` enum('1','2','3','4','5') NOT NULL,
  `multiplechoice_createdate` datetime NOT NULL,
  `multiplechoice_updatedate` datetime NOT NULL,
  PRIMARY KEY (`multiplechoice_no`),
  KEY `FK_multiplechoice_lecture` (`lecture_no`),
  CONSTRAINT `FK_multiplechoice_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.multiplechoice_example 구조 내보내기
CREATE TABLE IF NOT EXISTS `multiplechoice_example` (
  `multiplechoice_example_no` int(11) NOT NULL AUTO_INCREMENT,
  `multiplechoice_no` int(11) NOT NULL,
  `multiplechoice_example_id` enum('1','2','3','4','5') CHARACTER SET utf8mb4 NOT NULL,
  `multiplechoice_example_content` text CHARACTER SET utf8mb4 NOT NULL,
  `multiplechoice_example_createdate` datetime NOT NULL,
  `multiplechoice_example_updatedate` datetime NOT NULL,
  PRIMARY KEY (`multiplechoice_example_no`,`multiplechoice_no`,`multiplechoice_example_id`) USING BTREE,
  KEY `FK_multiplechoice_example_multiplechoice` (`multiplechoice_no`) USING BTREE,
  CONSTRAINT `FK_multiplechoice_example_multiplechoice` FOREIGN KEY (`multiplechoice_no`) REFERENCES `multiplechoice` (`multiplechoice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.question 구조 내보내기
CREATE TABLE IF NOT EXISTS `question` (
  `question_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `account_id` varchar(50) NOT NULL,
  `question_writer` varchar(50) NOT NULL COMMENT '작성자 이름',
  `question_title` varchar(200) NOT NULL,
  `question_context` text NOT NULL,
  `question_createdate` datetime NOT NULL,
  `question_updatedate` datetime NOT NULL,
  `question_count` int(11) NOT NULL DEFAULT 0,
  `question_password` varchar(50) DEFAULT NULL COMMENT '비밀글',
  PRIMARY KEY (`question_no`),
  KEY `FK_question_lecture` (`lecture_no`),
  KEY `FK_question_account` (`account_id`),
  CONSTRAINT `FK_question_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_question_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.question_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `question_comment` (
  `question_comment_no` int(11) NOT NULL AUTO_INCREMENT,
  `question_no` int(11) NOT NULL,
  `account_id` varchar(50) NOT NULL,
  `question_comment_writer` varchar(50) NOT NULL,
  `question_comment_content` mediumtext NOT NULL,
  `question_comment_createdate` datetime NOT NULL,
  `question_comment_updatedate` datetime NOT NULL,
  PRIMARY KEY (`question_comment_no`),
  KEY `FK__question` (`question_no`),
  KEY `FK__account` (`account_id`),
  CONSTRAINT `FK__account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK__question` FOREIGN KEY (`question_no`) REFERENCES `question` (`question_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.question_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `question_file` (
  `question_file_uuid` varchar(500) NOT NULL,
  `question_file_original` varchar(500) NOT NULL,
  `question_no` int(11) NOT NULL,
  `question_file_size` int(11) NOT NULL,
  `question_file_type` varchar(50) NOT NULL,
  `question_file_count` int(11) NOT NULL DEFAULT 0,
  `question_file_createdate` datetime NOT NULL,
  PRIMARY KEY (`question_file_uuid`) USING BTREE,
  KEY `FK_question_file_question` (`question_no`),
  CONSTRAINT `FK_question_file_question` FOREIGN KEY (`question_no`) REFERENCES `question` (`question_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.report 구조 내보내기
CREATE TABLE IF NOT EXISTS `report` (
  `report_no` int(11) NOT NULL,
  `lecture_no` int(11) NOT NULL,
  `report_title` varchar(200) NOT NULL,
  `report_content` text NOT NULL,
  `report_createdate` datetime NOT NULL,
  `report_updatedate` datetime NOT NULL,
  `report_startdate` datetime NOT NULL,
  `report_enddate` datetime NOT NULL,
  PRIMARY KEY (`report_no`),
  KEY `FK__lecture` (`lecture_no`),
  CONSTRAINT `FK__lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.report_submit 구조 내보내기
CREATE TABLE IF NOT EXISTS `report_submit` (
  `report_submit_no` int(11) NOT NULL,
  `report_no` int(11) NOT NULL,
  `account_id` varchar(50) NOT NULL,
  `report_submit_writer` varchar(50) NOT NULL,
  `report_submit_createdate` datetime NOT NULL,
  `report_submit_updatedate` datetime NOT NULL,
  `report_submit_title` varchar(200) NOT NULL,
  `report_submit_content` text NOT NULL,
  `report_submit_point` int(11) NOT NULL DEFAULT 0,
  `report_submit_feedback` text DEFAULT NULL,
  PRIMARY KEY (`report_submit_no`),
  KEY `FK_report_submit_report` (`report_no`),
  KEY `FK_report_submit_account` (`account_id`),
  CONSTRAINT `FK_report_submit_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_report_submit_report` FOREIGN KEY (`report_no`) REFERENCES `report` (`report_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.report_submit_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `report_submit_file` (
  `report_submit_file_uuid` varchar(500) NOT NULL,
  `report_submit_file_original` varchar(500) NOT NULL,
  `report_submit_no` int(11) NOT NULL,
  `report_submit_file_size` int(11) NOT NULL,
  `report_submit_file_type` varchar(50) NOT NULL,
  `report_submit_file_count` int(11) NOT NULL DEFAULT 0,
  `report_submit_file_createdate` datetime NOT NULL,
  PRIMARY KEY (`report_submit_file_uuid`),
  KEY `FK_report_submit_file_report_submit` (`report_submit_no`),
  CONSTRAINT `FK_report_submit_file_report_submit` FOREIGN KEY (`report_submit_no`) REFERENCES `report_submit` (`report_submit_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` varchar(50) NOT NULL,
  `student_email` varchar(200) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `student_phone` varchar(50) NOT NULL,
  `student_gender` enum('남','여') NOT NULL,
  `student_birth` date NOT NULL,
  `student_address_main` text NOT NULL,
  `student_address_sub` text NOT NULL,
  `student_image` varchar(200) DEFAULT NULL,
  `student_accessdate` datetime NOT NULL,
  `student_updatedate` datetime NOT NULL,
  `manager_id_access` varchar(50) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_email` (`student_email`),
  KEY `FK_student_account` (`manager_id_access`),
  CONSTRAINT `FK_student_account` FOREIGN KEY (`manager_id_access`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.student_queue 구조 내보내기
CREATE TABLE IF NOT EXISTS `student_queue` (
  `student_id` varchar(50) NOT NULL,
  `student_email` varchar(200) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `student_phone` varchar(50) NOT NULL,
  `student_gender` enum('남','여') NOT NULL,
  `student_birth` date NOT NULL,
  `student_address_main` text NOT NULL,
  `student_address_sub` text NOT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  UNIQUE KEY `student_email` (`student_email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_no` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) NOT NULL COMMENT '과목 이름',
  `subject_createdate` datetime NOT NULL,
  `subject_updatedate` datetime NOT NULL,
  `subject_totalday` int(11) NOT NULL,
  `subject_info` varchar(200) NOT NULL,
  PRIMARY KEY (`subject_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.syllabus 구조 내보내기
CREATE TABLE IF NOT EXISTS `syllabus` (
  `syllabus_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `syllabus_content` text NOT NULL,
  `syllabus_teachersign` varchar(50) NOT NULL,
  `syllabus_managersign` varchar(50) NOT NULL,
  `syllabus_createdate` datetime NOT NULL,
  `syllabus_updatedate` datetime NOT NULL,
  PRIMARY KEY (`syllabus_no`),
  KEY `FK_syllabus_lecture` (`lecture_no`),
  CONSTRAINT `FK_syllabus_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.teacher 구조 내보내기
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` varchar(50) NOT NULL,
  `teacher_email` varchar(200) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_phone` varchar(50) NOT NULL,
  `teacher_gender` enum('남','여') NOT NULL,
  `teacher_birth` date NOT NULL,
  `teacher_address_main` text NOT NULL,
  `teacher_address_sub` text NOT NULL,
  `teacher_image` varchar(200) DEFAULT NULL,
  `teacher_accessdate` datetime NOT NULL,
  `teacher_updatedate` datetime NOT NULL,
  `manager_id_access` varchar(50) NOT NULL,
  `teacher_info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `teacher_email` (`teacher_email`),
  KEY `FK_teacher_account` (`manager_id_access`),
  CONSTRAINT `FK_teacher_account` FOREIGN KEY (`manager_id_access`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.teacher_queue 구조 내보내기
CREATE TABLE IF NOT EXISTS `teacher_queue` (
  `teacher_id` varchar(50) NOT NULL,
  `teacher_email` varchar(200) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_phone` varchar(50) NOT NULL,
  `teacher_gender` enum('남','여') NOT NULL,
  `teacher_birth` date NOT NULL,
  `teacher_address_main` text NOT NULL,
  `teacher_address_sub` text NOT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE,
  UNIQUE KEY `teacher_email` (`teacher_email`),
  CONSTRAINT `FK_teacher_queue_account` FOREIGN KEY (`teacher_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `test_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `test_startdate` datetime NOT NULL COMMENT '시험 시작일',
  `test_enddate` datetime NOT NULL COMMENT '시험 종료일',
  `test_content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '시험내용',
  `test_createdate` datetime NOT NULL,
  `test_updatedate` datetime NOT NULL,
  PRIMARY KEY (`test_no`,`lecture_no`),
  KEY `FK_test_lecture` (`lecture_no`),
  CONSTRAINT `FK_test_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lms.textbook 구조 내보내기
CREATE TABLE IF NOT EXISTS `textbook` (
  `textbook_isbn` int(13) NOT NULL,
  `textbook_title` varchar(200) NOT NULL COMMENT '교재 이름',
  `textbook_writer` varchar(200) NOT NULL COMMENT '교재 저자',
  `textbook_publisher` varchar(200) NOT NULL COMMENT '교재 출판사',
  `textbook_publishdate` date NOT NULL COMMENT '교재 출판일',
  `textbook_info` text NOT NULL COMMENT '교재 정보',
  `textbook_price` int(11) NOT NULL DEFAULT 0 COMMENT '교재 가격',
  PRIMARY KEY (`textbook_isbn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
