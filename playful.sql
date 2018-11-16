
DROP TABLE account;

CREATE TABLE account (
    email varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    PRIMARY KEY (email)
) ;



DROP TABLE address;

CREATE TABLE address (
    addressid integer NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    receivername varchar(50) NOT NULL,
    addressline1 varchar(100) NOT NULL,
    addressline2 varchar(100),
    district varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    province varchar(50) NOT NULL,
    postalcode varchar(5) NOT NULL,
    PRIMARY KEY (addressid)
);

DROP TABLE customer;

CREATE TABLE customer (
    email varchar(50) NOT NULL,
    firstname varchar(50) NOT NULL,
    lastname varchar(50) NOT NULL,
    phonenumber varchar(10) NOT NULL,
    lastaddress integer,
    PRIMARY KEY (email),
    CONSTRAINT account_cus_id FOREIGN KEY (email) REFERENCES account (email),
    CONSTRAINT account_cus_add FOREIGN KEY (lastaddress) REFERENCES address (addressid)
);

INSERT INTO account(email,password) values
('khanysorn@outlook.com','e1adc3949ba59abbe56e057f2f883e');

INSERT INTO address(receivername,addressline1,addressline2,district,city,province,postalcode) values 
('คณิศร ชัยวิชาชาญ','ใต้ฟ้า','บนดิน','หาดใหญ่','หาดใหญ่','สงขลา',90110);

DROP TABLE product;

CREATE TABLE category (
    categoryid integer NOT NULL,
    categoryname varchar(50) NOT NULL,
    PRIMARY KEY(categoryid)
);

INSERT INTO category(categoryid,categoryname) values 
(1,'ด้านร่างกายและการเคลื่อนไหว'),
(2,'ด้านสติปัญญาและการเรียนรู้'),
(3,'ด้านภาษาและการสื่อสาร'),
(4,'ด้านอารมณ์และสังคม');

CREATE TABLE product (
    productid integer NOT NULL,
    productname varchar(100) NOT NULL,
    productcategory integer NOT NULL,
    productforage varchar(3),
    materialofproduct varchar(50),
    productdescription varchar(500),
    productPrice decimal(10,2) NOT NULL,
    PRIMARY KEY (productid),
    CONSTRAINT product_pro_cate FOREIGN KEY (productcategory) REFERENCES category (categoryid),
);

INSERT INTO product (productid,productname,productcategory,productforage,materialofproduct,productdescription,productPrice) VALUES
(1,'Peek-a-Boo Barn Baby & Toddler Toy',2,'1','ไม้คุณภาพดี ขอบมน ขัดอย่างดี ของเล่นเข้าปากได้โดยไม่เป็นอันตราย','ดึงดูดความสนใจของเด็กได้ ด้วยวิธีเล่นง่าย ๆ แบบเปิด - ปิดเห็นสัตว์ที่ซ่อนอยู่เป็นในบ้าน เหมือนเล่นซ่อนแอบ เปิดประตูหาตัวสัตว์ พลิกได้ กลับได้ เปิดได้ ปิดได้ ของเล่นเหมาะสำหรับเด็กเล็ก ส่งเสริมให้เล่นและคิดค้นค้นหาด้วยตนเอง',395),
(2,'Farm Animals Touch and Feel Puzzle',1,'1','ไม้คุณภาพดี','Touch & Feel Puzzle แต่ละชิ้นที่เป็นรูปสัตว์จะมีผ้า หรือพื้นผิวที่มี texture แตกต่างกัน บางอันนุ่ม บางอันขรุขระ บางอันข้นสั้น บางอันเรียบ บางอันเป็นหนัง ส่งเสริมให้เด็ก ๆ ได้ทดลองจับ ทดสอบ และ เรียนรู้ถึงความรู้สึก ตื่นเต้นและน่าสนใจสำหรับเด็กเล็ก ๆ ชิ้นใหญ่ จับง่าย ส่งเสริมให้เด็กมีความสนใจกับการสำรวจสิ่งรอบข้างได้เป็นอย่างดี ทำจากไม้คุณภาพดีทั้งหมด เหมาะสำหรับเป็นพัซเซิลแรก ๆ ของเด็ก
',595),
(3,'House Pets Jumbo Knob',2,'1','พัซเซิลขอบมน ทำจากไม้คุณภาพดี','พัซเซิลเป็นของเล่นที่ส่งเสริมพัฒนาการเด็ก ๆ ได้ดี โดยเริ่มเป็นพัซเซิลชิ้นจัมโบ้ ตุ่มใหม่พิเศษ ฝึกการเรียนรู้การบังคับมือกล้ามเนื้อมัดใหญ่ การคิดและเห็นภาพที่สอดคล้อง การแก้ปัญหา และฝึกให้เล่นจากง่าย ๆ ก่อน อย่างพัซเซิลนี้เป็นต้นไป แล้วจะได้ไปต่อยอดพัซเซิลหลากชิ้นยาก ๆ ขึ้นได้อีก',650)
;

