public with sharing class createDummyCampaignRecords {
    public static void createCampaignAccount() {
        List<Campaign> cmpgn = new List<Campaign>();
        for (Integer i = 1; i <= 40; i++) {
            Campaign cg = new Campaign();
            cg.Name = 'Internship Eglenceli  ' + i;
            cg.Target_Donation_Amount__c =  102002;
            cg.Achieved_Donation_Amount__c=  99000;
            cg.StartDate= Date.today();
            cg.EndDate= Date.today().addDays(+10);
            cg.Campaign_Completion_Date__c= Date.today().addDays(+10);
            cg.Status = 'Expired';
            cmpgn.add(cg);
        }
        if(!cmpgn.isEmpty()){
            insert cmpgn;
        }
    }
}