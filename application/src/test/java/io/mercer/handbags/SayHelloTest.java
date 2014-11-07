package io.mercer.handbags;

import org.junit.Test;

import static org.junit.Assert.*;

public class SayHelloTest {

    @Test
    public void itSaysHello() {
        assertEquals("hello", new SayHello().sayIt());
    }

}