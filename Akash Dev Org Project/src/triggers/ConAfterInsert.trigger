trigger ConAfterInsert on Contact (after insert)
{
  list<Task> lNewTasks = new list<Task>();
  Task MyTask = new Task(Subject = 'Vaibhavs new task');
  Contact c = [select id from contact where firstname='Vaibhav' limit 1];
  for(integer i=0; i<trigger.new.size(); i++)
  {
     lNewTasks.add(MyTask = new Task(Subject = 'Vaibhavs new task',whoid=c.id));
  }
   
   insert lNewTasks;
   
}