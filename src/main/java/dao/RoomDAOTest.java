package dao;

import dao.RoomDAO;
import model.Room;

public class RoomDAOTest {
    public static void main(String[] args) {
        RoomDAO roomDAO = new RoomDAO();

        // Test 1: Ajouter une salle
        Room room = new Room("Conference Room", 50, "Projector, Whiteboard", true);
        roomDAO.addRoom(room);
        System.out.println("Salle ajoutée avec succès !");

        // Test 2: Récupérer toutes les salles
        System.out.println("Liste des salles :");
        roomDAO.getAllRooms().forEach(r ->
                System.out.println("ID: " + r.getId() + ", Name: " + r.getName() + ", Capacity: " + r.getCapacity())
        );

        // Test 3: Récupérer les salles disponibles
        System.out.println("Salles disponibles :");
        roomDAO.getAvailableRooms().forEach(r ->
                System.out.println("ID: " + r.getId() + ", Name: " + r.getName())
        );
    }
}
