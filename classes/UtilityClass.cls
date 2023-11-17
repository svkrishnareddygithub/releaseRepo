public class UtilityClass implements StubProvider {
   public Object handleMethodCall(Object stubbedObject, String stubbedMethodName,
                                   Type returnType, List<Type> listOfReturnTypes,
                                   List<String> listOfNamesOfParam, List<Object> listOfParamValues) {
        if (stubbedObject instanceof Discount_Rules__mdt) {
            // Simulate Discount_Rules__mdt record
            return new Discount_Rules__mdt(Product_Category__c = 'Cloths', Discount_Percentage__c = 20.0);
        } else if (stubbedObject instanceof Discount_Rule__c) {
            // Simulate Discount_Rule__c record
            return new Discount_Rule__c(Discount__c = 20.0);
        }
        return null;
    }
}