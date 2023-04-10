package org.devops.maven;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import static org.junit.Assert.*;

    public class AppTest {
        @Test
        public void testChangeIndex() {
            Task task = new Task();
            task.changeIndex(1);
            assertEquals(task.index.getText(), "1");
        }

        @Test
        public void testGetDone() {
            Task task = new Task();
            assertNotNull(task.getDone());
        }

        @Test
        public void testInitialState() {
            Task task = new Task();
            assertFalse(task.getState());
        }

        @Test
        public void testChangeState() {
            Task task = new Task();
            task.changeState();
            assertTrue(task.getState());
        }
    }



