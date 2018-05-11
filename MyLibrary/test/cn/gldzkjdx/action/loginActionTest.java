package cn.gldzkjdx.action;

import static org.junit.Assert.*;

import org.junit.Test;

public class loginActionTest {

	@Test
	public void test() throws Exception {
		LoginAction la = new LoginAction();
		la.setUsername("admin");
		la.setUserpwd("123");
		String res = la.execute();
		assertEquals("success",res);
	}

}
