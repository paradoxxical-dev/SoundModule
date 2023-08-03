# Eclipse's SoundModule Documentation

This module provides functions to create and control sounds with various effects. It allows you to easily preload and play sounds in your Roblox games.

## `SoundModule.CreateSound(SoundId : number, Properties : table) -> SoundWrapper`

Creates and returns a new sound with the specified SoundId and properties.

### Parameters

- `SoundId` (number): The asset ID of the sound to be preloaded and played.
- `Properties` (table): A table containing properties for the created sound.

### Properties

The `Properties` table can have the following optional key-value pairs:

- `RollOffMaxDistance` (number): The maximum distance at which the sound is fully audible. Default is 10000.
- `RollOffMinDistance` (number): The minimum distance at which the sound starts to attenuate. Default is 10.
- `RollOffMode` (Enum.RollOffMode): The roll-off mode used for the sound. Default is Enum.RollOffMode.InverseTapered.
- `DontDestroyOnFinished` (boolean): If true, the sound will not be automatically destroyed when it finishes playing. Default is false.
- `Looped` (boolean): If true, the sound will loop. Default is false.
- `PlaybackSpeed` (number): The speed at which the sound will be played. Default is 1 (normal speed).
- `StartPosition` (number): The position (in seconds) to start playing the sound from. Default is 1.
- `Volume` (number): The volume level of the sound. Default is 0.5 (50%).
- `ChorusEffectEnabled` (boolean): If true, enables the ChorusSoundEffect for the sound. Default is false.
- `ChorusDepth` (number): The depth of the chorus effect. Default is 0.15.
- `ChorusMix` (number): The mix level of the chorus effect. Default is 0.5.
- `ChorusRate` (number): The rate of the chorus effect. Default is 0.5.
- `ChorusPriority` (number): The priority of the chorus effect. Default is 0.
- `DistortionEffectEnabled` (boolean): If true, enables the DistortionSoundEffect for the sound. Default is false.
- `DistortionLevel` (number): The level of distortion applied to the sound. Default is 0.75.
- `DistortionPriority` (number): The priority of the distortion effect. Default is 0.
- `EchoEffectEnabled` (boolean): If true, enables the EchoSoundEffect for the sound. Default is false.
- `EchoDelay` (number): The delay time of the echo effect. Default is 1.
- `EchoDryLevel` (number): The dry level of the echo effect. Default is 0.
- `EchoFeedback` (number): The feedback level of the echo effect. Default is 0.5.
- `EchoWetLevel` (number): The wet level of the echo effect. Default is 0.
- `EchoPriority` (number): The priority of the echo effect. Default is 0.
- `EqualizerEffectEnabled` (boolean): If true, enables the EqualizerSoundEffect for the sound. Default is false.
- `EqualizerHighGain` (number): The gain level for high frequencies in the equalizer effect. Default is 0.
- `EqualizerLowGain` (number): The gain level for low frequencies in the equalizer effect. Default is -20.
- `EqualizerMidGain` (number): The gain level for mid frequencies in the equalizer effect. Default is -10.
- `EqualizerPriority` (number): The priority of the equalizer effect. Default is 0.
- `PitchShiftEffectEnabled` (boolean): If true, enables the PitchShiftSoundEffect for the sound. Default is false.
- `PitchOctave` (number): The pitch shift value (in octaves) for the sound. Default is 1.25.
- `PitchPriority` (number): The priority of the pitch shift effect. Default is 0.
- `ReverbEffectEnabled` (boolean): If true, enables the ReverbSoundEffect for the sound. Default is false.
- `ReverbDecayTime` (number): The decay time of the reverb effect. Default is 1.5.
- `ReverbDensity` (number): The density of the reverb effect. Default is 1.
- `ReverbDiffusion` (number): The diffusion of the reverb effect. Default is 1.
- `ReverbDryLevel` (number): The dry level of the reverb effect. Default is -6.
- `ReverbWetLevel` (number): The wet level of the reverb effect. Default is 0.
- `ReverbPriority` (number): The priority of the reverb effect. Default is 0.
- `Parent` (Instance): The parent instance to which the sound will be added. This is the only **required** property

### Returns

- `WrappedSound`: A wrapper containing functions to control the created sound.

## `SoundModule.CreateSoundAtPosition(SoundId : number, Properties : table) -> SoundWrapper`

Creates and returns a new sound attached to a position in the game world.

### Parameters

- `SoundId` (number): The asset ID of the sound to be preloaded and played.
- `Properties` (table): A table containing properties for the created sound.

### Properties

The `Properties` table is the same as described in the `SoundModule.CreateSound` function.

- `Position` (Vector3): The position in the game world where the sound will be played.

### Returns

- `WrappedSound`: A wrapper containing functions to control the created sound.

## WrappedSound Functions

The `WrappedSound` returned by the `SoundModule.CreateSound` and `SoundModule.CreateSoundAtPosition` functions provides the following functions to control the sound:

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