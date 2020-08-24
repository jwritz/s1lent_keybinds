Config = {}

Config.categories = {
    {
        category='General',
        keys={
            {description='Open/Close phone', key='F1'},
            {description='Open/Close inventory', key='F2'},
        },
    },
    {
        category='Vehicle',
        keys={
            {description='Hazards', key='Backspace'},
        },
        commands={
            {description='Switch to a seat', command='/seat', arguments='[seat number]'},
        },
    },
    {
        category='Help',
        commands={
            {description='Open this menu', command='/keybinds', arguments=''},
            {description='Open this menu', command='/commands', arguments=''},
        },
    },
    -- {
    --     category='',
    --     keys={
    --         {description='', key=''},
    --     },
    --     commands={
    --         {description='', command='', arguments=''},
    --     },
    -- },
}