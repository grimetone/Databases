import org.json.*;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

public class Runner {
    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
        String JsonString = "{\"schemaName\": \"MicroShop\",\n" +
                "  \"entities\": [\n" +
                "  \t{\"Customer\": {\n" +
                "  \t\t\"name\": \"String\",\n" +
                "  \t\t\"orders\" :\"*Order\"}},\n" +
                "  \t{\"Order\" :{\n" +
                "  \t\t\"date\": \"String\",\n" +
                "  \t\t\"total\": \"Number\",\n" +
                "  \t\t\"customer\": \"Customer\",\n" +
                "  \t\t\"lines\": \"*OrderLine\" }},\n" +
                "  \t{\"OrderLine\" : {\n" +
                "  \t\t\"order\": \"Order\",\n" +
                "  \t\t\"product\": \"Product\",\n" +
                "  \t\t\"count\": \"Number\",\n" +
                "  \t\t\"total\": \"Number\" }},\n" +
                "  \t{\"Product\" : {\n" +
                "  \t\t\"name\": \"String\",\n" +
                "  \t\t\"price\" :\"Number\"}}\n" +
                "  ]\n" +
                "}";

        JsonInterpretor res = new JsonInterpretor(JsonString);

        PrintWriter writer = new PrintWriter("sqlSchema.txt", "UTF-8");
        writer.print(res.getSQLString());
        writer.close();

        PrintWriter writer2 = new PrintWriter("javaDef.txt", "UTF-8");
        writer2.print(res.getJavaString());
        writer2.close();

    }
}
