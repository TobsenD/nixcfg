{
  flake.nixosModules.starship = {pkgs, ... }: {
    programs.starship = {
          enable = true;
          settings = {
            add_newline = false;
            command_timeout = 1300;
            scan_timeout = 50;

            format = ''
              [░▒▓█](base00)$os$username$time[](bg:base02 fg:base00)$directory[](bg:base03 fg:base02)$git_branch$git_status[](fg:base03 bg:base04)$c$rust$golang$nodejs$php$java$kotlin$haskell$python$docker_context$conda[](fg:base04)$character
            '';

            os = {
              disabled = false;
              style = "bg:base00 fg:base01";
              symbols = {
                Windows = "";
                Ubuntu = "󰕈";
                SUSE = "";
                Raspbian = "󰐿";
                Mint = "󰣭";
                Macos = "󰀵";
                Manjaro = "";
                Linux = "󰌽";
                Gentoo = "󰣨";
                Fedora = "󰣛";
                Alpine = "";
                Amazon = "";
                Android = "";
                Arch = "󰣇";
                Artix = "󰣇";
                CentOS = "";
                Debian = "󰣚";
                Redhat = "󱄛";
                RedHatEnterprise = "󱄛";
              };
            };

            username = {
              show_always = true;
              style_user = "bg:base00 fg:green";
              style_root = "bg:base00 fg:red";
              format = "[$user]($style)";
            };

            directory = {
              style = "bg:base02 fg:base00";
              format = "[$path]($style)";
              truncation_length = 3;
              truncation_symbol = "…/";
              substitutions = {
                "Documents" = "󰈙 ";
                "Downloads" = " ";
                "Music" = "󰝚 ";
                "Pictures" = " ";
                "Developer" = "󰲋 ";
              };
            };

            git_branch = {
              symbol = "";
              style = "bg:base03 fg:base00";
              format = "[$symbol $branch]($style)";
            };

            git_status = {
              style = "bg:base03 fg:base00";
              format = "[$all_status$ahead_behind]($style)";
            };

            nodejs = {
              symbol = "";
              style = "bg:base04 fg:base13";
              format = "[$symbol($version)]($style)";
            };

            c = {
              symbol = " ";
              style = "bg:base04 fg:base13";
              format = "[$symbol($version)]($style)";
            };

            golang = {
              symbol = "";
              style = "bg:base04 fg:base13";
              format = "[$symbol($version)]($style)";
            };

            php = {
              symbol = "";
              style = "bg:base04 fg:base13";
              format = "[$symbol($version)]($style)";
            };

            java = {
              symbol = " ";
              style = "bg:base04 fg:base13";
              format = "[$symbol($version)]($style)";
            };

            kotlin = {
              symbol = "";
              style = "bg:base04 fg:base13";
              format = "[$symbol($version)]($style)";
            };

            haskell = {
              symbol = "";
              style = "bg:base04 fg:base13";
              format = "[$symbol($version)]($style)";
            };

            python = {
              symbol = "";
              style = "bg:base04 fg:base13";
              format = ''[$symbol($version)(\(#$virtualenv\))]($style)'';
            };

            docker_context = {
              symbol = "";
              style = "bg:base04 fg:base13";
              format = "[$symbol($context)]($style)";
            };

            conda = {
              symbol = "  ";
              style = "bg:base04 fg:base13";
              format = "[$symbol($environment)]($style)";
              ignore_base = false;
            };

            time = {
              disabled = false;
              use_12hr = false;
              utc_time_offset = "local";
              time_format = "%T";
              time_range = "-";
              style = "bg:base00 fg:base16";
              format = "[  $time]($style)";
            };

            line_break = {
              disabled = true;
            };

            character = {
              disabled = false;
              success_symbol = "[❯](fg:green)";
              error_symbol = "[❯](fg:red)";
              vimcmd_symbol = "❮";
              vimcmd_replace_one_symbol = "❮";
              vimcmd_replace_symbol = "❮";
              vimcmd_visual_symbol = "❮";
            };

            cmd_duration = {
              show_milliseconds = true;
              format = " in $duration ";
              style = "bg:lavender";
              disabled = false;
              show_notifications = true;
              min_time_to_notify = 45000;
            };

          };
        };

        home-manager.users.tobsend = {
          home.packages = with pkgs; [
            starship
          ];
        };
      };
}
