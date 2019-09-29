package info.osom.trywithresources;

import android.content.Context;
import android.os.Build;
import android.util.Log;

import java.io.File;
import java.io.IOException;

class Sample {
    static void run(Context context) {
        invokeSample(context);
    }

    private static void invokeSample(Context context) {
        try {
            Sample.tryWithResourcesSample(new File(context.getFilesDir(), "hello.txt"));
        } catch (IOException e) {
            Log.d("TRY", "caught exception: " + e.getMessage());
            Throwable[] suppressed = getSuppressedOrEmpty(e);
            for (Throwable throwable : suppressed) {
                Log.d("TRY", "suppressed exception: " + throwable.getMessage());
            }
        }
    }

    private static void tryWithResourcesSample(File file) throws IOException {
        try (MyFileOutputStream os = new MyFileOutputStream(file)) {
            os.write("hello".getBytes());
            throw new IOException("thrown in try block");
        }
    }

    private static Throwable[] getSuppressedOrEmpty(Exception e) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            return e.getSuppressed();
        } else {
            return new Throwable[0];
        }
    }
}
