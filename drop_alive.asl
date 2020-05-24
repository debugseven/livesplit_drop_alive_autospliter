state("Drop Alive") 
{
    int level_id : 0x0FD36F0, 0x4, 0x8, 0x0, 0x48, 0x44, 0x50, 0xA0;
}

init
{
    vars.id_main_menu = 81;
    vars.id_level_select = 72;
    vars.id_onwards = 10;
}

update
{

}

startup
{

}

start
{
    if (old.level_id == vars.id_level_select && current.level_id == vars.id_onwards) 
    {
        return true;
    }
}

split
{
    if (current.level_id != old.level_id)
    {
        return true;
    }
}

reset
{
    if (current.level_id == vars.id_main_menu)
    {
        return true;
    }
}

isLoading
{

}