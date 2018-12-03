package data;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ExampleGetPath
 */
@WebServlet("/ExampleGetPath")
public class ExampleGetPath extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExampleGetPath() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dir = request.getRealPath("");
		String filename1,filename2;
		dir += "Upload";
		List d = new ArrayList();
		int max = 10 * 1024 * 1024;
		request.setCharacterEncoding("utf-8");
		try{
		MultipartRequest m = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy()); 
		String name = m.getParameter("file");
		Enumeration keys = m.getParameterNames();
		
//	    Enumeration files = m.getFileNames();
//	    String file1 = (String)files.nextElement();
//	    filename1 = m.getFilesystemName(file1);
//	    String file2 = (String)files.nextElement();
//	    filename2 = m.getFilesystemName(file2);
//		response.getWriter().append(name).append(" and ").append(filename1).append(" and ").append(filename2);
		while (keys.hasMoreElements()) {
			d.add(keys.nextElement());
		}         

		}catch(Exception e){
			System.out.println(e);
		}
	}

}
