--작품 정보
create contents (
 c_num number not null,
 title varchar2(50) not null,
 poster varchar2(15) not null,
 release date not null,
 country varchar2(15) not null,
 genre varchar2(15) not null,
 tomato number,
 plot clob not null,
 produce varchar2(50) not null,
 grade number not null,
 category_num number not null,
 ott_num number not null,
 constraint contents_pk primary key (c_num),
 constraint contents_fk1 foreign key (category_num) references category (category_num),
 constraint contents_fk2 foreign key (ott_num) references ott (ott_num)
);

create sequence contents_seq;

--카테고리 
create category (
 category_num number not null,
 category_name varchar2(100) not null,
 ott_num number not null,
 constraint categroy_pk primary key (category_num),
 constraint category_fk foreign key (ott_num) references ott (ott_num)
);

create sequence category_seq;

--회원 상세
create table member_detail(
   member_num number not null,
   passwd varchar2(12) not null,
   name varchar2(10) not null,
   phone varchar2(15) not null,
   email varchar2(50) not null,
   birth varchar2(10) not null,
   reg_date date default sysdate not null ,
   mod_date date,
   constraint member_detail_pk primary key (member_num),
   constraint member_detail_fk foreign key (member_num) references member (member_num)
)

--좋아요
create table like (
   like_num number not null,
   c_review_num number not null,
   member_num not null,
   constraint like_pk primary key (like_num),
   constraint like_fk1 foreign key (c_review_num) references c_review (c_review_num)
   constraint like_fk2 foreign key (member_num) references member (member_num)
)

create sequence like_seq;

--회원관리
create table member(
 member_num number not null,
 member_id varchar2(15) unique not null,
 auth number(1) default 1 not null, --회원등급:0탈퇴,1일반,2관리자
 constraint member_pk primary key (member_num)
);

create sequence member_seq;

--작품별점
create table c_star(
 c_star_num number not null,
 star number not null,
 c_num number not null,
 member_num number not null,
 constraint c_star_pk primary key (c_star_num),
 constraint c_star_fk1 foreign key (c_num) references contents (c_num),
 constraint c_star_fk2 foreign key (member_num) references member (member_num)
);
create sequence c_star_seq;

--작품 리뷰 
create table c_review (
 c_review_num number not null,
 c_review_reg_date date default sysdate not null,
 c_review_mod_date date,
 c_review_content clob ,
 c_star_num number not null,
 member_num number not null,
 c_num number not null,
 constraint c_review_pk primary key(c_review_num),
 constraint c_review_fk1 foreign key (c_star_num) references c_star (c_star_num),
 constraint c_review_fk2 foreign key (member_num) references member (member_num),
 constraint c_review_fk3 foreign key (c_num) references contents (c_num)
);

create sequence c_review_seq;

-- 리뷰 대댓글
create table c_review_com(
com_num number not null,
com_contents clob not null,
com_reg_date date not null,
c_review_num number not null, 
member_num number not null, 
c_num number not null, 
constraint c_review_com_pk primary key(com_num),
constraint c_review_com_fk1 foreign key (c_review_num) references c_review (c_review_num), 
constraint c_review_com_fk2 foreign key (member_num) references member (member_num),
constraint c_review_com_fk3 foreign key(c_num) references contents (c_num)
);

create sequence c_review_seq;

--OTT 
create table ott(
 ott_num number not null,
 ott_name varchar2(10) not null,
 ott_content clob not null,
 ott_url varchar2(100) not null,
 constraint ott_pk primary key (ott_num)
);

create sequence ott_seq;

--ott 별점
create table ott_star(
 ott_star_num number not null,
 price number(1) not null,
 usability number(1) not null,
 quality number(1) not null,
 ott_num number not null,
 member_num number not null,
 constraint ott_star_pk primary key(ott_star_num),
 constraint ott_star_fk1 foreign key(ott_num) references ott (ott_num),
 constraint ott_star_fk2 foreign key(member_num) references member (member_num)
);

create sequence ott_star_seq;

--ott 리뷰
 create table ott_review(
 ott_review_num number not null,
 ott_review varchar2(100),
 reg_date date not null,
 ott_star_num number not null,
 ott_num number not null,
 member_num number not null,
 constraint ott_review_pk primary key(ott_review_num),
 constraint ott_review_fk1 foreign key(ott_star_num) references ott_star (ott_star_num),
 constraint ott_review_fk2 foreign key(ott_num) references ott (ott_num),
 constraint ott_review_fk3 foreign key(member_num) references member (member_num)
);

create sequence ott_review_seq;