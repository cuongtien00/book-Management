package com.codegym.controller;

import com.codegym.model.Book;
import com.codegym.model.Category;
import com.codegym.service.book.BookService;
import com.codegym.service.category.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/books")
public class BookServlet extends HttpServlet {
    private BookService bookService;
    private CategoryService categoryService;

    @Override
    public void init(){
       bookService = new BookService();
       categoryService = new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "edit":
                showEditFrom(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "view":
                showBookView(request,response);
                break;
            case "sort":
                sortByName(request,response);
                break;
            default:
                listBooks(request, response);
                break;
        }
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
        List<Book> books = bookService.sortByName();
        request.setAttribute("bookList",books);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showBookView(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/view.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findById(id);
        request.setAttribute("book",book);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
        request.setAttribute("bookList",bookService.findAll());
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));;
        try {
            bookService.delete(id);
           response.sendRedirect("/books");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditFrom(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/edit.jsp");
        request.setAttribute("book",book);
        request.setAttribute("categoryList",categoryService.findAll());
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/create.jsp");
        request.setAttribute("categoryList",categoryService.findAll());
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createBook(request,response);
                break;
            case "edit":
                updateBook(request,response);
                break;
            default:
                listBooks(request, response);
                break;
        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/edit.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String des = request.getParameter("des");
        String idS = request.getParameter("category");
        int idCate = Integer.parseInt(idS);
        Category category = categoryService.findById(idCate);
        Book book  = new Book(id,name,des,category);
        request.setAttribute("book",book);
        request.setAttribute("categoryList",categoryService.findAll());
        request.setAttribute("message","Updated success!");
        try {
            bookService.update(book);
            dispatcher.forward(request,response);
        } catch (SQLException | IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    private void createBook(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/create.jsp");
        String name = request.getParameter("name");
        String des = request.getParameter("des");
        String idS = request.getParameter("category");
        int id = Integer.parseInt(idS);
        Category category = categoryService.findById(id);

        Book newBook = new Book(name,des,category);
        bookService.insert(newBook);
        request.setAttribute("categoryList",categoryService.findAll());
        request.setAttribute("message","Create success!");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
