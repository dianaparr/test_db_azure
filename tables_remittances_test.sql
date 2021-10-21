-- Create a DB called remittances_db_test - MySQL server
-- Create a new user developer (in localhost) and password
CREATE DATABASE IF NOT EXISTS remittances_db_test;
CREATE USER IF NOT EXISTS 'diana'@'localhost'
IDENTIFIED BY 'diana_pwd';
GRANT SELECT ON performance_schema.* TO 'diana'@'localhost';
GRANT ALL ON remittances_db.* TO 'diana'@'localhost';
FLUSH PRIVILEGES;


USE remittances_db_test;

--
-- Table structure for table `sender`
--

CREATE TABLE IF NOT EXISTS sender (
  sender_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(40) NOT NULL UNIQUE,
  PRIMARY KEY (sender_id)
);


--
-- Table structure for table `receiver`
--

CREATE TABLE IF NOT EXISTS receiver (
  id_receiver INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(120) NOT NULL,
  phone VARCHAR(40) NOT NULL,
  sender_phone VARCHAR(40) NOT NULL,
  cash VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_receiver),
  CONSTRAINT receiver_fk_1 FOREIGN KEY (sender_phone) REFERENCES sender(phone) ON DELETE CASCADE
);


--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS history (
    id_history INT NOT NULL AUTO_INCREMENT,
    date TIMESTAMP default (localtimestamp(0)),
    phone VARCHAR(40) NOT NULL,
    sender_name VARCHAR(120) NOT NULL,
    balance VARCHAR(100),
    PRIMARY KEY (id_history),
    CONSTRAINT history_fk_1 FOREIGN KEY (sender_name) REFERENCES sender(name) ON DELETE CASCADE
);


--
-- Table structure for table `phones`
--

CREATE TABLE IF NOT EXISTS phones (
    id_phones INT NOT NULL,
    phone VARCHAR(40) NOT NULL,
    phone_desencrypt VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_phones)
);
