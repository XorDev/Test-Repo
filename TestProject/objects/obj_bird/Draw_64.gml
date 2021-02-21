///@desc

draw_set_font(fnt_score);
draw_set_halign(fa_center);
draw_set_color(0);
draw_text(640,8,"SCORE: "+string(floor(max((x-xstart)/180-1,0))));