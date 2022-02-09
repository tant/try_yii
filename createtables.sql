CREATE TABLE user (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    username        VARCHAR(55) NOT NULL,
    password        varchar(100) NOT NULL,
    auth_key        VARCHAR(255) NOT NULL,
    access_token    VARCHAR(255) NOT NULL
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

CREATE TABLE article (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    title           VARCHAR(1024) NOT NULL,
    slug            VARCHAR(1024) NOT NULL,
    body            LONGTEXT NOT NULL,
    created         INT,
    updated         INT,
    created_by      INT,
    updated_by      INT
) DEFAULT CHARSET=utf8 ENGINE=INNODB;


ALTER TABLE article 
    ADD CONSTRAINT article_created_by_fk 
        FOREIGN KEY (created_by) REFERENCES user (id);
ALTER TABLE article 
    ADD CONSTRAINT article_updated_by_fk 
        FOREIGN KEY (updated_by) REFERENCES user (id);



CREATE TABLE region (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated TIMESTAMP DEFAULT now() ON UPDATE now() 
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

INSERT INTO `region` (`name`) VALUES
('bắc mỹ'),
('nam mỹ'),
('trung mỹ'),
('bắc âu'),
('nam âu'),
('tây âu'),
('đông âu'),
('trung âu'),
('trung á'),
('tây á'),
('đông á'),
('đông nam á')
('châu úc');

CREATE TABLE country (
    code CHAR(2) NOT NULL PRIMARY KEY,
    name CHAR(52) NOT NULL,
    population INT(11) NOT NULL DEFAULT '0',
    regionid INT,
    CONSTRAINT fk_region
    FOREIGN KEY (regionid) 
        REFERENCES region(id),

    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated TIMESTAMP DEFAULT now() ON UPDATE now() 
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

ALTER TABLE `country` ADD  CONSTRAINT `fk_region` FOREIGN KEY (`regionid`) REFERENCES `region`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


INSERT INTO country (code,name, population,regionid) VALUES ('AU','Australia',24016400,13);
INSERT INTO country (code,name, population,regionid) VALUES ('BR','Brazil',205722000,2);
INSERT INTO country (code,name, population,regionid) VALUES ('CA','Canada',35985751,1);
INSERT INTO country (code,name, population,regionid) VALUES ('CN','China',1375210000,11);
INSERT INTO country (code,name, population,regionid) VALUES ('DE','Germany',81459000,8);
INSERT INTO country (code,name, population,regionid) VALUES ('FR','France',64513242,8);
INSERT INTO country (code,name, population,regionid) VALUES ('GB','United Kingdom',65097000,8);
INSERT INTO country (code,name, population,regionid) VALUES ('IN','India',1285400000,9);
INSERT INTO country (code,name, population,regionid) VALUES ('RU','Russia',146519759,7);
INSERT INTO country (code,name, population,regionid) VALUES ('US','United States',322976000,1);