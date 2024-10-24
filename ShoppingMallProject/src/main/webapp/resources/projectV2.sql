-----[������ �������� ����]-----
--projectV2 ���� �߰�/���̺� �����̽� ���� �� �Ҵ緮 ������ ����/���� �Ҵ�
CREATE USER projectV2 IDENTIFIED BY oracle ACCOUNT UNLOCK;
alter user projectV2 default tablespace users quota unlimited on users ;
grant connect, resource to projectV2;


-----[������ projectV2 �������� ����]-----

-----[PRODUCT_CATEGORY]------------------------------------------------------------
--PRODUCT_CATEGORY ���̺� ����
CREATE TABLE PRODUCT_CATEGORY (
    CATEGORY_ID NUMBER(10) NOT NULL, 
    PARENTS_CATEGORY_ID NUMBER(10) NULL,  
    CATEGORY_NAME VARCHAR2(255) NOT NULL,
    CATEGORY_LEVEL NUMBER(1) NOT NULL,
    CONSTRAINT CHK_CATEGORY_LEVEL CHECK (CATEGORY_LEVEL IN (1, 2, 3)), -- ���̴� 3�� �ִ�� ����, HTML �����ؾ� ��
    CONSTRAINT PK_CATEGORY PRIMARY KEY (CATEGORY_ID),
    CONSTRAINT FK_CATEGORY_PARENT FOREIGN KEY (PARENTS_CATEGORY_ID)  
    REFERENCES PRODUCT_CATEGORY (CATEGORY_ID)
);

--CATEGORY_ID Į���� ������ ����
CREATE SEQUENCE CATEGORY_SEQ 
START WITH 1 
INCREMENT BY 1 
NOCACHE 
NOCYCLE;  

--������ ������ �������� CATEGORY_ID Į���� Ʈ���� ����
CREATE OR REPLACE TRIGGER TRG_CATEGORY_ID
BEFORE INSERT ON PRODUCT_CATEGORY
FOR EACH ROW
BEGIN
    :NEW.CATEGORY_ID := CATEGORY_SEQ.NEXTVAL;  -- ���������� �� ��������
END TRG_CATEGORY_ID;  -- Ʈ���� �̸��� �ٿ��� ����
/


-----[PRODUCT]------------------------------------------------------------
CREATE TABLE PRODUCT (
    PRODUCT_ID NUMBER(10) NOT NULL, 
    CATEGORY_ID NUMBER(10) NULL,
    PRODUCT_NAME VARCHAR2(150) NOT NULL,
    IMG1 VARCHAR2(600) NOT NULL,
    IMG2 VARCHAR2(600) NULL,
    IMG3 VARCHAR2(600) NULL,
    PRODUCT_DESCRIPTION VARCHAR2(1000) NULL,
    PRICE NUMBER(10,2) NOT NULL,
    STOCK_QUANTITY NUMBER(10,2) NOT NULL,
    REGISTRATION_DATE DATE DEFAULT SYSDATE,
    BRAND VARCHAR2(50) NULL,
    STATUS VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_PRODUCT PRIMARY KEY (PRODUCT_ID),
    CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (CATEGORY_ID) 
    REFERENCES PRODUCT_CATEGORY  (CATEGORY_ID)
);

CREATE SEQUENCE PRODUCT_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_PRODUCT_ID
BEFORE INSERT ON PRODUCT
FOR EACH ROW
BEGIN
    :NEW.PRODUCT_ID := PRODUCT_SEQ.NEXTVAL;
END TRG_PRODUCT_ID;
/


-----[PRODUCT_OPTION]------------------------------------------------------------
CREATE TABLE PRODUCT_OPTION (
    OPTION_ID NUMBER(10) NOT NULL, 
    PRODUCT_ID NUMBER(10) NOT NULL,
    OPTION_TYPE VARCHAR2(50) NOT NULL,
    OPTION_NAME VARCHAR2(100) NOT NULL,
    ADDITIONAL_PRICE NUMBER(10,2) NOT NULL,
    OPTION_STOCK_QUANTITY NUMBER(10,2) NOT NULL,
    CONSTRAINT PK_PRODUCT_OPTION PRIMARY KEY (OPTION_ID),
    CONSTRAINT FK_PRODUCT_OPTION_PRODUCT FOREIGN KEY (PRODUCT_ID) 
    REFERENCES PRODUCT (PRODUCT_ID)
);

CREATE SEQUENCE PRODUCT_OPTION_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_OPTION_ID
BEFORE INSERT ON PRODUCT_OPTION
FOR EACH ROW
BEGIN
    :NEW.OPTION_ID := PRODUCT_OPTION_SEQ.NEXTVAL;
END TRG_OPTION_ID;
/


