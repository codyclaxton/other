with Ada.Text_IO; use Ada.Text_IO;
--Cody Claxton
--5/2/20
--hw5 Implementation of a queue for compete
package body queues is
max: Natural := 100;
   function  is_Empty(Q: Queue) return Boolean is
   begin
      return q.Count > 0;
   end is_Empty;

   function  is_Full(Q: Queue) return Boolean is
   begin
      return q.count = max;
   end is_Full;

   function  size(Q: Queue) return Natural is
   begin
      return q.Count;
   end size;


   function  front(Q: Queue) return ItemType is
    p1: ItemType := Q.Front.Data;
   begin
      return p1;
   end front;


   procedure enqueue (Item: ItemType; Q: in out Queue) is
   temp: QueueNodePointer := new QueueNode'(item,null);
   begin
      if q.Back = null then
         q.Back := temp;
      end if;
      if q.Front /= null then
         q.Front.Next := temp;
      end if;

      q.Front := temp;
      q.Count := q.Count + 1;
   end enqueue;


   procedure dequeue (Q: in out Queue) is
      node_data: ItemType;
      temp: QueueNodePointer := q.Back;
   begin
      if q.Front = null then
         raise Queue_Empty;
      end if;
      node_data := q.Back.Data;
      q.Back := q.Back.Next;
      if q.Back = null then
         q.Front := null;
      end if;

   end dequeue;
  procedure print(Q : in Queue) is
      q_copy: Queue := Q;
   begin
      while is_Empty(q_copy) /= True loop
         --what goes here?  idk
         dequeue(q_copy);
      end loop;
   end print;


end queues;
