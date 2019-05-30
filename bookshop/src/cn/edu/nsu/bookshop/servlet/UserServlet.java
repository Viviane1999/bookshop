package cn.edu.nsu.bookshop.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.nsu.bookshop.db.last.roles.Roles;
import cn.edu.nsu.bookshop.db.last.roles.RolesDAO;
import cn.edu.nsu.bookshop.db.last.users.Users;
import cn.edu.nsu.bookshop.db.last.users.UsersDAO;

/**
 * Servlet implementation class UserServlet
 */
//@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		UsersDAO usersDAO = new UsersDAO();
		RolesDAO rolesDAO = new RolesDAO();
		//System.out.println("pathInfo="+pathInfo);
		try {
			if("/List".equals(pathInfo)) {
				//�����û��б�������Ĵ���
				//��DB��users���в�ѯ�����м�¼
				ArrayList<Users> users = usersDAO.getAll();
				//���ݹ���
				request.setAttribute("users", users);
				//�����ɷ�
				request.getRequestDispatcher("/pages/admin/users/list.jsp").forward(request, response);
				
			}
			else if ("/OpenModify".equals(pathInfo)) {
				//�����û��޸ı���������Ĵ���
				
				//��������
				// ��user���в�ѯ�޸ĵ��û�
          		String users_idStr = request.getParameter("users_id");
          		int users_id = Integer.parseInt(users_idStr);
          		Users user = usersDAO.getById(users_id);
          		
				ArrayList<Roles> roles = rolesDAO.getAll();
				//��������
				request.setAttribute("user", user);
				request.setAttribute("roles", roles);
				//�����ɷ�
				request.getRequestDispatcher("/pages/admin/users/modify.jsp").forward(request, response);
			}
			else if ("Modify".equals(pathInfo)) {
				//�����û��޸ı���������Ĵ���
				
			}
			else if ("/OpenAdd".equals(pathInfo)) {
				
				
			}
			else if ("/Add".equals(pathInfo)) {
				
				
			}
			else if ("/Delete".equals(pathInfo)){
				
				
			}
			else if ("/Detail".equals(pathInfo)) {
				
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				usersDAO.release();
				rolesDAO.release();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
