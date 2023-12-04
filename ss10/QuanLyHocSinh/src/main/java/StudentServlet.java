import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student-servlet")
public class StudentServlet extends HttpServlet {
    private static List<Student> list = new ArrayList<>();

    static {
        list.add(new Student(1, "Nhật Bảo", true, 90));
        list.add(new Student(2, "Văn Độ", true, 80));
        list.add(new Student(3, "Tiểu Vi", false, 60));
        list.add(new Student(4, "Tất Quyền", true, 59));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/result.jsp");
        if (list.size() == 0){
            String emptys = "danh sach rong";
            req.setAttribute("emptys",emptys);
        }
        req.setAttribute("list", list);
        requestDispatcher.forward(req, resp);
    }
}


