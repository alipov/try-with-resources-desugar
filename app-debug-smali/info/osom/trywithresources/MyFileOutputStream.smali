.class Linfo/osom/trywithresources/MyFileOutputStream;
.super Ljava/io/FileOutputStream;
.source "MyFileOutputStream.java"


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 10
    invoke-direct {p0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 11
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15
    invoke-super {p0}, Ljava/io/FileOutputStream;->close()V

    .line 16
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "thrown in close"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
