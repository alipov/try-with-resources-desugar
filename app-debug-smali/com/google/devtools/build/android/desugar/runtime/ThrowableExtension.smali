.class public final Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;
.super Ljava/lang/Object;
.source "ThrowableExtension.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;,
        Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$ConcurrentWeakIdentityHashMap;,
        Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$MimicDesugaringStrategy;,
        Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$ReuseDesugaringStrategy;,
        Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    }
.end annotation


# static fields
.field private static final ANDROID_OS_BUILD_VERSION:Ljava/lang/String; = "android.os.Build$VERSION"

.field static final API_LEVEL:I

.field static final STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

.field public static final SYSTEM_PROPERTY_TWR_DISABLE_MIMIC:Ljava/lang/String; = "com.google.devtools.build.android.desugar.runtime.twr_disable_mimic"


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 54
    const/4 v0, 0x0

    .line 56
    .local v0, "apiLevel":Ljava/lang/Integer;
    :try_start_1
    invoke-static {}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->readApiLevelFromBuildVersion()Ljava/lang/Integer;

    move-result-object v0

    .line 57
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x13

    if-lt v3, v4, :cond_1c

    .line 58
    new-instance v2, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$ReuseDesugaringStrategy;

    invoke-direct {v2}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$ReuseDesugaringStrategy;-><init>()V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_14} :catch_2e

    .line 75
    .local v2, "strategy":Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    :goto_14
    sput-object v2, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

    .line 76
    if-nez v0, :cond_60

    const/4 v3, 0x1

    :goto_19
    sput v3, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->API_LEVEL:I

    .line 77
    return-void

    .line 59
    .end local v2    # "strategy":Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    :cond_1c
    :try_start_1c
    invoke-static {}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->useMimicStrategy()Z

    move-result v3

    if-eqz v3, :cond_28

    .line 60
    new-instance v2, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;

    invoke-direct {v2}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;-><init>()V

    .restart local v2    # "strategy":Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    goto :goto_14

    .line 62
    .end local v2    # "strategy":Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    :cond_28
    new-instance v2, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;

    invoke-direct {v2}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;-><init>()V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_2d} :catch_2e

    .restart local v2    # "strategy":Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    goto :goto_14

    .line 64
    .end local v2    # "strategy":Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    :catch_2e
    move-exception v1

    .line 67
    .local v1, "e":Ljava/lang/Throwable;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "An error has occured when initializing the try-with-resources desuguring strategy. The default strategy "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-class v5, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;

    .line 70
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "will be used. The error is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 67
    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 72
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 73
    new-instance v2, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;

    invoke-direct {v2}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$NullDesugaringStrategy;-><init>()V

    .restart local v2    # "strategy":Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    goto :goto_14

    .line 76
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_60
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_19
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "receiver"    # Ljava/lang/Throwable;
    .param p1, "suppressed"    # Ljava/lang/Throwable;

    .prologue
    .line 84
    sget-object v0, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

    invoke-virtual {v0, p0, p1}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 85
    return-void
.end method

