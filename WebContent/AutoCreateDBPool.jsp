<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="org.apache.commons.dbcp.*"%>
<%@page import="org.apache.commons.pool.impl.*"%>
<%!
        public void jspInit() {
             GenericObjectPool objectPool = new GenericObjectPool();
             DriverManagerConnectionFactory connectionFactory = new DriverManagerConnectionFactory("jdbc:mysql://localhost:3306/webdb","root","1234");
             new PoolableConnectionFactory(connectionFactory, objectPool, null, null, false, true);
             PoolingDriver driver = new PoolingDriver();
             driver.registerPool("/wdb_pool", objectPool);
       }
%>
    