/* =================== Schema client =================== */
-- Table: client
CREATE TABLE IF NOT EXISTS client (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  dni VARCHAR(15) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  address VARCHAR(50),
  idDistrict INT NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idDistrict) REFERENCES district(id),
  FOREIGN KEY (idUser) REFERENCES user(id)
);
-- Table: District
CREATE TABLE IF NOT EXISTS district (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL UNIQUE
);
-- Table: user
CREATE TABLE IF NOT EXISTS user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  avatarUrl VARCHAR(200),
  typeUser BOOLEAN default false,
  idMongo VARCHAR(30) NOT NULL
);

/* =================== Schema organization =================== */
-- Table: role
CREATE TABLE IF NOT EXISTS role (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL UNIQUE
);
-- Table: employee
CREATE TABLE IF NOT EXISTS employee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  dni VARCHAR(15) NOT NULL,
  phone VARCHAR(25) NOT NULL,
  idRole INT NOT NULL,
  idUser INT NOT NULL,
  FOREIGN KEY (idRole) REFERENCES role(id),
  FOREIGN KEY (idUser) REFERENCES user(id)
);

/* =================== Schema Catalog =================== */
-- Table: presentation
CREATE TABLE IF NOT EXISTS presentation (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
);
-- Table: category
CREATE TABLE IF NOT EXISTS category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
);
-- Table: laboratory
CREATE TABLE IF NOT EXISTS laboratory (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);
-- Table: product
CREATE TABLE IF NOT EXISTS product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  urlImage VARCHAR(200),
  precaution VARCHAR(100),
  idPresentation INT NOT NULL,
  idCategory INT NOT NULL,
  idLaboratory INT NOT NULL,
  FOREIGN KEY (idPresentation) REFERENCES presentation(id),
  FOREIGN KEY (idCategory) REFERENCES category(id),
  FOREIGN KEY (idLaboratory) REFERENCES laboratory(id)
);

/* =================== other schemas =================== */
-- Table: methodPayment
CREATE TABLE IF NOT EXISTS methodPayment (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);
-- Table: methodSale
CREATE TABLE IF NOT EXISTS methodSale (
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL
);
-- Table: receipt
CREATE TABLE IF NOT EXISTS receipt (
  id INT PRIMARY KEY AUTO_INCREMENT,
  serialNumber VARCHAR(20),
  dateSale DATE NOT NULL,
  idClient INT NOT NULL,
  idEmployee INT NOT NULL,
  idMethodPayment INT NOT NULL,
  idMethodSale INT NOT NULL,
  deliveryStatus BOOLEAN default false,
);
-- Table: detailReceipt
CREATE TABLE IF NOT EXISTS detailReceipt (
  id INT PRIMARY KEY AUTO_INCREMENT,
  price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  idProduct INT NOT NULL,
  idReceipt INT NOT NULL,
  FOREIGN KEY (idProduct) REFERENCES product(id),
  FOREIGN KEY (idReceipt) REFERENCES receipt(id)
);
