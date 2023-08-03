# Eclipse's SoundModule

Eclipse's SoundModule is a custom module designed to simplify the process of preloading and controlling sounds in Roblox games. It provides functions to create sounds with various effects and allows you to easily manage the playback of these sounds.

## [Docs](https://github.com/EclipseUser-Dev/SoundModule/blob/main/Docs.md)
If you do not wish to follow the guide below or are searching for the documentation, click on the link above.

## Getting Started

To use the SoundModule in your Roblox place, follow these steps:

1. Grab a copy of the module in the [releases page](https://github.com/EclipseUser-Dev/SoundModule/releases) and put it in `ServerScriptService`.

2. In your script that needs to use sounds, require the SoundModule by adding the following line at the top:

```lua
local SoundModule = require(game.ServerScriptService.SoundModule) -- Adjust the path accordingly.
```

3. You can now create sounds using the `SoundModule.CreateSound` and `SoundModule.CreateSoundAtPosition` functions. For example:

```lua
local SoundId = 123456789 -- Replace with the asset ID of your sound.
local Properties = {
    Looped = true,
    Volume = 0.8,
    Parent = workspace -- Replace with the desired parent instance.
}

local sound = SoundModule.CreateSound(SoundId, Properties)
sound:Play()
```

## Functions

### `SoundModule.CreateSound(SoundId : number, Properties : table) -> SoundWrapper`

Creates and returns a new sound with the specified SoundId and properties.

#### Parameters

- `SoundId` (number): The asset ID of the sound to be preloaded and played.
- `Properties` (table): A table containing properties for the created sound.

#### Returns

- `SoundWrapper`: A wrapper containing functions to control the created sound.

### `SoundModule.CreateSoundAtPosition(SoundId : number, Properties : table) -> SoundWrapper`

Creates and returns a new sound attached to a position in Workspace.

#### Parameters

- `SoundId` (number): The asset ID of the sound to be preloaded and played.
- `Properties` (table): A table containing properties for the created sound.

#### Returns

- `SoundWrapper`: A wrapper containing functions to control the created sound.

## SoundWrapper Functions

The `SoundWrapper` returned by the `SoundModule.CreateSound` and `SoundModule.CreateSoundAtPosition` functions provides the following functions to control the sound:

- `Play()`: Plays the sound.
- `Stop()`: Stops the sound.
- `Pause()`: Pauses the sound.
- `Destroy()`: Destroys the sound.

## SoundWrapper Properties

The `SoundWrapper` also exposes the following read-only properties for additional functionality:

- `IsPlaying`: A boolean indicating if the sound is currently playing.
- `IsPaused`: A boolean indicating if the sound is currently paused.
- `Finished`: An event that fires when the sound has finished playing.
- `Paused`: An event that fires when the sound is paused.
- `Stopped`: An event that fires when the sound is stopped.
- `Played`: An event that fires when the sound starts playing.
- `Destroying`: An event that fires when the sound is being destroyed.

**Note**: Attempting to convert the created sound to a string will result in a warning, as sounds cannot be converted to strings.

## Contributions

Contributions to this SoundModule are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This SoundModule is open-source and distributed under the [MIT License](https://opensource.org/license/mit/).

## Acknowledgments

The SoundModule was developed by EclipseUser and inspired by the need for an easy-to-use sound management system in Roblox games.