-- Active: 1738734466847@@127.0.0.1@3306@aircraftfleetmanagement
CREATE DATABASE IF NOT EXISTS AircraftFleetManagement;
USE AircraftFleetManagement;

CREATE TABLE IF NOT EXISTS Aircraft (
    AircraftID INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(50),
    Capacity INT,
    Status ENUM('Active', 'Grounded', 'In Maintenance') DEFAULT 'Active'
);

CREATE TABLE IF NOT EXISTS  Crew(
		CrewID INT AUTO_INCREMENT PRIMARY KEY,
        Name VARCHAR(100) NOT NULL,
        Role ENUM('Pilot', 'Co-Pilot', 'Flight Attendant', 'Ground Crew') NOT NULL,
        Certifictation VARCHAR(100),
        ContactInfo VARCHAR(100)
        );
    
CREATE TABLE IF NOT EXISTS flight(
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    AircraftID INT NOT NULL,
    Route VARCHAR(100),
    DepatureTime DATETIME,
    ArrivalTime DATETIME,
    FOREIGN KEY(AircraftID) REFERENCES Aircraft(AircraftID)
    );

CREATE TABLE IF NOT EXISTS Passangers (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100), 
    BookingReference VARCHAR (50)

); 
    
    CREATE TABLE IF NOT EXISTS  booking (
        BookingID INT AUTO_INCREMENT PRIMARY KEY,
        PassengerID INT NOT NULL,
        FlightID INT NOT NULL,
        SeaNunmber VARCHAR(10),
        BookingStatus ENUM('Confirmed', 'Canceled') DEFAULT 'Confirmed',
        FOREIGN KEY (PassengerID) REFERENCES Passangers(PassengerID),
        FOREIGN KEY (flightID) REFERENCES flight(flightID)
    );

    CREATE TABLE IF NOT EXISTS  Maintainance (
        MaintainanceID INT AUTO_INCREMENT PRIMARY KEY,
        AircraftID INT NOT NULL,
        Description TEXT,
        MaintainanceDate DATE, 
        TechnicianName VARCHAR(100),
        Stats ENUM('Scheduled', 'Completed', 'Pending') DEFAULT 'Scheduled',
        FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID) 
    );
    
CREATE TABLE IF NOT EXISTS  FlightCrewAssignment (
        AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
        CrewID INT NOT NULL,
        FlightID INT NOT NULL,
        Role ENUM('Pilot', 'Co-Pilot', 'Flight Attendant', 'Ground Crew') NOT NULL,
        FOREIGN KEY (crewID) REFERENCES crew(crewID),
        FOREIGN KEY (flightID) REFERENCES flight(flightID)
);


CREATE TABLE IF NOT EXISTS  GroundCrewAssignment (
        AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
        AircraftID INT NOT NULL,
        CrewID INT NOT NULL,
        Task ENUM('Fueling', 'Loading', 'cleaning', 'Inspection') NOT NULL,
        FOREIGN KEY(AircraftID) REFERENCES Aircraft(AircraftID),
        FOREIGN KEY (CrewID) REFERENCES Crew(CrewID)
);

SHOW TABLES;
