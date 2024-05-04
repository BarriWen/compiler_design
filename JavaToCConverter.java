import java.io.*;
import java.util.*;

public class JavaToCConverter {
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: JavaToCConverter <input_file.java> <output_file.c>");
            return;
        }

        String inputFileName = args[0];
        String outputFileName = args[1];

        try {
            String javaCode = readFromFile(inputFileName);
            String cCode = convertToC(javaCode);
            writeToFile(outputFileName, cCode);
            System.out.println("Conversion completed successfully!");
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    private static String readFromFile(String fileName) throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line).append("\n");
            }
        }
        return stringBuilder.toString();
    }

    private static void writeToFile(String fileName, String content) throws IOException {
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(fileName))) {
            bufferedWriter.write(content);
        }
    }

    private static String convertToC(String javaCode) {
        // Simple conversion logic, you may need to extend this for more complex cases
        // For simplicity, let's assume we just replace 'System.out.println' with 'printf'
        return javaCode.replaceAll("System.out.println", "printf");
    }
}
