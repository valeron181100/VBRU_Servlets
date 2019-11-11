import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;


public class ControllerServlet extends HttpServlet {
    public static final String X_TAG = "x-button";
    public static final String Y_TAG = "y-input";
    public static final String R_TAG = "r-radio";
    public static final String USER_ID_TAG = "userId";

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("Controller init");
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String x = req.getParameter(X_TAG);
        String y = req.getParameter(Y_TAG);
        String r = req.getParameter(R_TAG);

        if(x != null && y != null && r != null){
            UUID userId;
            if(req.getSession().getAttribute(USER_ID_TAG) != null){
                    userId = (UUID) req.getSession().getAttribute(USER_ID_TAG);
            }else{
                userId = UUID.randomUUID();
                req.getSession().setAttribute(USER_ID_TAG, userId);
            }

            resp.sendRedirect("/area-check?" + X_TAG + "=" + x + "&" +
                    Y_TAG + "=" + y + "&" + R_TAG + "=" + r + "&" + USER_ID_TAG + "=" + userId.toString());
        }else{
            //TODO: Redirect to JSP6
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID userId;
        if(req.getSession().getAttribute(USER_ID_TAG) != null){
            userId = (UUID) req.getSession().getAttribute(USER_ID_TAG);
        }else{
            userId = UUID.randomUUID();
            req.getSession().setAttribute(USER_ID_TAG, userId);
        }

        StringBuilder stringBuilder = new StringBuilder();
        ResultStorage.getInstance().getResults(userId).forEach(p -> {
            String str = "<li><span>x="+p.getPoint().getX()+", y="+p.getPoint().getY()+", R="+p.getrArea()+" ("+
                    (p.isIncluded() ? "Входит" : "Не входит") +")</span></li>";
            stringBuilder.append(str);
        });
        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().print(stringBuilder.toString());
    }
}
