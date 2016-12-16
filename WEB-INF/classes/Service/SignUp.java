package Service;

import DB.*;
import Information.*;

public class SignUp {
   public SignUp() {

   }

   public boolean user(DBManager myDB, User user) {
      boolean result = false;
      Class c = user.getClass();

      if (c == StudentAccount.class) {
         try {
            DBQuery.insert(
            myDB.getConnection(),
            "insert into user values (?,password(?),?)",
            new String[] {user.getUid(), user.getPwd(), Integer.toString(1)}
            );
            DBQuery.insert(
            myDB.getConnection(),
            "insert into student values (?,?,?,?,?,?)",
            new String[] {
               ((Student) user).getName(),
               ((Student) user).getUid(),
               Integer.toString(((Student) user).getGrade()),
               Integer.toString(((Student) user).getSClass()),
               Integer.toString(((Student) user).getStNum()),
               ((Student) user).getTel()
            }
            );
            DBQuery.insert(
            myDB.getConnection(),
            "insert into account values (?,?,?,?)",
            new String[] {
               ((StudentAccount) user).getUid(),
               ((StudentAccount) user).getAccount(),
               Integer.toString(((StudentAccount) user).getPoint()),
               ((StudentAccount) user).getBankName()
            }
            );

            result = true;
         } catch (Exception e) {

         }
      } else if (c == BakeryAccount.class) {
         try {
            DBQuery.insert(
            myDB.getConnection(),
            "insert into user values (?,?,?)",
            new String[] {user.getUid(), user.getPwd(), Integer.toString(1)}
            );
            DBQuery.insert(
            myDB.getConnection(),
            "insert into bakery values (?,?,?,?)",
            new String[] {
               ((Bakery) user).getName(),
               ((Bakery) user).getUid(),
               ((Bakery) user).getTel(),
               ((Bakery) user).getAddress()
            }
            );
            DBQuery.insert(
            myDB.getConnection(),
            "insert into account values (?,?,?,?)",
            new String[] {
               ((BakeryAccount) user).getUid(),
               ((BakeryAccount) user).getAccount(),
               Integer.toString(((BakeryAccount) user).getPoint()),
               ((BakeryAccount) user).getBankName()
            }
            );

            result = true;
         } catch (Exception e) {

         }
      }
      return result;
   }
}
