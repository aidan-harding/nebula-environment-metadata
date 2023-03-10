/**
 * @author aidan@nebulaconsulting.co.uk
 * @date 24/02/2021
 */

@IsTest
private class EnvironmentPropertiesTest {

    @IsTest
    static void testBehavior() {
        EnvironmentProperties.environmentProperties = new EnvironmentMetadata(Property__mdt.SObjectType, Property__mdt.Key__c)
                .overrideOrgDomainUrl('https://match.my.salesforce.com');

        String value = EnvironmentProperties.get('My_Label');
        System.assertEquals([SELECT Value__c FROM Property__mdt WHERE Environment__r.DeveloperName = 'Specific'].Value__c, value);
    }

    @IsTest
    static void overrideEnvironment() {
        EnvironmentProperties.environmentProperties = new EnvironmentMetadata(Property__mdt.SObjectType, Property__mdt.Key__c)
                .overrideOrgDomainUrl('https://no-match.my.salesforce.com');

        String value = EnvironmentProperties.get('My_Label');
        System.assertEquals([SELECT Value__c FROM Property__mdt WHERE Environment__r.DeveloperName = 'Default'].Value__c, value);
    }
}