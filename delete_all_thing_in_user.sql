-- ALERT !!
-- THIS Code Delete every TABLE , VIEW ,PACKAGE ,PROCEDURE ,FUNCTION ,SEQUENCE ,SYNONYM ,Trigger ,PACKAGE BODY in  your user !!!
-- Don't use it if u don't understand the risk .
BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'Trigger',		
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line ('FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/

-- Stop here !
-- you have to know that you will drop students-employees users by complete copying this code & droping students-employees roles too !

-- Dropping users
drop user E320180001;
drop user E320180002;
drop user E320180003;
drop user E320180004;
drop user E320180005;
drop user E320180006;
-- Dropping users
drop user S120180001;
drop user S120180002;
-- Dropping users
drop user S220180001;
drop user S220180002;

-- Dropping roles
drop role students_role;
drop role employees_role;
-- Done
clear scr

