package org.devops.maven;
import java.awt.GraphicsEnvironment;

public class Main {
    public static void main(String[] args) {
        if (!GraphicsEnvironment.isHeadless()) {
            AppFrame frame = new AppFrame();
            frame.setVisible(true);
        }
        System.out.println("Continuing execution...");

    }
}