.method public static closeResource(Ljava/lang/Throwable;Ljava/lang/Object;)V
    .registers 8
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "resource"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 104
    if-nez p1, :cond_3

    .line 139
    .end local p1    # "resource":Ljava/lang/Object;
    :goto_2
    return-void

    .line 108
    .restart local p1    # "resource":Ljava/lang/Object;
    :cond_3
    :try_start_3
    sget v3, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->API_LEVEL:I

    const/16 v4, 0x13

    if-lt v3, v4, :cond_16

    .line 109
    check-cast p1, Ljava/lang/AutoCloseable;

    .end local p1    # "resource":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_e} :catch_f

    goto :goto_2

    .line 131
    :catch_f
    move-exception v1

    .line 132
    .local v1, "e":Ljava/lang/Throwable;
    if-eqz p0, :cond_7b

    .line 133
    invoke-static {p0, v1}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 134
    throw p0

    .line 111
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local p1    # "resource":Ljava/lang/Object;
    :cond_16
    :try_start_16
    instance-of v3, p1, Ljava/io/Closeable;

    if-eqz v3, :cond_20

    .line 112
    check-cast p1, Ljava/io/Closeable;

    .end local p1    # "resource":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_1f} :catch_f

    goto :goto_2

    .line 115
    .restart local p1    # "resource":Ljava/lang/Object;
    :cond_20
    :try_start_20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string/jumbo v4, "close"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 116
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_34
    .catch Ljava/lang/NoSuchMethodException; {:try_start_20 .. :try_end_34} :catch_35
    .catch Ljava/lang/SecurityException; {:try_start_20 .. :try_end_34} :catch_7c
    .catch Ljava/lang/IllegalAccessException; {:try_start_20 .. :try_end_34} :catch_55
    .catch Ljava/lang/IllegalArgumentException; {:try_start_20 .. :try_end_34} :catch_7f
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_20 .. :try_end_34} :catch_82
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_20 .. :try_end_34} :catch_75
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_34} :catch_f

    goto :goto_2

    .line 117
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :catch_35
    move-exception v3

    move-object v1, v3

    .line 118
    .local v1, "e":Ljava/lang/Exception;
    :goto_37
    :try_start_37
    new-instance v3, Ljava/lang/AssertionError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " does not have a close() method."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 119
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_55
    move-exception v3

    move-object v1, v3

    .line 122
    .local v1, "e":Ljava/lang/Throwable;
    :goto_57
    new-instance v3, Ljava/lang/AssertionError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Fail to call close() on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 123
    .end local v1    # "e":Ljava/lang/Throwable;
    :catch_75
    move-exception v1

    .line 126
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 127
    .local v0, "cause":Ljava/lang/Throwable;
    throw v0
    :try_end_7b
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_7b} :catch_f

    .line 136
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local p1    # "resource":Ljava/lang/Object;
    .local v1, "e":Ljava/lang/Throwable;
    :cond_7b
    throw v1

    .line 117
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local p1    # "resource":Ljava/lang/Object;
    :catch_7c
    move-exception v3

    move-object v1, v3

    goto :goto_37

    .line 119
    :catch_7f
    move-exception v3

    move-object v1, v3

    goto :goto_57

    :catch_82
    move-exception v3

    move-object v1, v3

    goto :goto_57
.end method

.method public static getStrategy()Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

    return-object v0
.end method

.method public static getSuppressed(Ljava/lang/Throwable;)[Ljava/lang/Throwable;
    .registers 2
    .param p0, "receiver"    # Ljava/lang/Throwable;

    .prologue
    .line 88
    sget-object v0, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

    invoke-virtual {v0, p0}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;->getSuppressed(Ljava/lang/Throwable;)[Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public static printStackTrace(Ljava/lang/Throwable;)V
    .registers 2
    .param p0, "receiver"    # Ljava/lang/Throwable;

    .prologue
    .line 92
    sget-object v0, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

    invoke-virtual {v0, p0}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;->printStackTrace(Ljava/lang/Throwable;)V

    .line 93
    return-void
.end method

.method public static printStackTrace(Ljava/lang/Throwable;Ljava/io/PrintStream;)V
    .registers 3
    .param p0, "receiver"    # Ljava/lang/Throwable;
    .param p1, "stream"    # Ljava/io/PrintStream;

    .prologue
    .line 100
    sget-object v0, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

    invoke-virtual {v0, p0, p1}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;->printStackTrace(Ljava/lang/Throwable;Ljava/io/PrintStream;)V

    .line 101
    return-void
.end method

.method public static printStackTrace(Ljava/lang/Throwable;Ljava/io/PrintWriter;)V
    .registers 3
    .param p0, "receiver"    # Ljava/lang/Throwable;
    .param p1, "writer"    # Ljava/io/PrintWriter;

    .prologue
    .line 96
    sget-object v0, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->STRATEGY:Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;

    invoke-virtual {v0, p0, p1}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension$AbstractDesugaringStrategy;->printStackTrace(Ljava/lang/Throwable;Ljava/io/PrintWriter;)V

    .line 97
    return-void
.end method

.method private static readApiLevelFromBuildVersion()Ljava/lang/Integer;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 161
    :try_start_1
    const-string/jumbo v3, "android.os.Build$VERSION"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 162
    .local v0, "buildVersionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v3, "SDK_INT"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 163
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_16} :catch_17

    .line 170
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :goto_16
    return-object v3

    .line 164
    :catch_17
    move-exception v1

    .line 165
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v5, "Failed to retrieve value from android.os.Build$VERSION.SDK_INT due to the following exception."

    invoke-virtual {v3, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 169
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v3}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    move-object v3, v4

    .line 170
    goto :goto_16
.end method

.method private static useMimicStrategy()Z
    .registers 1

    .prologue
    .line 142
    const-string/jumbo v0, "com.google.devtools.build.android.desugar.runtime.twr_disable_mimic"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
