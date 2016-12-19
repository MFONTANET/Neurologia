/*
SQLyog Ultimate v8.8 
MySQL - 5.6.12-log : Database - symfony
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`symfony` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `symfony`;

/*Table structure for table `antecedente` */

DROP TABLE IF EXISTS `antecedente`;

CREATE TABLE `antecedente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `historia_clinica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `categoria_diagnostico` */

DROP TABLE IF EXISTS `categoria_diagnostico`;

CREATE TABLE `categoria_diagnostico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `departamento` */

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `diagnostico_definitivo` */

DROP TABLE IF EXISTS `diagnostico_definitivo`;

CREATE TABLE `diagnostico_definitivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_diagnostico_id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `evolucion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `diagnostico_presuntivo` */

DROP TABLE IF EXISTS `diagnostico_presuntivo`;

CREATE TABLE `diagnostico_presuntivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `evolucion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `droga` */

DROP TABLE IF EXISTS `droga`;

CREATE TABLE `droga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `droga_tratamiento` */

DROP TABLE IF EXISTS `droga_tratamiento`;

CREATE TABLE `droga_tratamiento` (
  `droga_id` int(11) NOT NULL,
  `tratamiento_id` int(11) NOT NULL,
  `efecto_adverso_id` int(11) NOT NULL,
  `dosis` varchar(255) NOT NULL,
  PRIMARY KEY (`droga_id`,`tratamiento_id`,`efecto_adverso_id`,`dosis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `efecto_adverso` */

DROP TABLE IF EXISTS `efecto_adverso`;

CREATE TABLE `efecto_adverso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `enfermedad_actual` */

DROP TABLE IF EXISTS `enfermedad_actual`;

CREATE TABLE `enfermedad_actual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `historia_clinica_id` int(11) NOT NULL,
  `detalle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `estado_civil` */

DROP TABLE IF EXISTS `estado_civil`;

CREATE TABLE `estado_civil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `estudio` */

DROP TABLE IF EXISTS `estudio`;

CREATE TABLE `estudio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` date NOT NULL,
  `institucion` varchar(255) DEFAULT NULL,
  `tipo_estudio_id` int(11) NOT NULL,
  `evolucion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `evolucion` */

DROP TABLE IF EXISTS `evolucion`;

CREATE TABLE `evolucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evolucion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `historia_clinica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `historia_clinica` */

DROP TABLE IF EXISTS `historia_clinica`;

CREATE TABLE `historia_clinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `imagen` */

DROP TABLE IF EXISTS `imagen`;

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estudio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `motivo` */

DROP TABLE IF EXISTS `motivo`;

CREATE TABLE `motivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `historia_clinica_id` int(11) NOT NULL,
  `detalle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `nivel_educacional` */

DROP TABLE IF EXISTS `nivel_educacional`;

CREATE TABLE `nivel_educacional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `obra_social` */

DROP TABLE IF EXISTS `obra_social`;

CREATE TABLE `obra_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `paciente` */

DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `documento` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `sexo_id` int(11) NOT NULL,
  `nivel_educacional_id` int(11) DEFAULT NULL,
  `obra_social_id` int(11) NOT NULL,
  `estado_civil_id` int(11) DEFAULT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `admitido_por` int(11) DEFAULT NULL,
  `derivado_por` int(11) DEFAULT NULL,
  `ocupacion` varchar(255) DEFAULT NULL,
  `otros` varchar(255) DEFAULT NULL,
  `numero_carnet` varchar(255) NOT NULL,
  `email` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sexo` */

DROP TABLE IF EXISTS `sexo`;

CREATE TABLE `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tipo_antecedente` */

DROP TABLE IF EXISTS `tipo_antecedente`;

CREATE TABLE `tipo_antecedente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tipo_documento` */

DROP TABLE IF EXISTS `tipo_documento`;

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tipo_estudio` */

DROP TABLE IF EXISTS `tipo_estudio`;

CREATE TABLE `tipo_estudio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `siglas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tratamiento_externo` */

DROP TABLE IF EXISTS `tratamiento_externo`;

CREATE TABLE `tratamiento_externo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(255) NOT NULL,
  `evolucion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tratamiento_interno` */

DROP TABLE IF EXISTS `tratamiento_interno`;

CREATE TABLE `tratamiento_interno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `inicio` date NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `evolucion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numero_documento` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_de_nacimiento` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `estado_civil_id` int(11) NOT NULL,
  `sexo_id` int(11) NOT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
