package controllers.music;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Music;
import models.User;
import models.validators.MusicValidator;
import utils.DBUtil;

@WebServlet("/music/create")
@MultipartConfig(location="c:\\tmp", maxFileSize=10048576)
public class MusicCreateServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        //Collection<Part> parts = request.getParts();

System.out.println("MusicCreateServlet start");
System.out.println("http _token=" + _token + " session=" + request.getSession().getId());

      if(_token != null && _token.equals(request.getSession().getId())) {
          EntityManager em = DBUtil.createEntityManager();

        Music m = new Music();
        m.setUser((User)request.getSession().getAttribute("login_user"));

        m.setSong(request.getParameter("song"));
        m.setSinger(request.getParameter("singer"));
        m.setGenre(request.getParameter("genre"));
        m.setIntroduction(request.getParameter("introduction"));

        Part part = request.getPart("file");
        String name = this.getFileName(part);
        part.write(getServletContext().getRealPath("/WEB-INF/uploaded/music_file") +"/"+ name);
        m.setFile(name);

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        m.setCreated_at(currentTime);
        m.setUpdated_at(currentTime);
System.out.println("MusicCreateServlet start2");
        List<String> errors = MusicValidator.validate(m);
        if(errors.size() > 0) {
            em.close();

            request.setAttribute("_token", request.getSession().getId());
            request.setAttribute("music", m);
            request.setAttribute("errors", errors);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/music/new.jsp");
            rd.forward(request, response);
        } else {
            em.getTransaction().begin();
            em.persist(m);
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "登録が完了しました。");

            response.sendRedirect(request.getContextPath() + "/music/index");
        }
      }
    }

    private String getFileName(Part part) {
        String result = null;
        for (String disp : part.getHeader("Content-Disposition").split(";")) {
            if (disp.trim().startsWith("filename")) {
                result = disp.substring(disp.indexOf("=") + 1).trim();
                result = result.replace("\"", "").replace("\\","/");
                int pos =result.lastIndexOf("/");
                if (pos >= 0) {
                  result = result.substring(pos + 1);
                }
                break;
            }
        }
        return result;
    }
}