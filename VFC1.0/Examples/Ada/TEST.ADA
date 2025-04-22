PRAGMA LIST(Off);
WITH Ada.Text_IO; USE Ada.Text_IO;
PROCEDURE Factorial IS
		
	FUNCTION Factorial(N : Integer) RETURN Integer IS
		BEGIN
		IF N <= 1 THEN
		
			RETURN 1;
		ELSE
			RETURN N * Factorial(N - 1);
			END IF;
		EXCEPTION
		WHEN Numeric_Error =>
			Put(" !");
			return -1;
			
		END Factorial;
	
		BEGIN
		FOR I IN 2 .. 8 LOOP
			Put("Factorial of ");
			Put( Integer'IMAGE(I) );
			Put(" = ");
			Put_Line( Integer'IMAGE( Factorial(I) ) );
			END LOOP;
		
		FOR I IN 2 .. 8 LOOP
			Put("Factorial of ");
			Put( Integer'IMAGE(I) );
			Put(" = ");
			Put_Line( Integer'IMAGE( Factorial(I) ) );
			END LOOP;
		
		
	END Factorial;
--  Export  Date: 10:44:26 PM - 04:Oct:2024.

