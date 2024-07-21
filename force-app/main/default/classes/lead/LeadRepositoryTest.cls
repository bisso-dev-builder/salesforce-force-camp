@isTest
public class LeadRepositoryTest {
 
    
    public class LeadRepositoryMock extends LeadRepository {
        
        String payload;

        public LeadRepositoryMock (String payload) {
            this.payload = payload;
        }

        override
        public Lead findByEmail (String email) {            

            return LeadFixtureFactory.fromJson(payload);

        }


    }

}