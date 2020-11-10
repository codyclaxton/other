--Cody Claxton
--ITEC 320
--9/28/19

--Purpose of the program is to take an ISBN from standard input
--and compute its checked digit so that you have a valid isbn
--It is represented from 0-9 and X is represented as 10
--Can have only one '?' and in that case, we find the missing digit

--Help received Rosetta code/your online handouts/faq
--And 24mathguy on youtube with the breakdown of how to solve the algorithm


with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with ada.Text_IO; use ada.Text_IO;
with Ada.Characters.Handling; use ada.Characters.Handling;
with System.Aux_DEC; use System.Aux_DEC;
with ada.Exceptions; use ada.Exceptions;


procedure isbn_check is
   --Defining our new types of integers and characters
   type Int_10 is array(1 .. 10) of Integer;
   type char_10 is array(1 .. 10) of Character;
   --Never used these.  Could not figure out how to store them
   --type valid_check_digit is array(1..1000) of String;
   --type invalid_check_digit is array(1..1000) of Character;

   Too_Short: Exception;
   Too_Long: Exception;
   Invalid_Character: Exception;
   Two_Qms: Exception;--Two questions marks

   --Checks if our length is 10 digits or not
   --Each valid character in our string we will increase counter
   --Also is false if we have more then 1 '?'
   function length_check(s: String) return Integer is
      counter: Integer := 0;
   begin
      for i in s'Range loop
         if Is_Digit(s(i)) then
            counter := counter + 1;
         elsif s(i) = 'X' then counter := counter + 1;
         elsif s(i) = '?' then counter := counter + 1;
         elsif s(i) = '-' then counter := counter;
         else
            raise Invalid_Character;
         end if;

      end loop;

      return counter;
   end length_check;

   --Counts how many question marks we have our in string
   function qm_counter(s: String) return Integer is
      counter: Integer := 0;
   begin
      for i in s'Range loop
         if s(i) = '?' then
            counter := counter + 1;
         end if;
      end loop;

      return counter;
   end qm_counter;


   --Checks our character array with a ? and returns an integer array with the
   --? replaced with the correct number
  function check_digit_qm(c: Int_10; qm: Integer) return Int_10 is
   isbn: Int_10 := c;
   check_digit,missing_digit: Integer;
   qm_position: Integer := qm;
   sum: Integer := 0;
   Backward: Integer := 10;

   begin

   --Building our sum, but without adding our ? position sum to it
   for i in isbn'Range loop
         sum := sum + (isbn(i) * Backward);
         Backward := Backward - 1;
   end loop;

      for i in 0 .. 10 loop
       missing_digit := (qm_position * i);

         if sum + missing_digit mod 11 = 0 then
            check_digit := i;
            sum := sum + missing_digit;
            Put_Line(sum'img); --Why if i take this out, i get the wrong output?
         end if;
   end loop;

   --Rebuilding our proper isbn with qm position field validated
   for i in isbn'Range loop

         if isbn(i) = isbn(qm_position) then
         isbn(i) := check_digit;
         end if;

      end loop;

   return isbn;
   end check_digit_qm;

   --Function to check in which position our question mark is at in our array
   function check_qm_pos(c: char_10) return Integer is
      position: Integer;
   begin
      for i in c'Range loop
         if c(i) = '?' then
            position := i;
         end if;
      end loop;
     return position;
   end;

   --Building our string of 10 characters and removing dashes or anything else
   --Only numbers,X,and question marks
   function string_build(s: String) return char_10 is
      counter: Integer := 0;--Because we want our first position to be 1
      ten_characters: char_10;
   begin

      for i in s'range loop
         if Is_Digit(s(i)) then
            counter := counter +1;
           ten_characters(counter) := s(i);
         elsif s(i) = 'X' then
            counter := counter + 1;
           ten_characters(counter) := 'X';

         elsif s(i) = '?' then
            counter := counter + 1;
            ten_characters(counter) := '?';
         end if;
      end loop;

      return ten_characters;
   end string_build;

   --Checks our digit with all of the numbers we have received
   --And returns the modulus
   function check_digit(i: Int_10) return Integer is
      counter: Integer := 10;--What we will multiply by
      sum: Integer := 0;--Will add each multication to this
      remainder: Integer;

   begin
      for x in i'Range loop
         sum := sum + (i(x) * counter);--Adding to sum from multiplication index
         counter := counter - 1;
      end loop;
      remainder := sum mod 11;

     return Remainder;
   end check_digit;


   --Building our 10 length integer array.  X replaced with 10 and ? with 0
   int_cast: Integer;
   function int_array_build(c: char_10) return Int_10 is
      isbn_build: Int_10;
      qm_position: Integer;
   begin

      for i in c'Range loop
         if Is_Digit(c(i)) then
            int_cast := Standard.Character'pos(c(i))-Standard.Character'Pos('0');
            isbn_build(i) := int_cast;
         elsif c(i) = 'X' then
           int_cast := 10;
            isbn_build(i) := int_cast;
         elsif c(i) = '?' then
            qm_position := i;
            int_cast := 0;
            isbn_build(i) := int_cast;
         end if;
      end loop;

      return isbn_build;
   end int_array_build;


   line_count: Integer := 1;
   procedure do_everything is
   begin
      while not End_Of_File loop
         declare
            s: String := ada.Text_IO.Get_Line;
            length,modulus,qm_position,qm_count: Integer;
            my_ten_digits: Int_10;
            ten_characters: char_10;

         begin
            --This only raises exceptions for our length and too many ?
            --If invalid character, we raise that in the function length_check
            length := length_check(s);
            qm_count := qm_counter(s);

            if length < 10 then
               raise Too_Short;
            elsif length > 10 then
               raise Too_Long;
            elsif qm_count > 1 then
               raise Two_Qms;
            end if;

            --Building our valid & invalid isbns with question marks
            if qm_count = 1 then
                  ten_characters := string_build(s);
                  qm_position := check_qm_pos(ten_characters);
                  my_ten_digits := int_array_build(ten_characters);
                  my_ten_digits := check_digit_qm(my_ten_digits,qm_position);
                  modulus := check_digit(my_ten_digits);

                  for i in my_ten_digits'Range loop
                     put(my_ten_digits(i),1);
                  end loop;
               Put(" " & modulus'Img);
               New_Line;

               --Building our valid & invalid isbns that are without ?
               --And we are doing them as characters to handle if we have X
            elsif qm_count = 0 then
               ten_characters := string_build(s);
               my_ten_digits := int_array_build(ten_characters);
               modulus := check_digit(my_ten_digits);
 for i in my_ten_digits'Range loop
                  put(my_ten_digits(i),1);
               end loop;
               Put(" " & modulus'Img);
               New_Line;

               end if;

            line_count := line_count + 1;
           exit when s'Length = 0;
         exception
               when e: Too_Long =>
                  put("ERROR In Line" & line_count'Image);
                  Put(". string too long" & " <<" & s & ">>");
                  New_Line;
                  line_count := line_count + 1;
               when e: Too_Short =>
                  put("ERROR In Line" & line_count'Image);
                  Put(". string too short" & " <<" & s & ">>");
                  New_Line;
                  line_count := line_count + 1;
               when e: Invalid_Character =>
                  put("ERROR In Line" & line_count'Image);
                  Put(". Found invalid character" & " <<" & s & ">>");
                  New_Line;
               line_count := line_count + 1;
               when e: Two_Qms =>
                  put("ERROR In Line" & line_count'Image);
                  Put(". Too Many question marks" & " <<" & s & ">>");
                  New_Line;
                  line_count := line_count + 1;
               when others => put_line("Something unexpected happened");
         end;
      end loop;
   end do_everything;

begin
   do_everything;
end isbn_check;
