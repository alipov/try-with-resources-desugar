package info.osom.trywithresources;

import java.io.File;
import java.io.IOException;

class Sample {
    static void tryWithResourcesSample(File file) throws IOException {
        try (MyFileOutputStream os = new MyFileOutputStream(file)) {
            os.write("hello".getBytes());
            throw new IOException("thrown in try block");
        }
    }
}
