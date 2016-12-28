public class redirectdemocontroller{
    public String name {get;set;}
    public List<Contact> conList{get;set;}
    public PageReference redirect(){
        name = 'Akash';
        conList = Database.Query('select id, name from contact where name like \'%' + name + '%\'');
        PageReference pg = new PageReference('/apex/Page2');
        return pg;
    }
}