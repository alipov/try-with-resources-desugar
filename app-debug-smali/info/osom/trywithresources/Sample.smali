.class Linfo/osom/trywithresources/Sample;
.super Ljava/lang/Object;
.source "Sample.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getSuppressedOrEmpty(Ljava/lang/Exception;)[Ljava/lang/Throwable;
    .registers 3
    .param p0, "e"    # Ljava/lang/Exception;

    .line 35
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 36
    invoke-virtual {p0}, Ljava/lang/Exception;->getSuppressed()[Ljava/lang/Throwable;

    move-result-object v0

    return-object v0

    .line 38
    :cond_b
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Throwable;

    return-object v0
.end method

.method private static invokeSample(Landroid/content/Context;)V
    .registers 9
    .param p0, "context"    # Landroid/content/Context;

    .line 17
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "hello.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Linfo/osom/trywithresources/Sample;->tryWithResourcesSample(Ljava/io/File;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_f

    .line 24
    goto :goto_4f

    .line 18
    :catch_f
    move-exception v0

    .line 19
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "caught exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TRY"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    invoke-static {v0}, Linfo/osom/trywithresources/Sample;->getSuppressedOrEmpty(Ljava/lang/Exception;)[Ljava/lang/Throwable;

    move-result-object v1

    .line 21
    .local v1, "suppressed":[Ljava/lang/Throwable;
    array-length v3, v1

    const/4 v4, 0x0

    :goto_30
    if-ge v4, v3, :cond_4f

    aget-object v5, v1, v4

    .line 22
    .local v5, "throwable":Ljava/lang/Throwable;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "suppressed exception: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .end local v5    # "throwable":Ljava/lang/Throwable;
    add-int/lit8 v4, v4, 0x1

    goto :goto_30

    .line 25
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "suppressed":[Ljava/lang/Throwable;
    :cond_4f
    :goto_4f
    return-void
.end method

.method static run(Landroid/content/Context;)V
    .registers 1
    .param p0, "context"    # Landroid/content/Context;

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

    .line 28
    new-instance v0, Linfo/osom/trywithresources/MyFileOutputStream;

    invoke-direct {v0, p0}, Linfo/osom/trywithresources/MyFileOutputStream;-><init>(Ljava/io/File;)V

    .line 29
    .local v0, "os":Linfo/osom/trywithresources/MyFileOutputStream;
    :try_start_5
    const-string v1, "hello"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Linfo/osom/trywithresources/MyFileOutputStream;->write([B)V

    .line 30
    new-instance v1, Ljava/io/IOException;

    const-string v2, "thrown in try block"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "os":Linfo/osom/trywithresources/MyFileOutputStream;
    .end local p0    # "file":Ljava/io/File;
    throw v1
    :try_end_16
    .catchall {:try_start_5 .. :try_end_16} :catchall_16

    .line 28
    .restart local v0    # "os":Linfo/osom/trywithresources/MyFileOutputStream;
    .restart local p0    # "file":Ljava/io/File;
    :catchall_16
    move-exception v1

    .end local v0    # "os":Linfo/osom/trywithresources/MyFileOutputStream;
    .end local p0    # "file":Ljava/io/File;
    :try_start_17
    throw v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_18

    .line 31
    .restart local v0    # "os":Linfo/osom/trywithresources/MyFileOutputStream;
    .restart local p0    # "file":Ljava/io/File;
    :catchall_18
    move-exception v2

    :try_start_19
    invoke-virtual {v0}, Linfo/osom/trywithresources/MyFileOutputStream;->close()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1d

    goto :goto_21

    :catchall_1d
    move-exception v3

    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_21
    throw v2
.end method
