package dao;

import dao.UserDAO;
import model.User;

public class DAOTest {
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        // Test 1: Ajouter un utilisateur
        User newUser = new User("testUser", "testPassword", "USER");
        userDAO.saveUser(newUser);
        System.out.println("Utilisateur ajouté avec succès !");

        // Test 2: Récupérer tous les utilisateurs
        System.out.println("Liste des utilisateurs :");
        userDAO.getAllUsers().forEach(user ->
                System.out.println("ID: " + user.getId() + ", Username: " + user.getUsername())
        );

        // Test 3: Authentification d'un utilisateur
        User authenticatedUser = userDAO.getUserByUsernameAndPassword("testUser", "testPassword");
        if (authenticatedUser != null) {
            System.out.println("Utilisateur authentifié : " + authenticatedUser.getUsername());
        } else {
            System.out.println("Échec de l'authentification.");
        }
    }
}
