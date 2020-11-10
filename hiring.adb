with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure hiring  is
   e: constant Float:= 2.718_2818_28;

   procedure readFile is
      firstNumber: Natural;
      currentNum: Natural;
      n: Natural;
      count : Integer;
      r: Integer;
      test: Float;
      bestInr: Natural;
      bestInN: Natural;
   begin
      count := 0;
      bestInr := 0;
      bestInN := 0;
      currentNum := 0;
      --Put_Line("n     r     Best in r     Selected     Best Overall     Correct     Not Correct");
      while not end_of_file loop
         n := 0;
         --first get our n & our length
         get(firstNumber);
         Put(firstNumber'Img);
         New_Line;

         --needs to go after you get current num then check before u get next num
         while n < firstNumber loop
            --if the first num in our sequence of numbers.
            if n= 1 then
               bestInr := currentNum;
            end if;
            get(currentNum);
--if find a higher number than our first number it will chanage
               if currentNum > bestInr then
                  bestInr := currentNum;
            end if;

            Put_Line("   " & currentNum'img);
            --New_Line;
            n := n + 1;
         end loop;
         r := Integer(Float'Floor(Float(n) / e));
         Put_Line("Our r is:   " & r'Img);
         Put_Line("Best overall is:   " & bestInr'Img);

         --have to take all numbers past r



      test := Float(firstNumber) / e;
      r := Natural(test);
         --Put_Line(r'img);
         New_Line;
      end loop;

   end readFile;


begin
   readFile;
end hiring;

