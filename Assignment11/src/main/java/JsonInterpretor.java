import org.json.*;

import java.util.Iterator;

public class JsonInterpretor {
    private JSONObject json;
    private String SQLString;
    private String bodyEnding = "PRIMARY KEY (`id`)";
    private String javaString = "";
    private String javaEnding = "";

    public JsonInterpretor(String stringJson) {
        this.json = new JSONObject(stringJson);
        this.SQLString = generateSQLString();
    }

    private String generateSQLString(){
        String sqlString = "";
        sqlString = sqlString.concat(extractDbName(this.json));
        sqlString = sqlString.concat(extractEntities(this.json));
        return sqlString;
    }

    private String extractDbName(JSONObject obj){
        return transformDbName(obj.getString("schemaName"));
    }

    private String extractEntities(JSONObject obj){
        JSONArray arr = obj.getJSONArray("entities");
        String entities = "";
        for (int i = 0; i < arr.length(); i++) {
            JSONObject test = arr.optJSONObject(i);
            Iterator<String> tableItr = arr.optJSONObject(i).keys();
            javaEnding = "";
            while (tableItr.hasNext()) {
                String tableHeader = tableItr.next();
                entities = entities.concat(transformEntityHeader(tableHeader));
                javaString = javaString.concat(generateClassHeader(tableHeader));
                JSONObject currVal = test.optJSONObject(tableHeader);
                Iterator<String> tableValItr = currVal.keys();
                bodyEnding = "";
                while(tableValItr.hasNext()){
                    String columnHeader = tableValItr.next();
                    entities = entities.concat(transformEntityBody(columnHeader, currVal.getString(columnHeader)));
                    javaString = javaString.concat(transformClassBody(columnHeader, currVal.getString(columnHeader)));
                }
                entities = entities.concat(bodyEnding);
                entities = entities.concat(" ); ");
                javaString = javaString.concat(javaEnding);
            }
            javaString.concat("} \r\n \r\n");
        }
        return entities;
    }

    private String transformDbName(String name){
      return "CREATE SCHEMA IF NOT EXISTS "+"`"+name+"`"+"DEFAULT CHARACTER SET latin1; use "+name+"; ";
    }

    private String transformEntityHeader(String entity){
        return "DROP TABLE IF EXISTS `"+entity+"`; CREATE TABLE "+"`"+entity+"`"+" (  `id` int(11) NOT NULL ";
    }

    private String generateClassHeader(String entity){
        return "public class "+entity+" {\r\n";
    }

    private String transformClassBody(String key, String val){
        String body = "";
        if (val.toLowerCase().equals("number")) {
            body = body.concat("private int "+key+";\r\n");
            javaEnding = javaEnding.concat("    public int get"+key+"() {\n" +
                    "        return "+key+";\n" +
                    "    }\r\n" +
                    "\n" +
                    "    public void set"+key+"(int "+key+") {\n" +
                    "        this."+key+" = "+key+";\n" +
                    "    }\r\n");
        } else if (val.toLowerCase().equals("string")) {
            body = body.concat("private String "+key+";\r\n");
            javaEnding = javaEnding.concat("    public String get"+key+"() {\n" +
                    "        return "+key+";\n" +
                    "    }\r\n" +
                    "\n" +
                    "    public void set"+key+"(String "+key+") {\n" +
                    "        this."+key+" = "+key+";\n" +
                    "    }\r\n");
        } else if (val.toLowerCase().substring(0,1).equals("*")) {
            String fixedVal = val.substring(1);
            body = body.concat("private List<"+ fixedVal + "> "+key+";\r\n");
            javaEnding = javaEnding.concat("public List<"+fixedVal+"> get"+key+"() {\n" +
                    "        return "+key+";\n" +
                    "    }\r\n" +
                    "\n" +
                    "    public void set"+key+"(List<"+fixedVal+"> "+key+") {\n" +
                    "        this."+key+" = "+key+";\n" +
                    "    }\r\n \r\n");
        } else {
            body = body.concat("private "+val+" "+key+";\r\n");
            javaEnding = javaEnding.concat("public "+val+" get"+key+"() {\n" +
                    "        return "+key+";\n" +
                    "    }\r\n" +
                    "\n" +
                    "    public void set"+key+"("+val+" "+key+") {\n" +
                    "        this."+key+" = "+key+";\n" +
                    "    }\r\n");
        }
        return body;
    };

    private String transformEntityBody(String key, String val){
        String body = "";
        if (val.toLowerCase().equals("number")) {
            body = body.concat(", `"+key+"` int(15) ");
        } else if (val.toLowerCase().equals("string")) {
            body = body.concat(", `"+key+"` varchar(250) ");
        } else if (val.toLowerCase().substring(0,1).equals("*")) {
            String fixedVal = val.substring(1);
            body = body.concat(", `"+ key + "` varchar(250) ");
            bodyEnding = bodyEnding.concat(", FOREIGN KEY (`" + key + "`) REFERENCES `" + fixedVal + "` (`id`) ");
        } else {
            body = body.concat(", `"+ key + "` varchar(250) ");
            bodyEnding = bodyEnding.concat(", FOREIGN KEY (`" + key + "`) REFERENCES `" + val + "` (`id`) ");
        }
        return body;
    }

    public String getSQLString() {
        return SQLString;
    }

    public void setSQLString(String SQLString) {
        this.SQLString = SQLString;
    }

    public String getJavaString() {
        return javaString;
    }

    public void setJavaString(String javaString) {
        this.javaString = javaString;
    }
}