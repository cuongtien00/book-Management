package com.codegym.service.category;

import com.codegym.model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryService implements ICategoryService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookcategory?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Cuongtien1809";

protected Connection getConnection(){
Connection connection = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
return connection;
}

    @Override
    public void insert(Category category) {
    Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("insert into category (name,description) value (?,?);");
            preparedStatement.setString(1,category.getName());
            preparedStatement.setString(2,category.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Category findById(int id){
    Category category = null;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("select * from category where id = ?");
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                String name = rs.getString("name");
                String des = rs.getString("description");
                category = new Category(id,name,des);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    return  category;
}

    @Override
    public boolean update(Category category) throws SQLException {
        boolean rowUpdated ;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement("update category set name = ?, description = ?;");
        statement.setString(1,category.getName());
        statement.setString(2,category.getDescription());

        rowUpdated = statement.executeUpdate() > 0;
        return rowUpdated;
    }

    @Override
    public boolean delete(int id) throws SQLException {
       boolean rowDeleted;
       Connection connection = getConnection();
       PreparedStatement statement = connection.prepareStatement("delete from category where  id = ?;");
       statement.setInt(1,id);
       rowDeleted = statement.executeUpdate() >0;
       return  rowDeleted;
    }

    @Override
    public List<Category> findAll(){
       List<Category> categories = new ArrayList<>();
       Connection connection  = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select *from category;");
            ResultSet rs  = statement.executeQuery();
            while(rs.next()){
             int id = rs.getInt("id");
             String name = rs.getString("name");
             String des = rs.getString("description");

             categories.add(new Category(id,name,des));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  categories;
    }
}
