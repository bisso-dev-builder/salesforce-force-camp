@isTest
public class LeadFixtureFactory {

    public static Lead newLead (String name, String document) {

        return new Lead (
            LastName = name
            , Cpf__c = document
            , Company = 'Company' + name
            , Email = name + '@mail.com'
        );

    }


    public static Lead fromJson(String payload) {
        return (Lead) JSON.deserialize(payload, Lead.class);
    }

}