with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with queues;
with stacks;
--Cody Claxton
--5/2/20
--hw5 Implementation of a queue for compete
procedure Compete is


   --This is used for players who are in line to compete

  MaxNameSize: Constant Natural := 80;

   type Player is record
      name: String(1..MaxNameSize);
      age: Natural;
      score: Natural;
     -- wins: Natural := 0;
      --losses: Natural := 0;
   end record;



procedure printplayer(p: player) is
   begin
      put(p.name);
      Put(3,p.age);
      put(6,p.score);
      --put(9,p.wins);
      --put(12,p.losses);
end printplayer;


package myqueuepkg is new queues(print => printplayer, itemtype => player);
use myqueuepkg;

 package mystackpackage is new stacks(print => printplayer, itemtype => player);
use mystackpackage;



   --Gets the info of each player
   function get_info return Player is
   p: Player;
   begin
      get(p.name);
      Put_Line(p.name);
      get(p.score);
            Put_Line(p.score'img);

      get(p.age);
            Put_Line(p.age'img);

      return p;

   end;


   current_player: Player;
   zero_loss_queue: myqueuepkg.Queue;
   one_loss_queue: myqueuepkg.Queue;
   two_loss_stack: mystackpackage.Stack;


begin
   Put_Line("too much time on queues and stacks.  Kept getting end error and not sure where at");
end Compete;
