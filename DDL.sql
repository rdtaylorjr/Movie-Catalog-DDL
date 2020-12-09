/*
 C65 Java Full-Stack with React
 The Software Guild
 Relational Databases and SQL Exercise 1: DDL
 Russell Taylor
 December 9, 2020
 Written in MySQL
 
 Overview
 In this exercise, we will practice our DDL skills by scripting a new database, tables, and relationships in a script file.

 This exercise is provided to give you practice applying the skills you have learned in this course, but you will not submit it to your instructor nor will it be graded.

 You should complete this exercise before continuing on with the course.
 If you have problems completing this exercise, review the course content up to this point and try again.
 Contact an instructor or TA if you have questions about this exercise or cannot resolve problems on your own.
 Remember to sync your code with your classwork repository after you have completed the exercise.
 
 Specification
 The database should keep track of movies we are interested in. Create a .sql script file to create a database named MovieCatalogue that contains the following tables:

 Movie
 MovieID - Primary key, Identity
 GenreID - Foreign key, Genre table, Required
 DirectorID - Foreign key, Director table, Not required
 RatingID - Foreign key, Rating table, Not required
 Title - Required, Extended character set, Length: 128
 ReleaseDate - Not required
 
 Genre
 GenreID - Primary key, Identity
 GenreName - Required, Extended character set, Length: 30
 
 Director
 DirectorID - Primary key, Identity
 FirstName - Required, Extended character set, Length: 30
 LastName - Required, Extended character set, Length: 30
 BirthDate - Not required
 
 Rating
 RatingID - Primary key, Identity
 RatingName - Required, Standard character set, Length: 5
 
 Actor
 ActorID - Primary key, Identity
 FirstName - Required, Extended character set, Length: 30
 LastName - Required, Extended character set, Length: 30
 BirthDate - Not required
 
 CastMembers
 CastMemberID - Primary key, Identity
 ActorID - Foreign key, Actor table, Required
 MovieID - Foreign key, Movie table, Required
 Role - Required, Extended character set, Length: 50
 */

DROP DATABASE IF EXISTS MovieCatalogue;

CREATE DATABASE MovieCatalogue;

USE MovieCatalogue;

DROP TABLE IF EXISTS `MovieCatalogue`.`Genre`;
CREATE TABLE `MovieCatalogue`.`Genre` (
  `GenreID` INT NOT NULL AUTO_INCREMENT,
  `GenreName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`GenreID`));

DROP TABLE IF EXISTS `MovieCatalogue`.`Director`;
CREATE TABLE `MovieCatalogue`.`Director` (
  `DirectorID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(30) NOT NULL,
  `LastName` VARCHAR(30) NOT NULL,
  `BirthDate` DATE NULL,
  PRIMARY KEY (`DirectorID`));

DROP TABLE IF EXISTS `MovieCatalogue`.`Rating`;
CREATE TABLE `MovieCatalogue`.`Rating` (
  `RatingID` INT NOT NULL AUTO_INCREMENT,
  `RatingName` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`RatingID`));

DROP TABLE IF EXISTS `MovieCatalogue`.`Movie`;
CREATE TABLE `MovieCatalogue`.`Movie` (
  `MovieID` INT NOT NULL AUTO_INCREMENT,
  `GenreID` INT NOT NULL,
  `DirectorID` INT NULL,
  `RatingID` INT NULL,
  `Title` VARCHAR(128) NOT NULL,
  `ReleaseDate` DATE NULL,
  PRIMARY KEY (`MovieID`),
  CONSTRAINT `fk_GenreID`
    FOREIGN KEY (`GenreID`)
    REFERENCES `MovieCatalogue`.`Genre` (`GenreID`),
  CONSTRAINT `fk_DirectorID`
    FOREIGN KEY (`DirectorID`)
    REFERENCES `MovieCatalogue`.`Director` (`DirectorID`),
  CONSTRAINT `fk_RatingID`
    FOREIGN KEY (`RatingID`)
    REFERENCES `MovieCatalogue`.`Rating` (`RatingID`));

DROP TABLE IF EXISTS `MovieCatalogue`.`Actor`;
CREATE TABLE `MovieCatalogue`.`Actor` (
  `ActorID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(30) NOT NULL,
  `LastName` VARCHAR(30) NOT NULL,
  `BirthDate` DATE NULL,
  PRIMARY KEY (`ActorID`));

DROP TABLE IF EXISTS `MovieCatalogue`.`CastMember`;
CREATE TABLE `MovieCatalogue`.`CastMember` (
  `CastMemberID` INT NOT NULL AUTO_INCREMENT,
  `ActorID` INT NOT NULL,
  `MovieID` INT NOT NULL,
  `Role` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CastMemberID`),
  CONSTRAINT `fk_ActorID`
    FOREIGN KEY (`ActorID`)
    REFERENCES `MovieCatalogue`.`Actor` (`ActorID`),
  CONSTRAINT `fk_MovieID`
    FOREIGN KEY (`MovieID`)
    REFERENCES `MovieCatalogue`.`Movie` (`MovieID`));
