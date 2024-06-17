SELECT Id, Name FROM Account

SELECT Id, Name 
, ( SELECT Email FROM Contacts WHERE AccountId != null )
FROM Account 

SELECT Id, CNAE__r.Code__c, CNAE__r.Description__c FROM Account WHERE CNAE__c != null

SELECT Id, Name,  AccountId, Account.Name, Account.CNAE__r.Description__c
FROM Contact
WHERE Account.CNAE__r.Code__c = '98129823'


SELECT Id, Name FROM 
Account 
WHERE BillingCity IN ( SELECT OtherState FROM Contact WHERE OtherState != null )

 

SELECT Id, Name, 
(SELECT Id, NAME FROM Addresses__r )
FROM Account 
WHERE Id IN (SELECT Account__c FROM Address__c)

