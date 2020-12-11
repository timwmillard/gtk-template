#include <gtk/gtk.h>

int main(int argc, char *argv[]) {
    GtkBuilder *builder;
    GtkWidget *window;
    GError *err;

    gtk_init(&argc, &argv);

    builder = gtk_builder_new();
    gtk_builder_add_from_file(builder, "glade/windowmain.glade", &err);
    if (err != NULL) {
        fprintf(stderr, "Builder add from file failed: %s\n", err->message);
        g_error_free(err);
        return 1;
    }

    window = GTK_WIDGET(gtk_builder_get_object(builder, "window_main"));
    gtk_builder_connect_signals(builder, NULL);

    g_object_unref(builder);

    gtk_widget_show(window);

    gtk_main();

    return 0;
}

void on_window_main_destroy() {
    gtk_main_quit();
}
