with Ada.Text_IO; use Ada.Text_IO;
--Cody Claxton
--5/2/20
--hw5 Implementation of a queue for compete
package body stacks is

    max: Natural := 100;

   function is_Empty(S: Stack) return Boolean is
   begin
      return s = null;
   end is_Empty;

   function is_Full(S: Stack) return Boolean is

   begin
      return false;
   end;


   procedure push(Item: ItemType; S : in out Stack) is

   begin
      S.Item := item;
      S.Next := null;

   end;

   procedure pop(S : in out Stack) is
   begin
      if is_Empty(s) then
         raise Stack_Empty;
      else
         S.Next := null;
      end if;

      end pop;


   function top(S: Stack) return ItemType is
   begin
      return s.Item;
   end;


   procedure print(S : in Stack) is
   begin
      Put_Line("no");
   end;
end stacks;
