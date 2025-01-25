package dao;

import dao.ReservationDAO;
import model.Reservation;

import java.time.LocalDate;
import java.time.LocalTime;

public class ReservationDAOTest {
    public static void main(String[] args) {
        ReservationDAO reservationDAO = new ReservationDAO();

        // Test 1: Ajouter une réservation
        Reservation reservation = new Reservation(
                LocalDate.of(2025, 1, 23),
                LocalTime.of(9, 0),
                LocalTime.of(11, 0),
                "Confirmed",
                1, // Room ID
                1  // User ID
        );
        reservationDAO.saveReservation(reservation);
        System.out.println("Réservation ajoutée avec succès !");

        // Test 2: Récupérer toutes les réservations
        System.out.println("Liste des réservations :");
        reservationDAO.getAllReservations().forEach(r ->
                System.out.println("ID: " + r.getId() + ", Date: " + r.getDate() + ", Status: " + r.getStatus())
        );
    }
}
