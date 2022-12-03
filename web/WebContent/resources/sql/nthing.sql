use nthing;
create table if not exists user(
    user_id VARCHAR(10) NOT NULL,
    user_pw  VARCHAR(10) NOT NULL,
    cart_id int
    PRIMARY KEY (user_id)
    )
create table if not exists nthings(
    n_id VARCHAR(10) NOT NULL,
    n_name VARCHAR(20),
    n_unitPrice INTEGER,
    n_nthinger INTEGER,
    n_totalSalePercent LONG,
    n_description TEXT,
    n_category VARCHAR(20),
    n_writer VARCHAR(10),
    n_writedate VARCHAR(20),
    n_unitsInStock LONG,
    n_sitename VARCHAR(50),
    n_fileName VARCHAR(40),
    PRIMARY KEY (n_id)
    )default CHARSET=utf8;
Alter table nthings MODIFY n_writer varchar(10);
ALTER TABLE nthings modify COLUMN user_id VARCHAR(10) NOT NULL;

alter table nthings modify n_id int(20) unsigned;
alter table nthings modify n_category varchar(20) not null;
Alter table nthings MODIFY n_name varchar(80);
Alter table nthings MODIFY n_sitename varchar(500);
Alter table nthings MODIFY n_fileName varchar(200);

ALTER TABLE nthings MODIFY n_id INT(20) auto_increment NOT NULL;
ALTER TABLE nthings auto_increment = 1;

insert into nthings (n_name, n_unitPrice, n_nthinger, n_totalSalePercent, n_description, n_category, n_writer, n_writedate, n_unitsInStock, n_sitename, n_fileName)values (    '쿠팡베이직 네추럴 3겹 천연펄프 롤화장지 30m 3팩',
                                                                                                                                                                               37490,
                                                                                                                                                                               2,
                                                                                                                                                                               29,
                                                                                                                                                                               '여긱 롤화장지 1팩씩 구매하실 2명 구합니다!',
                                                                                                                                                                               'HOUSE',
                                                                                                                                                                               'sujin',
                                                                                                                                                                               '2022/11/27',
                                                                                                                                                                               2,
                                                                                                                                                                               'https://www.coupang.com/vp/products/328677319?itemId=7859148203&vendorItemId=83067892661&sourceType=CAMPAIGN&campaignId=82&categoryId=115573&isAddedCart=',
                                                                                                                                                                               'NThing1.png');

insert into nthings (n_name, n_unitPrice, n_nthinger, n_totalSalePercent, n_description, n_category, n_writer, n_writedate, n_unitsInStock, n_sitename, n_fileName)values (        '아이시스 8.0 생수',
                                                                                                                                                                                   17770,
                                                                                                                                                                                   3,
                                                                                                                                                                                   6,
                                                                                                                                                                                   '2L 생수 6개씩 나누실 3명 계실까요?!',
                                                                                                                                                                                   'HOUSE',
                                                                                                                                                                                   'yujin',
                                                                                                                                                                                   '2022/11/27',
                                                                                                                                                                                   3,
                                                                                                                                                                                   'https://www.coupang.com/vp/products/6748251873?itemId=14502777312&vendorItemId=72077387727&q=%EC%83%9D%EC%88%98+2%EB%A6%AC%ED%84%B0&itemsCount=36&searchId=68aa8f51414549e996fcd2ef20023b88&rank=1&isAddedCart=',
                                                                                                                                                                                   'NThing2.png');

create table nthingcart(
                           cart_id  int auto_increment primary key,
                           n_id int not null,
                           nthing_count int auto_increment ,
                           n_name varchar(80),
                           n_nthinger int,
                           n_unitPrice int,
                           foreign key (n_id) references nthings(n_id)
)charset=utf8mb4;