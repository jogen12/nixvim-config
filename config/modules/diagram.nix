{
  plugins = {
    diagram = {
      enable = true;
      settings = {
        events = {
          render_buffer = [];
          clear_buffer = ["BufLeave"];
        };
        renderer_options = {
          mermaid = {
            theme = "dark";
            scale = 2;
          };
        };
      };
    };
  };

  autoCmd = [
    {
      event = "FileType";
      pattern = ["markdown" "norg"];
      callback.__raw = ''
        function(args)
          vim.keymap.set("n", "<leader>uh", function()
            local ok, d = pcall(require, "diagram")
            if not ok then
              vim.notify("diagram.nvim not available", vim.log.levels.ERROR)
              return
            end
            if d.show_diagram_hover then
              d.show_diagram_hover()
            else
              vim.notify("diagram.nvim: show_diagram_hover() not found", vim.log.levels.ERROR)
            end
          end, { buffer = args.buf, silent = true, desc = "Diagram: show hover" })
        end
      '';
    }
  ];
}
