
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
('คณิศร ชัยวิชาชาญ','ใต้ฟ้า','บนดิน','หาดใหญ่','หาดใหญ่','สงขลา','90110');



DROP TABLE category;

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

DROP TABLE product;

CREATE TABLE product (
    productid integer NOT NULL,
    productname varchar(100) NOT NULL,
    productcategory integer NOT NULL,
    productforage varchar(3),
    materialofproduct varchar(200),
    productdescription varchar(500),
    productPrice decimal(10,2) NOT NULL,
    PRIMARY KEY (productid),
    CONSTRAINT product_pro_cate FOREIGN KEY (productcategory) REFERENCES category (categoryid)
);

INSERT INTO product (productid,productname,productcategory,productforage,materialofproduct,productdescription,productPrice) VALUES
(1,'Peek-a-Boo Barn Baby & Toddler Toy',2,'1','ไม้คุณภาพดี ขอบมน ขัดอย่างดี ของเล่นเข้าปากได้โดยไม่เป็นอันตราย','ดึงดูดความสนใจของเด็กได้ ด้วยวิธีเล่นง่าย ๆ แบบเปิด - ปิดเห็นสัตว์ที่ซ่อนอยู่เป็นในบ้าน เหมือนเล่นซ่อนแอบ เปิดประตูหาตัวสัตว์ พลิกได้ กลับได้ เปิดได้ ปิดได้ ของเล่นเหมาะสำหรับเด็กเล็ก ส่งเสริมให้เล่นและคิดค้นค้นหาด้วยตนเอง',395),
(2,'Farm Animals Touch and Feel Puzzle',1,'1','ไม้คุณภาพดี','Touch & Feel Puzzle แต่ละชิ้นที่เป็นรูปสัตว์จะมีผ้า หรือพื้นผิวที่มี texture แตกต่างกัน บางอันนุ่ม บางอันขรุขระ บางอันข้นสั้น บางอันเรียบ บางอันเป็นหนัง ส่งเสริมให้เด็ก ๆ ได้ทดลองจับ ทดสอบ และ เรียนรู้ถึงความรู้สึก ตื่นเต้นและน่าสนใจสำหรับเด็กเล็ก ๆ ชิ้นใหญ่ จับง่าย ส่งเสริมให้เด็กมีความสนใจกับการสำรวจสิ่งรอบข้างได้เป็นอย่างดี ทำจากไม้คุณภาพดีทั้งหมด เหมาะสำหรับเป็นพัซเซิลแรก ๆ ของเด็ก
',595),
(3,'House Pets Jumbo Knob',2,'1','พัซเซิลขอบมน ทำจากไม้คุณภาพดี','พัซเซิลเป็นของเล่นที่ส่งเสริมพัฒนาการเด็ก ๆ ได้ดี โดยเริ่มเป็นพัซเซิลชิ้นจัมโบ้ ตุ่มใหม่พิเศษ ฝึกการเรียนรู้การบังคับมือกล้ามเนื้อมัดใหญ่ การคิดและเห็นภาพที่สอดคล้อง การแก้ปัญหา และฝึกให้เล่นจากง่าย ๆ ก่อน อย่างพัซเซิลนี้เป็นต้นไป แล้วจะได้ไปต่อยอดพัซเซิลหลากชิ้นยาก ๆ ขึ้นได้อีก',650),
(4, 'First Bead Maze',2,'1','ทำจากไม้อย่างดี ใช้สีและวัสดุทั้งหมดที่ปลอดภัยกับเด็ก และฐานที่ทำจากจุกยางสูญญากาศ','สีสันสดใสและรูปร่างเล็ก ๆ หลากหลายแบบช่วยดึงดูดความสนใจ ส่งเสริมให้เด็กเล็กเรียนรู้สี การแยกแยะรูปร่าง ช่วยฝึกการบังคับมือและการตอบสนองของมือด้วย ชิ้นส่วนทั้งหมดร้อยอยู่ในห่วง จึงปลอดภัยกับเด็กเล็ก นิยมมากที่ในเนอร์เซอรี่เด็กในอเมริกา มาพร้อมจุกยางที่ฐาน เอาไปติดกับพื้นหรือบนเก้าอี้กินข้าวของเด็กก็ได้',895),
(5, 'Clacking Key Ring',2,'1','ทำจากวัสดุและสีที่ปลอดภัยทุกชนิด ทนทาน เข้าปากได้ไม่เป็นอันตราย','ห่วงคล้องเก็บกุญแจและมีที่เสียบไขได้จริง กุญแจ 4 ดอก หลากสีและรูปร่าง เรียนรู้การบังคับมือให้ตอบสนองกับสมอง เรียนรู้สี และรูปร่างได้อย่างสนุก ชุดเล่นไขกุญแจชุดนี้เหมาะสำหรับเป็นของเล่นไม้แรก ๆ ของเด็ก ๆ เล่นไขกุญแจ เสียบ ถอดกุญแจ สังเกตุรูปร่างและสีที่แตกต่าง เขย่าให้เกิดเสียง เสียบเข้า ถอดออก และหมุนกุญแจเล่นได้อย่างไม่สิ้นสุด',495),
(6,'Shopping Cart',1,'1','ทำจากเหล็กอย่างดี คุณภาพดี ทนทาน','รถเข็นเล็ก ๆ ขนาดเหมาะสำหรับน้อง ๆ ช่วยพยุงตัวตอนกำลังหัดเดินได้ด้วย เหมือนรถเข็นในซูเปอร์เลยแต่ขนาดเล็ก ๆ สำหรับเด็ก เข็นได้จริง สวมบทบาทซื้อของเหมือนคุณแม่ ความจุสูง',3700),
(7,'Match & Roll Shape Sorter',2,'1','ทำจากวัสดุและสีที่ปลอดภัยทุกชนิด ทนทาน เข้าปากได้ไม่เป็นอันตราย','บล็อกหยอดที่เสริมทักษะพื้นฐานจำเป็นของน้อง ๆ แล้ว ยังกลิ้งและหมุนได้ด้วย หมุนเพื่อหาด้านที่สอดคล้องกับสี กลิ้งเพื่อดูการหมุน การไหล และใส่ให้ตรงช่อง',1095),
(8,'Maritime Mates Boat Parade',4,'1','ทำจากพลาสติก ทนทาน และเข้าปากได้ไม่เป็นอันตราย','ของเล่นลอยน้ำรูปเรือ 3  ลำ มีสีสนสดใส เพื่อเพิ่มความสนุกระหว่างการอาบน้ำ หรือการเล่นน้ำในสระ โดยจะมีหมุดพลาสติกติดอยู่ที่เรือแต่ละลำ เมื่อหมุนที่หมุนนั้นจะทำให้เรือสามารถแล่นได้',695),
(9,'Toolbox Fill and Spill',1,'1','ทำจากผ้าคุณภาพดี','ชุดเล่นเครื่องมือ ทำจากวัสดุผ้าคุณภาพดีทั้งหมด เหมาะสำหรับเด็ก ๆ ที่เพิ่งเริ่มหัดเล่นการสวมบทบาท การเลียนแบบคนรอบข้าง ส่งเสริมการเล่นอย่างมีจินตนาการ ฝึกการบังคับมือให้สอดคล้องกับสมอง',1395),
(10,'Stacking Cars Baby & Toddler Toy',1,'1','ทำจากไม้ขอบมน สีที่ปลอดภัย และล้อที่ทำจากพลาสติก','รถเข็นของเล่น มาพร้อมรถทั้งหมด 3 คัน จับรถแล้วหมุน ๆ ดัน ๆ เหมาะสำหรับเด็กเล็กๆที่ชอบการเคลื่อนไหว ส่งเสริมพัฒนาการเรียนรู้ ความสอดคล้องของการบังคับมือ เล่นสนุก หลากสี เล่นง่าย ทำจากวัสดุปลอดภัยสำหรับเด็กเล็ก ๆ โดยเฉพาะ',495)
;

DROP TABLE history;

CREATE TABLE history (
  historyid int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  email varchar(50) NOT NULL,
  orderdate date NOT NULL,
  totalprice decimal(8,2) NOT NULL,
  time timestamp NOT NULL ,
  totalQuantity int NOT NULL,
  PRIMARY KEY (historyid),
  CONSTRAINT email_email FOREIGN KEY (email) REFERENCES account (email) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;

DROP TABLE historydetail;

CREATE TABLE historydetail (
  productbuyid int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  historyid int NOT NULL,
  productid integer NOT NULL,
  productquantity  int NOT NULL,
  productprice decimal(8,2) NOT NULL,
  PRIMARY KEY (productbuyid),
  CONSTRAINT productid_productid FOREIGN KEY (productid) REFERENCES product (productid) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT historyid_historyid FOREIGN KEY (historyid) REFERENCES history (historyid) ON DELETE NO ACTION ON UPDATE NO ACTION
);



