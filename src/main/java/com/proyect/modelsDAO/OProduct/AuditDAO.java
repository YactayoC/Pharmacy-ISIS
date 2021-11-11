package com.proyect.modelsDAO.OProduct;
import com.proyect.connDB.ConnectionDB;
import com.proyect.interfaces.Repository;
import com.proyect.modelsDTO.OProduct.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class AuditDAO implements Repository<Audit> {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<Audit> list() {
        List<Audit> audit = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT a.*,ac.*,lab1.*,lab2.*,cat1.*,cat2.*,pre1.*,pre2.* FROM paudit AS a \n" +
                     "                     INNER JOIN action AS ac ON (a.idAction = ac.idAction)\n" +
                     "                     INNER JOIN laboratory AS lab2 ON (a.oldPlab = lab2.idLaboratory)\n" +
                     "                     INNER JOIN laboratory AS lab1 ON (a.newPlab = lab1.idLaboratory)    \n" +
                     "                     INNER JOIN category AS cat2 ON (a.oldPcateg = cat2.idCategory)\n" +
                     "                     INNER JOIN category AS cat1 ON (a.newPcateg = cat1.idCategory)\n" +
                     "                     INNER JOIN presentation AS pre2 ON (a.oldPpresent = pre2.idPresentation)                     \n" +
                     "                     INNER JOIN presentation AS pre1 ON (a.newPpresent = pre1.idPresentation)")) {
            while (rs.next()) {
                Audit a = createAudit(rs);
                audit.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return audit;
    }

    @Override
    public Audit byId(int id) {
        return null;
    }

    @Override
    public void save(Audit audit) {

    }

    @Override
    public void delete(int id) {

    }
    private Audit createAudit(ResultSet rs) throws SQLException {
        Audit a =new Audit();
        a.setIdAudit(rs.getInt("idPAudit"));
        a.setRegistD(rs.getDate("registD"));
        a.setHour(rs.getString("hour"));
        a.setOldPhoto(rs.getString("oldPhoto"));
        a.setNewPhoto(rs.getString("newPhoto"));
        a.setOldPname(rs.getString("oldPname"));
        a.setNewPname(rs.getString("newPname"));
        a.setOldPprice(rs.getDouble("oldPprice"));
        a.setNewPprice(rs.getDouble("newPprice"));

        Category cat2 =new Category();
        cat2.setIdCategory(rs.getInt("idCategory"));
        cat2.setNameC(rs.getString("nameC"));
        cat2.setUrlCateg(rs.getString("urlCateg"));
        cat2.setDescription(rs.getString("description"));

        a.setNewPcateg(cat2);

        Laboratory lab2=new Laboratory();
        lab2.setIdLaboratory(rs.getInt("idLaboratory"));
        lab2.setNameL(rs.getString("nameL"));

        a.setNewPlab(lab2);

        Presentation pre2=new Presentation();
        pre2.setIdPresentation(rs.getInt("idPresentation"));
        pre2.setNamePr(rs.getString("namePr"));

        a.setNewPpresent(pre2);

        a.setAvatarE(rs.getString("avatarE"));
        a.setEmployee(rs.getString("employee"));

        Action action=new Action();
        action.setIdAction(rs.getInt("idAction"));
        action.setAction(rs.getString("actionN"));

        a.setAction(action);
        return a;
    }
}