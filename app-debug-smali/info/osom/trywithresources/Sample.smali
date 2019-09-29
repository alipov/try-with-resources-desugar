.class Linfo/osom/trywithresources/Sample;
.super Ljava/lang/Object;
.source "Sample.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getSuppressedOrEmpty(Ljava/lang/Exception;)[Ljava/lang/Throwable;
    .registers 3
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 35
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 36
    invoke-static {p0}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->getSuppressed(Ljava/lang/Throwable;)[Ljava/lang/Throwable;

    move-result-object v0

    .line 38
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Throwable;

    goto :goto_a
.end method

.method private static invokeSample(Landroid/content/Context;)V
    .registers 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, "hello.txt"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v3}, Linfo/osom/trywithresources/Sample;->tryWithResourcesSample(Ljava/io/File;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_10

    .line 25
    :cond_f
    return-void

    .line 18
    :catch_10
    move-exception v0

    .line 19
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v3, "TRY"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "caught exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    invoke-static {v0}, Linfo/osom/trywithresources/Sample;->getSuppressedOrEmpty(Ljava/lang/Exception;)[Ljava/lang/Throwable;

    move-result-object v1

    .line 21
    .local v1, "suppressed":[Ljava/lang/Throwable;
    array-length v4, v1

    const/4 v3, 0x0

    :goto_35
    if-ge v3, v4, :cond_f

    aget-object v2, v1, v3

    .line 22
    .local v2, "throwable":Ljava/lang/Throwable;
    const-string/jumbo v5, "TRY"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "suppressed exception: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    add-int/lit8 v3, v3, 0x1

    goto :goto_35
.end method

.method static run(Landroid/content/Context;)V
    .registers 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    invoke-static {p0}, Linfo/osom/trywithresources/Sample;->invokeSample(Landroid/content/Context;)V

    .line 13
    return-void
.end method

.method private static tryWithResourcesSample(Ljava/io/File;)V
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 28
    new-instance v0, Linfo/osom/trywithresources/MyFileOutputStream;

    invoke-direct {v0, p0}, Linfo/osom/trywithresources/MyFileOutputStream;-><init>(Ljava/io/File;)V

    .local v0, "os":Linfo/osom/trywithresources/MyFileOutputStream;
    const/4 v3, 0x0

    .line 29
    :try_start_6
    const-string/jumbo v1, "hello"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Linfo/osom/trywithresources/MyFileOutputStream;->write([B)V

    .line 30
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "thrown in try block"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_19} :catch_19
    .catchall {:try_start_6 .. :try_end_19} :catchall_2e

    .line 28
    :catch_19
    move-exception v1

    :try_start_1a
    throw v1
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_1b

    .line 31
    :catchall_1b
    move-exception v2

    move-object v3, v1

    :goto_1d
    if-eqz v0, :cond_24

    if-eqz v3, :cond_2a

    :try_start_21
    invoke-virtual {v0}, Linfo/osom/trywithresources/MyFileOutputStream;->close()V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_24} :catch_25

    :cond_24
    :goto_24
    throw v2

    :catch_25
    move-exception v1

    invoke-static {v3, v1}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_24

    :cond_2a
    invoke-virtual {v0}, Linfo/osom/trywithresources/MyFileOutputStream;->close()V

    goto :goto_24

    :catchall_2e
    move-exception v1

    move-object v2, v1

    goto :goto_1d
.end method
