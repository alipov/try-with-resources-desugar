package info.osom.trywithresources;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

class MyFileOutputStream extends FileOutputStream {
    MyFileOutputStream(File file) throws FileNotFoundException {
        super(file);
    }

    @Override
    public void close() throws IOException {
        super.close();
        throw new IOException("thrown in close");
    }
}