-----[MEMBERS]------------------------------------------------------------
CREATE TABLE MEMBERS (
    MEMBER_ID NUMBER(10) NOT NULL, 
    SIGNUP_ID VARCHAR2(50) UNIQUE NOT NULL,
    MEMBER_NAME VARCHAR2(50) NOT NULL,
    MEMBER_NICKNAME VARCHAR2(50) NOT NULL,
    PASSWORD VARCHAR2(255) NOT NULL,
    MEMBER_EMAIL VARCHAR2(100) UNIQUE NOT NULL,
    PHONE_NUMBER VARCHAR2(15) NOT NULL,
    CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
    UPDATED_AT DATE DEFAULT SYSDATE NULL,
    LAST_LOGIN DATE DEFAULT SYSDATE NOT NULL,
    STATUS NUMBER(1) NOT NULL CHECK (STATUS IN (0,1)),
    BIRTHDAY DATE NOT NULL,
    POINTS NUMBER(10,2) NOT NULL,
    CONSTRAINT PK_MEMBER_ID PRIMARY KEY (MEMBER_ID)
);

CREATE SEQUENCE MEMBERS_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_MEMBER_ID
BEFORE INSERT ON MEMBERS
FOR EACH ROW
BEGIN
    :NEW.MEMBER_ID := MEMBERS_SEQ.NEXTVAL;
END TRG_MEMBER_ID;
/


-----[MEMBER_ADDRESS]------------------------------------------------------------
CREATE TABLE MEMBER_ADDRESS (
    ADDRESS_ID NUMBER(10) NOT NULL, 
    MEMBER_ID NUMBER(10) NOT NULL, 
    RECIPIENT_NAME VARCHAR2(20) NOT NULL,
    ROAD_NAME_ADDRESS VARCHAR2(255) NOT NULL,
    DETAIL_ADDRESS VARCHAR2(50) NULL,
    POSTAL_CODE VARCHAR2(20) NOT NULL,
    PHONE_NUMBER VARCHAR2(15) NOT NULL,
    ADDRESS_ALIAS VARCHAR2(50) NULL,
    IS_DEFAULT NUMBER(1) NOT NULL CHECK (IS_DEFAULT IN (0,1)),
    CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
    UPDATED_AT DATE DEFAULT SYSDATE NULL,
    CONSTRAINT PK_ADDRESS_ID PRIMARY KEY (ADDRESS_ID),
    CONSTRAINT FK_MEMBER_ADDRESS_MEMBERS FOREIGN KEY (MEMBER_ID) 
    REFERENCES MEMBERS (MEMBER_ID)
);

CREATE SEQUENCE MEMBER_ADDRESS_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_ADDRESS_ID
BEFORE INSERT ON MEMBER_ADDRESS
FOR EACH ROW
BEGIN
    :NEW.ADDRESS_ID := MEMBER_ADDRESS_SEQ.NEXTVAL;
END TRG_ADDRESS_ID;
/


-----[CART]------------------------------------------------------------
CREATE TABLE CART (
    CART_ID NUMBER(10) NOT NULL, 
    MEMBER_ID NUMBER(10) NOT NULL,
    CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
    UPDATED_AT DATE DEFAULT SYSDATE NULL,
    CONSTRAINT PK_CART_ID PRIMARY KEY (CART_ID),
    CONSTRAINT FK_CART_MEMBERS FOREIGN KEY (MEMBER_ID) 
    REFERENCES MEMBERS (MEMBER_ID)
);

CREATE SEQUENCE CART_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_CART_ID
BEFORE INSERT ON CART
FOR EACH ROW
BEGIN
    :NEW.CART_ID := CART_SEQ.NEXTVAL;
END TRG_CART_ID;
/


-----[CART_PRODUCT]------------------------------------------------------------
CREATE TABLE CART_PRODUCT (
    CART_PRODUCT_ID NUMBER(10) NOT NULL,
    CART_ID NUMBER(10) NOT NULL, 
    PRODUCT_ID NUMBER(10) NOT NULL, 
    QUANTITY NUMBER(10,2) NOT NULL, 
    ADDED_DATE DATE DEFAULT SYSDATE NOT NULL,
    NOTE VARCHAR2(255) NULL,
    CONSTRAINT PK_CART_PRODUCT_ID PRIMARY KEY (CART_PRODUCT_ID),
    CONSTRAINT FK_CART_PRODUCT_CART FOREIGN KEY (CART_ID) 
    REFERENCES CART (CART_ID),
    CONSTRAINT FK_CART_PRODUCT_PRODUCT FOREIGN KEY (PRODUCT_ID) 
    REFERENCES PRODUCT (PRODUCT_ID)
);

CREATE SEQUENCE CART_PRODUCT_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_CART_PRODUCT_ID
BEFORE INSERT ON CART_PRODUCT
FOR EACH ROW
BEGIN
    :NEW.CART_PRODUCT_ID := CART_PRODUCT_SEQ.NEXTVAL;
