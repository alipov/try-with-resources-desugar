.class public Linfo/osom/trywithresources/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 9
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 10
    const/high16 v0, 0x7f010000

    invoke-virtual {p0, v0}, Linfo/osom/trywithresources/MainActivity;->setContentView(I)V

    .line 12
    invoke-static {p0}, Linfo/osom/trywithresources/Sample;->run(Landroid/content/Context;)V

    .line 13
    return-void
.end method
