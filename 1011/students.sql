create table `students`(
    `이름` varchar(20) not null,
    `입학연도` int(4) not null,
    `전공` int(3) not null,
    `개별번호` int(3) not null,
    `전화번호` int(11) not null,
    `주소` varchar(50) not null,
    `누적이수학점` int(3) DEFAULT 0,
    `평균평점` double(2,1) DEFAULT 0.0,
    `재학여부` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