END TRG_CART_PRODUCT_ID;
/


-----[ORDERS]------------------------------------------------------------
CREATE TABLE ORDERS (
    ORDER_ID NUMBER(10) NOT NULL,
    MEMBER_ID NUMBER(10) NOT NULL, 
    ORDER_NUMBER VARCHAR2(20) NOT NULL,
    ORDER_DATE DATE DEFAULT SYSDATE NOT NULL,
    TOTAL_AMOUNT NUMBER(10,2) NOT NULL, 
    USED_POINTS NUMBER(10,2) NOT NULL, 
    ORDER_STATUS VARCHAR2(50) NOT NULL,
    PAYMENT_METHOD VARCHAR2(50) NULL,
    EXPECTED_REWARD_AMOUNT NUMBER(10,2) NOT NULL, 
    FINAL_PAYMENT_AMOUNT NUMBER(10,2) NOT NULL, 
    CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
    UPDATED_AT DATE DEFAULT SYSDATE NULL,
    CONSTRAINT PK_ORDER_ID PRIMARY KEY (ORDER_ID),
    CONSTRAINT FK_ORDERS_MEMBERS FOREIGN KEY (MEMBER_ID) 
    REFERENCES MEMBERS (MEMBER_ID)
);

CREATE SEQUENCE ORDERS_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_ORDER_ID
BEFORE INSERT ON ORDERS
FOR EACH ROW
BEGIN
    :NEW.ORDER_ID := ORDERS_SEQ.NEXTVAL;
END TRG_ORDER_ID;
/


-----[ORDER_DETAIL]------------------------------------------------------------
CREATE TABLE ORDER_DETAIL (
    ORDER_DETAIL_ID NUMBER(10) NOT NULL,
    ORDER_ID NUMBER(10) NOT NULL, 
    PRODUCT_ID NUMBER(10) NOT NULL, 
    QUANTITY NUMBER(10,2) NOT NULL, 
    UNIT_PRICE NUMBER(10,2) NOT NULL, 
    TOTAL_PRICE NUMBER(10,2) NOT NULL,
    CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
    UPDATED_AT DATE DEFAULT SYSDATE NULL,
    CONSTRAINT PK_ORDER_DETAIL_ID PRIMARY KEY (ORDER_DETAIL_ID),
    CONSTRAINT FK_ORDER_DETAIL_ORDERS FOREIGN KEY (ORDER_ID) 
    REFERENCES ORDERS (ORDER_ID),
    CONSTRAINT FK_ORDER_DETAIL_PRODUCT FOREIGN KEY (PRODUCT_ID) 
    REFERENCES PRODUCT (PRODUCT_ID)
);

CREATE SEQUENCE ORDER_DETAIL_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_ORDER_DETAIL_ID
BEFORE INSERT ON ORDER_DETAIL
FOR EACH ROW
BEGIN
    :NEW.ORDER_DETAIL_ID := ORDER_DETAIL_SEQ.NEXTVAL;
END TRG_ORDER_ID;
/


-----[SHIPPING]------------------------------------------------------------
CREATE TABLE SHIPPING(
    SHIPPING_ID NUMBER(10) NOT NULL,
    ORDER_ID NUMBER(10) NOT NULL, 
    RECIPIENT_NAME VARCHAR2(20) NOT NULL,
    ROAD_NAME_ADDRESS VARCHAR2(255) NOT NULL,
    DETAIL_ADDRESS VARCHAR2(100) NULL,
    POSTAL_CODE VARCHAR2(20) NOT NULL,
    ADDRESS_ALIAS VARCHAR2(50) NULL,
    PHONE_NUMBER VARCHAR2(15) NOT NULL,
    SHIPPING_STATUS VARCHAR2(50) NOT NULL,
    TRACKING_NUMBER VARCHAR2(100) NULL,
    COURIER_NAME VARCHAR2(50) NOT NULL,
    CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
    UPDATED_AT DATE DEFAULT SYSDATE NULL,
    CONSTRAINT PK_SHIPPING_ID PRIMARY KEY (SHIPPING_ID), 
    CONSTRAINT FK_SHIPPING_ORDERS FOREIGN KEY (ORDER_ID) 
    REFERENCES ORDERS (ORDER_ID)
);

CREATE SEQUENCE SHIPPING_SEQ
START WITH 1  
INCREMENT BY 1  
NOCACHE  
NOCYCLE;  

CREATE OR REPLACE TRIGGER TRG_SHIPPING_ID
BEFORE INSERT ON SHIPPING
FOR EACH ROW
BEGIN
    :NEW.SHIPPING_ID := SHIPPING_SEQ.NEXTVAL;
END TRG_SHIPPING_ID;
/


COMMIT;