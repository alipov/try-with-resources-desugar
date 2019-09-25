package info.osom.trywithresources;

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.io.File;
import java.io.IOException;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            invokeSample();
        }
    }

    @TargetApi(Build.VERSION_CODES.KITKAT)
    private void invokeSample() {
        try {
            Sample.tryWithResourcesSample(new File(getFilesDir(), "hello.txt"));
        } catch (IOException e) {
            Log.d("TRY", "caught exception: " + e.getMessage());
            Throwable[] suppressed = e.getSuppressed();
            for (Throwable throwable : suppressed) {
                Log.d("TRY", "suppressed exception: " + throwable.getMessage());
            }
        }
    }
}
