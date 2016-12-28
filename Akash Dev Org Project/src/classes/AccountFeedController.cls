public class AccountFeedController {
        
        public AccountFeedController(){ }
        
        public List<AccountFeed> getRecentTetupdates(){
            list<AccountFeed> aAccountFeed = [ select type,createdDate,CreatedBy.Name from AccountFeed WHERE type='TextPost' Order by createdDate ];
            return aAccountFeed;
        }
}