CREATE TABLE `User` (
	`user_id`	varchar(20)	NOT NULL,
	`user_pwd`	varchar(40)	NOT NULL,
	`user_nm`	varchar(40)	NOT NULL,
	`user_email`	varchar(40)	NOT NULL,
	`user_rgd`	dateTime	NOT NULL	DEFAULT now(),
	`rprt_cnt`	int	NOT NULL	DEFAULT 0,
	`user_role`	varchar(10)	NOT NULL	DEFAULT normal
);

CREATE TABLE `board` (
	`board_no`	int	NOT NULL,
	`board_title`	varchar(200)	NOT NULL,
	`board_main`	varchar(5000)	NULL,
	`board_star`	int	NOT NULL,
	`rprt_cnt`	int	NOT NULL	DEFAULT 0,
	`board_rgd`	dateTime	NOT NULL	DEFAULT now(),
	`board_catecd`	int	NOT NULL,
	`board_ cate`	varchar(10)	NOT NULL,
	`user_id`	varchar(20)	NOT NULL,
	`board_addr`	varchar(200)	NULL,
	`board_cnt`	int	NOT NULL	DEFAULT 0,
	`place_title`	varchar(100)	NULL
);

CREATE TABLE `comment` (
	`cno`	int	NOT NULL,
	`board_no`	int	NOT NULL,
	`content`	varchar(300)	NOT NULL,
	`regdate`	dateTime	NULL	DEFAULT now(),
	`writer`	varchar(30)	NOT NULL,
	`cmm_level`	int	NOT NULL
);

CREATE TABLE `dashboard_V` (
	`day_user`	int	NOT NULL	DEFAULT 0,
	`day_board`	int	NOT NULL	DEFAULT 0,
	`day_comment`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `likeList` (
	`user_id`	varchar(20)	NOT NULL,
	`board_no`	int	NOT NULL
);

CREATE TABLE `fileUpload` (
	`file_no`	int	NOT NULL,
	`board_no`	int	NOT NULL,
	`file_name`	varchar(30)	NOT NULL,
	`ori_file_name`	varchar(100)	NOT NULL,
	`file_path`	varchar(200)	NULL,
	`file_cate`	varchar(200)	NULL
);

ALTER TABLE `User` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`board_no`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`cno`,
	`board_no`
);

ALTER TABLE `likeList` ADD CONSTRAINT `PK_LIKELIST` PRIMARY KEY (
	`user_id`,
	`board_no`
);

ALTER TABLE `fileUpload` ADD CONSTRAINT `PK_FILEUPLOAD` PRIMARY KEY (
	`file_no`,
	`board_no`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_board_TO_comment_1` FOREIGN KEY (
	`board_no`
)
REFERENCES `board` (
	`board_no`
);

ALTER TABLE `likeList` ADD CONSTRAINT `FK_User_TO_likeList_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `User` (
	`user_id`
);

ALTER TABLE `likeList` ADD CONSTRAINT `FK_board_TO_likeList_1` FOREIGN KEY (
	`board_no`
)
REFERENCES `board` (
	`board_no`
);

ALTER TABLE `fileUpload` ADD CONSTRAINT `FK_board_TO_fileUpload_1` FOREIGN KEY (
	`board_no`
)
REFERENCES `board` (
	`board_no`
);

