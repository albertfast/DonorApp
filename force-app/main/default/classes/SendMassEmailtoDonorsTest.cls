@isTest  
public class SendMassEmailtoDonorsTest {
  @isTest
  public static void testSendCampaignNotificationEmails() {
    Account testAccount = new Account(
      PersonEmail='test@gmail.com',
      LastName='Test'
    );
    insert testAccount;
    
       
    Campaign testCampaign = new Campaign(
      Name = 'Test Campaign'      
    );
    insert testCampaign;
    
    EmailTemplate testEmailTemplate = [SELECT Id,Subject,HtmlValue FROM EmailTemplate WHERE DeveloperName = 'Send_Campaign_Notification_Emails' LIMIT 1];
    
    List<sendMassEmailtoDonors.InputRequest> testInputs = new List<sendMassEmailtoDonors.InputRequest>();
    sendMassEmailtoDonors.InputRequest testInput = new sendMassEmailtoDonors.InputRequest();
    testInput.donorEmail = new List<String>{testAccount.PersonEmail};
    testInput.campaignId = new List<Id>{testCampaign.Id};
    testInputs.add(testInput);

    Test.startTest();
    sendMassEmailtoDonors.sendCampaignNotificationEmails(testInputs);
    Test.stopTest();
    
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    email.setSubject(testEmailTemplate.Subject);
    email.setHtmlBody(Messaging.renderStoredEmailTemplate(testEmailTemplate.Id, testAccount.PersonContactId, testCampaign.Id).getHtmlBody());
    email.setToAddresses(new List<String>{testAccount.PersonEmail});
    email.setTargetObjectId(testAccount.PersonContactId);
    email.setSaveAsActivity(true);
    email.setTemplateId(testEmailTemplate.Id);
    email.setWhatId(testCampaign.Id);
    emails.add(email);
    List<Messaging.SendEmailResult> emailsSent = Messaging.sendEmail(emails);
    
    System.assertEquals(1, emailsSent.size());
    System.assertEquals(0, emailsSent[0].getErrors().size());
  }



  @isTest 
  public static EmailTemplate createEmailTemplate() {
      EmailTemplate testEmailTemplate = new EmailTemplate(
          DeveloperName = 'Send_Campaign_Notification_Emails',
          FolderId = UserInfo.getUserId(),
          Subject = 'Test Subject',
          HtmlValue = 'Test Body',
          IsActive=true,
          Name='Test',
          TemplateType='text'

      );
      insert testEmailTemplate;
      return testEmailTemplate;
  }
}