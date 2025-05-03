return{
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end

    },

    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
    }

}
