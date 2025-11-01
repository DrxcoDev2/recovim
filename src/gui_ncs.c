
#include "../includes/gui_ncs.h"
#include <ncurses.h>




void curses_init(){
    initscr();
    noecho();                   
    raw();
    curs_set(2);
    start_color();
    init_pair(1, COLOR_CYAN, COLOR_BLACK); /*COLOR codes for ncurses*/
    init_pair(2, COLOR_GREEN, COLOR_BLACK);
    init_pair(3, COLOR_WHITE, COLOR_BLACK);



}

/*Renders the window from the first line i.e. Y = 0, and the "start" buffer pointer.*/
void loadwin(buffer *bf, int y) {
    int x = 0;
    int line_offset = 6;

    start_color();
    use_default_colors();
    init_pair(10, COLOR_CYAN, -1);

    attron(COLOR_PAIR(3));
    int screen_height = LINES;
    int line_num = 0;

    // Borrar solo las líneas visibles
    for (int i = 0; i < screen_height; i++) {
        move(i, 0);
        clrtoeol();
    }

    while (bf != NULL && line_num < screen_height) {
        attron(COLOR_PAIR(10));
        mvprintw(y, 0, "%4d", bf->cur_line);
        attroff(COLOR_PAIR(10));

        attron(COLOR_PAIR(3));
        mvprintw(y, line_offset, "%s", bf->line);
        attroff(COLOR_PAIR(3));

        y++;
        bf = bf->next;
        line_num++;
    }

    refresh();
}




/*not used, was initially supposed to put tildes on each line, but later discarded.*/
void tildeall(){
	int x = 0, y = 0, ht;
	getmaxyx(stdscr, ht, x);
	x = 0;
	for(y = 0; y < ht; y ++){
		mvaddch(y, x, '~');
	}
	refresh();
	move(0, 0);
}