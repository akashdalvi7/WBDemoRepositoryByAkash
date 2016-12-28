@RestResource(urlMapping='/helloWorld/*')
global class RestWebservice {

  @HttpGet
  global static String helloWorld(){
    System.debug('Hey Akash, you have just implemented REST Apex Service..!!');
    return 'HelloWorld';
  }
  

}