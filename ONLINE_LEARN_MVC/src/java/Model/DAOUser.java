package Model;

import Const.ConstValue;
import Entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class DAOUser extends ConnectDatabase {

    public List<User> getTop4Teacher() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT TOP 4* FROM [dbo].[User]\n"
                + "WHERE [RoleName] = '" + ConstValue.ROLE_TEACHER + "'";
        ResultSet result = getData(sql);
        try {
            // loop for traverse all row
            while (result.next()) {
                int UserID = result.getInt(1);
                String FullName = result.getString(2);
                String phone = result.getString(3);
                String address = result.getString(4);
                String image = result.getString(5);
                String email = result.getString(6);
                String gender = result.getString(7);
                String username = result.getString(8);
                String password = result.getString(9);
                User user = new User(UserID, FullName, phone, address, image, email, gender, username, password, ConstValue.ROLE_TEACHER);
                list.add(user);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return list;
    }
}
