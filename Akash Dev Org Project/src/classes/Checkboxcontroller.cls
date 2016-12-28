public with sharing class Checkboxcontroller {
  public boolean mycheckval { get; set; }

  public Checkboxcontroller () {
    mycheckval = false;
  }

  public void dosomething() {
    Integer a;
    if(mycheckval) {
    a = 10; 
    system.debug('Printing a --->' +a);    
    }
  }
}