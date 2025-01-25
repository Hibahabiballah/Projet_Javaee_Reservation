package dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.User;
import util.HibernateUtil;

import java.util.List;

public class UserDAO {

    // Save a new user to the database
    public void saveUser(User user) {
        try (EntityManager em = HibernateUtil.getEntityManagerFactory().createEntityManager()) {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.err.println("Error saving user: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Retrieve all users from the database
    public List<User> getAllUsers() {
        List<User> users = null;
        try (EntityManager em = HibernateUtil.getEntityManagerFactory().createEntityManager()) {
            users = em.createQuery("FROM User", User.class).getResultList();
        } catch (Exception e) {
            System.err.println("Error retrieving users: " + e.getMessage());
            e.printStackTrace();
        }
        return users;
    }

    // Retrieve a user by ID
    public User getUserById(int id) {
        User user = null;
        try (EntityManager em = HibernateUtil.getEntityManagerFactory().createEntityManager()) {
            user = em.find(User.class, id);
        } catch (Exception e) {
            System.err.println("Error retrieving user by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }

    // Retrieve a user by username and password
    public User getUserByUsernameAndPassword(String username, String password) {
        User user = null;
        try (EntityManager em = HibernateUtil.getEntityManagerFactory().createEntityManager()) {
            System.out.println("Attempting to authenticate with username: " + username + " and password: " + password);
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.username = :username AND u.password = :password",
                    User.class
            );
            user = query
                    .setParameter("username", username.trim()) // Trim whitespace
                    .setParameter("password", password.trim()) // Trim whitespace
                    .getSingleResult();
        } catch (jakarta.persistence.NoResultException e) {
            System.err.println("Invalid credentials. No matching user found.");
        } catch (Exception e) {
            System.err.println("Error during authentication: " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }
}
