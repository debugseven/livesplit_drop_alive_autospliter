state("Drop Alive") 
{
    int scene_id : 0x0FD36F0, 0x4, 0x8, 0x0, 0x48, 0x44, 0x50, 0xA0;
}

init
{
    vars.id_main_menu = 81;
    vars.id_level_select = 72;
    vars.id_onwards = 10;
    vars.id_milky_way = 60;
    vars.id_warming_up = 110;


    vars.id_drop_alive = 40;
}

update
{

}

startup
{

}

start
{
    if (old.scene_id == vars.id_level_select && current.scene_id == vars.id_onwards) 
    {
        return true;
    }
}

split
{

    if (current.scene_id != old.scene_id && current.scene_id != 0)
    {
        return true;
    }

}

reset
{
    if (current.scene_id == vars.id_main_menu || current.scene_id == vars.id_level_select)
    {
        return true;
    }
}

isLoading
{

}