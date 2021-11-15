package com.codegym.service.book;

import com.codegym.model.Book;
import com.codegym.model.Category;
import com.codegym.service.category.CategoryService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookService implements IBookService{

    private CategoryService categoryService = new CategoryService();
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
    public void insert(Book book){
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("insert into book (name,description,category_id) value (?,?,?);");
        statement.setString(1,book.getName());
        statement.setString(2,book.getDescription());
        statement.setInt(3,book.getCategory().getId());

        statement.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public Book findById(int id) {
        Book book = null;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("select * from book where id = ?;");
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String des = rs.getString("description");
                int category_id = rs.getInt("category_id");
                Category category = categoryService.findById(category_id);

                book = new Book(id,name,des,category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  book;
    }

    @Override
    public boolean update(Book book) throws SQLException {
        boolean rowUpdated;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement("update book set name = ?, description = ?, category_id = ? where id = ?;");
        statement.setString(1,book.getName());
        statement.setString(2, book.getDescription());
        statement.setInt(3,book.getCategory().getId());
        statement.setInt(4,book.getId());
        rowUpdated = statement.executeUpdate() > 0;
        return rowUpdated;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement("delete from book where id = ?;");
        statement.setInt(1,id);
        rowDeleted = statement.executeUpdate()>0;
        return rowDeleted;
    }
    public List<Book> sortByName(){
        List<Book> books = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from book order by name;");
        ResultSet rs  = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String des = rs.getString("description");
                int category_id = rs.getInt("category_id");
                Category category = categoryService.findById(category_id);
                books.add(new Book(id,name,des,category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    @Override
    public List<Book> findAll(){
        List<Book> books = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("select *from book;");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String des = rs.getString("description");
                int category_id = rs.getInt("category_id");
                Category category = categoryService.findById(category_id);
                books.add(new Book(id,name,des,category));
            }
        } catch (SQLException e) {
        }
        return books;
    }
}
