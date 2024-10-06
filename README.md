<div align="center">
  <pre>
    ██████╗  ██████╗ ████████╗   ███╗   ██╗██╗██╗  ██╗███████╗
    ██╔══██╗██╔═══██╗╚══██╔══╝   ████╗  ██║██║╚██╗██╔╝██╔════╝
    ██║  ██║██║   ██║   ██║█████╗██╔██╗ ██║██║ ╚███╔╝ █████╗  
    ██║  ██║██║   ██║   ██║╚════╝██║╚██╗██║██║ ██╔██╗ ██╔══╝  
    ██████╔╝╚██████╔╝   ██║      ██║ ╚████║██║██╔╝ ██╗███████╗
    ╚═════╝  ╚═════╝    ╚═╝      ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚══════╝
  </pre>
</div>

# dot-nixe
This is my `nixos` configuration, built with `flakes` and `home-manager`. I plan on heavy usage of `ags` for custom widgets (status bar, app launcher, etc.).

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Showcase](#showcase)
- [Contributing](#contributing)
- [License](#license)

## Installation
> [!IMPORTANT]
> If you install on a VM, make sure to enable `hardware-acceleration`. Also, change the GRUB boot settings to use the appropriate device, e.g., `"/dev/sda"`.

1. Add experimental features to `configuration.nix`:
    ```nix
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    ```

2. Rebuild your system to apply changes:
    ```bash
    sudo nixos-rebuild switch
    ```

3. Clone the repository:
    ```bash
    git clone https://github.com/Permafrozen/dot-nixe
    ```

4. Copy your `/etc/nixos/hardware-configuration.nix` to the host you want to use (the default host is `laptop`):
    ```bash
    cp /etc/nixos/hardware-configuration.nix ~/PATH/TO/DIRECTORY/hosts/laptop
    ```

5. Rebuild with the flake *(inside the dot-nixe directory)*:
    ```bash
    sudo nixos-rebuild switch --flake .
    ```

## Usage
todo

## Showcase
todo

## Contributing
todo

## License
todo
