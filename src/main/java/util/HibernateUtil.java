package util;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class HibernateUtil {

    // Static variable for EntityManagerFactory
    private static final EntityManagerFactory entityManagerFactory;

    static {
        try {
            // Log initialization start
            System.out.println("Initializing EntityManagerFactory...");

            // Create EntityManagerFactory using persistence unit name
            entityManagerFactory = Persistence.createEntityManagerFactory("roomReservation");

            // Log successful initialization
            System.out.println("EntityManagerFactory initialized successfully.");
        } catch (Exception e) {
            // Log the error with detailed information
            System.err.println("EntityManagerFactory initialization failed.");
            System.err.println("Possible causes:");
            System.err.println("- Incorrect persistence unit name.");
            System.err.println("- Missing or incorrect persistence.xml configuration.");
            System.err.println("- Database connection issues.");
            System.err.println("- Missing required dependencies.");

            // Print the stack trace for debugging
            e.printStackTrace();

            // Throw an initializer error with the exception cause
            throw new ExceptionInInitializerError(e);
        }
    }

    // Public method to retrieve the EntityManagerFactory
    public static EntityManagerFactory getEntityManagerFactory() {
        if (entityManagerFactory == null) {
            throw new IllegalStateException("EntityManagerFactory is not initialized.");
        }
        return entityManagerFactory;
    }

    // Method to shut down the EntityManagerFactory
    public static void shutdown() {
        if (entityManagerFactory != null) {
            try {
                entityManagerFactory.close();
                System.out.println("EntityManagerFactory closed successfully.");
            } catch (Exception e) {
                // Log any errors during shutdown
                System.err.println("Error while shutting down EntityManagerFactory.");
                e.printStackTrace();
            }
        } else {
            System.err.println("EntityManagerFactory is already null. No action taken.");
        }
    }
}
