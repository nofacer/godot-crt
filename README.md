# Godot CRT Shader Effect

[![Godot Engine](https://img.shields.io/badge/Godot-478CBF?style=for-the-badge&logo=godotengine&logoColor=white)](https://godotengine.org/)

> **Note**: This plugin is based on the "Realistic CRT shader" by c64cosmin, available at [godotshaders.com](https://godotshaders.com/shader/realistic-crt-shader/).

A high-quality CRT (Cathode Ray Tube) shader for Godot 4.x that simulates the look and feel of old CRT displays with various customizable effects.

## Features

- 🎮 Simulates classic CRT display effects
- 🎨 Fully customizable parameters
- ⚡ Real-time editing support
- 🖥️ Multiple CRT effects supported
- 🛠️ Easy-to-use node-based implementation

## Installation

1. Download or clone this repository into your Godot project's `addons` folder
2. In the Godot editor, go to `Project -> Project Settings -> Plugins`
3. Find and enable the "CRT Shader" plugin

## Usage

1. Add a `CanvasLayer` node to your scene
2. Add a `CRT` node as its child
3. Adjust the CRT node's parameters to achieve the desired display effect

## Parameters

### Base Settings

- **Resolution**: Base resolution for pixel-perfect effects (default: 320x180)
- **Update In Editor**: Toggle real-time effect updates in the editor

### Scanline Effect

- **Scan Line Amount**: Intensity of scanlines (0.0 - 1.0)
- **Scan Line Strength**: Contrast of scanlines (-12.0 to -1.0)

### Screen Curvature

- **Warp Amount**: Amount of screen curvature (0.0 - 5.0)

### Noise & Interference

- **Noise Amount**: Intensity of visual noise (0.0 - 0.3)
- **Interference Amount**: Strength of interference patterns (0.0 - 1.0)

### Shadow Mask

- **Grille Amount**: Intensity of the shadow mask effect (0.0 - 1.0)
- **Grille Size**: Size of the shadow mask pattern (1.0 - 5.0)

### Vignette

- **Vignette Amount**: Intensity of the vignette effect (0.0 - 2.0)
- **Vignette Intensity**: Darkness of the vignette (0.0 - 1.0)

### Chromatic Aberration

- **Aberration Amount**: Strength of color separation (0.0 - 1.0)

### Rolling Line

- **Roll Line Amount**: Intensity of rolling line effect (0.0 - 1.0)
- **Roll Speed**: Speed of the rolling line (-8.0 - 8.0)

### Pixel Effect

- **Pixel Strength**: Pixel sharpening/softening (-4.0 - 0.0)

## Example Code

```gdscript
# Using the CRT effect in your Godot script
@onready var crt_effect = $CanvasLayer/CRT

# Adjust effects dynamically
func _process(delta):
    # Example: Pulsing scanline effect
    var time = OS.get_ticks_msec() / 1000.0
    crt_effect.scan_line_amount = sin(time) * 0.5 + 0.5  # Pulsates between 0.0 and 1.0
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

- Based on the "Realistic CRT shader" by [c64cosmin](https://godotshaders.com/shader/realistic-crt-shader/)
- Developed for Godot Engine 4.x

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.
