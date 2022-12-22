# <!--카테고리별 상품관리-->
create table ctgprd
(
    uid    INT AUTO_INCREMENT PRIMARY KEY,
    c_name varchar(30) NOT NULL
);

# <!--상품관리-->
create table product
(
    uid        INT AUTO_INCREMENT PRIMARY KEY,
    fk_cate    INT         NOT NULL,
    prd_price  varchar(15) NOT NULL,
    prd_cmp    varchar(30) NOT NULL,
    prd_type   varchar(30) NOT NULL,
    prd_img    varchar(255) NOT NULL,
    prd_ment   varchar(50) NOT NULL,
    prd_stock  INT(15)     NOT NULL default 100,
    prd_sales  INT(15)     NOT NULL default 0,
    prd_name   VARCHAR(50) NOT NULL,
    FOREIGN KEY (fk_cate) REFERENCES ctgprd (uid)
);

insert into ctgprd
(c_name) values ("보충제");
insert into ctgprd
(c_name) values ("보조용품");
insert into ctgprd
(c_name) values ("의류");

insert into product
(fk_cate, prd_price, prd_cmp, prd_type, prd_img, prd_ment, prd_name) VALUES
(1, 50000, "마이프로틴", "유청단백", "https://static.thcdn.com/images/small/original//productimg/960/960/10530943-1224889444460882.jpg",
 "세계에서 가장 많이 팔리는 프로틴!", "임팩트 웨이");

insert into product
(fk_cate, prd_price, prd_cmp, prd_type, prd_img, prd_ment, prd_name) VALUES
    (1, 60000, "마이프로틴", "유청단백", "https://static.thcdn.com/images/large/original//productimg/1600/1600/10530911-5884889444360331.jpg",
     "세계에서 가장 건강한 프로틴!", "임팩트 웨이 아이솔레이트");

insert into product
(fk_cate, prd_price, prd_cmp, prd_type, prd_img, prd_ment, prd_name) VALUES
    (1, 45000, "마이프로틴", "크레아틴", "https://static.thcdn.com/images/large/original/productimg/1600/1600/10530050-9574620647469231.jpg",
     "강한 나를 만들어주는 마법의 비약 크레아틴!", "크레아틴 모노 하이드레이트");
