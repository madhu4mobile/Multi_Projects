package resources.helpers;

public class TestFileCreator {

    //String todaylnYYYYMMDD = getDatelnCustowForwatC pattem: "YYYYMMDD");
    //String todaylnyyyyHHddHHmmss = getDatelnCustowForwatC pattern: "yyyyMMddHHmmss") ;
    //public final String SAMPLE_CHECK_FILE_DAT = "sample.file_MadhuTest_"+todayInyyyyMMddHHmmss+".dat";
    public final String SAMPLE_CHECK_FILE_DAT = "sample.file_MadhuTest_"+"_"+".dat";
    int Account9677 = 967713013;
    int Account7901 = 790199053;

/*    @Test //Run to generate a new valid test file.
    public void createFile() {
        File file = new File(SAMPLE_CHECK_FILE_DAT);
        FixedWidthFields headerFields = new FixedWidthFields();
        headerFields.addField("lookahead", 2);
        headerFields.addField("custld", 10);
        headerFields.addField("transmision_date", 14);
        //headerFields. addField(ntronswision_tiwe'', 6);
        headerFields.addField("filler", 274, ' ');

        // headerFields.addField("id", 10, FieldAlignment.RIGHT, ' ');
        FixedWidthFields acctHeaderFields = new FixedWidthFields(); 
        acctHeaderFields.addField( "lookahead", 2);
        acctHeaderFields.addField( "acctNumb", 18, FieldAlignment.LEFT, ' ');
        acctHeaderFields.addField( "Payor Name Line 1", 40, ' ');
        acctHeaderFields.addField( "Payor Name Line 2", 40, ' ');
        acctHeaderFields.addField( "Payor Address Line 1", 40,' ');
        acctHeaderFields.addField(  "Payor Address Line 2", 40,' ');
        acctHeaderFields.addField(  "Payor Address Line 3", 40,' ');
        acctHeaderFields.addField(  "filler", 80, ' ');

        FixedWidthFields documentHeaderFields = new FixedWidthFields();
        documentHeaderFields.addField( "lookahead", 2);
        documentHeaderFields.addField( "acctNumb", 18, FieldAlignment.LEFT, ' ');
        documentHeaderFields.addField( "docType", 2);
        documentHeaderFields.addField( "deliveryCode", 1);
        documentHeaderFields.addField( "currierCode", 3);
        documentHeaderFields.addField( "formCode", 2);
        documentHeaderFields.addField( "mailCode", 1);
        documentHeaderFields.addField( "issueDate", 8);
        documentHeaderFields.addField( "amount", 13, FieldAlignment.RIGHT, '0');
        documentHeaderFields.addField( "checkNum", 10, FieldAlignment.LEFT, ' '); //min Inegth 3
        documentHeaderFields.addField( "traceNum", 30, FieldAlignment.LEFT, ' ');
        documentHeaderFields.addField( "filler", 8);
        documentHeaderFields.addField( "currencyCode", 3);
        documentHeaderFields.addField( "addressKey", 30);
        documentHeaderFields.addField( "filler", 169);

        FixedWidthFields acctTotalFields = new FixedWidthFields();
        acctTotalFields.addField( "lookahead", 2);
        acctTotalFields.addField( "numDocs", 18, FieldAlignment.RIGHT, '0');
        acctTotalFields.addField( "numDocs", 18, FieldAlignment.RIGHT, '0');


    } */
}
