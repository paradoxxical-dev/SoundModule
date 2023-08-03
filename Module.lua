local module = {}

function module.CreateSound(SoundId : number, Properties)
	if not SoundId then
		error("SoundId was not specified when preloading sound!")
	end
	
	-- Make sure Properties have Intellisense Autocomplete --
	Properties.RollOffMaxDistance = Properties.RollOffMaxDistance or 10000
	Properties.RollOffMinDistance = Properties.RollOffMinDistance or 10
	Properties.RollOffMode = Properties.RollOffMode or Enum.RollOffMode.InverseTapered
	Properties.DontDestroyOnFinished = Properties.DontDestroyOnFinished or false
	
	Properties.Looped = Properties.Looped or false
	Properties.PlaybackSpeed = Properties.PlaybackSpeed or 1
	Properties.StartPosition = Properties.StartPosition or 1
	Properties.Volume = Properties.Volume or 0.5
	
	Properties.ChorusEffectEnabled = Properties.ChorusEffectEnabled or false
	Properties.ChorusDepth = Properties.ChorusDepth or 0.15
	Properties.ChorusMix = Properties.ChorusMix or 0.5
	Properties.ChorusRate = Properties.ChorusRate or 0.5
	Properties.ChorusPriority = Properties.ChorusPriority or 0
	
	Properties.DistortionEffectEnabled = Properties.DistortionEffectEnabled or false
	Properties.DistortionLevel = Properties.DistortionLevel or 0.75
	Properties.DistortionPriority = Properties.DistortionPriority or 0	
	
	Properties.EchoEffectEnabled = Properties.EchoEffectEnabled or false
	Properties.EchoDelay = Properties.EchoDelay or 1
	Properties.EchoDryLevel = Properties.EchoDryLevel or 0
	Properties.EchoFeedback = Properties.EchoFeedback or 0.5
	Properties.EchoWetLevel = Properties.EchoWetLevel or 0
	Properties.EchoPriority = Properties.EchoPriority or 0
	
	Properties.EqualizerEffectEnabled = Properties.EqualizerEffectEnabled or false
	Properties.EqualizerHighGain = Properties.EqualizerHighGain or 0
	Properties.EqualizerLowGain = Properties.EqualizerLowGain or -20
	Properties.EqualizerMidGain = Properties.EqualizerMidGain or -10
	Properties.EqualizerPriority = Properties.EqualizerPriority or 0
	
	Properties.PitchShiftEffectEnabled = Properties.PitchShiftEffectEnabled or false
	Properties.PitchOctave = Properties.PitchOctave or 1.25
	Properties.PitchPriority = Properties.PitchPriority or 0
	
	Properties.ReverbEffectEnabled = Properties.ReverbEffectEnabled or false
	Properties.ReverbDecayTime = Properties.ReverbDecayTime or 1.5
	Properties.ReverbDensity = Properties.ReverbDensity or 1
	Properties.ReverbDiffusion = Properties.ReverbDiffusion or 1
	Properties.ReverbDryLevel = Properties.ReverbDryLevel or -6
	Properties.ReverbWetLevel = Properties.ReverbWetLevel or 0
	Properties.ReverbPriority = Properties.ReverbPriority or 0
	
	Properties.Parent = Properties.Parent
	
	if not Properties.Parent then
		-- Throw error if the parent property is nil --
		error("The 'Parent' property of the played sound was not set.")
	elseif typeof(Properties.Parent) ~= "Instance" then
		-- Throw error if the parent property is not an instance. --
		error("The 'Parent' property is not an instance.")
	end
	
	local sound = Instance.new("Sound")
	sound.Name = "Sound"
	sound.RollOffMode = Properties.RollOffMode
	sound.SoundId = "rbxassetid://"..SoundId
	sound.Looped = Properties.Looped
	sound.PlaybackSpeed = Properties.PlaybackSpeed
	sound.TimePosition = Properties.StartPosition
	sound.Volume = Properties.Volume

	if Properties.ChorusEffectEnabled then
		local chorusSoundEffect = Instance.new("ChorusSoundEffect")
		chorusSoundEffect.Name = "ChorusSoundEffect"
		chorusSoundEffect.Depth = Properties.ChorusDepth
		chorusSoundEffect.Mix = Properties.ChorusMix
		chorusSoundEffect.Rate = Properties.ChorusRate
		chorusSoundEffect.Parent = sound
	end

	if Properties.DistortionEffectEnabled then
		local distortionSoundEffect = Instance.new("DistortionSoundEffect")
		distortionSoundEffect.Name = "DistortionSoundEffect"
		distortionSoundEffect.Level = Properties.DistortionLevel
		distortionSoundEffect.Priority = Properties.DistortionLevel
		distortionSoundEffect.Parent = sound
	end

	if Properties.PitchShiftEffectEnabled then
		local pitchShiftSoundEffect = Instance.new("PitchShiftSoundEffect")
		pitchShiftSoundEffect.Name = "PitchShiftSoundEffect"
		pitchShiftSoundEffect.Octave = Properties.PitchOctave
		pitchShiftSoundEffect.Priority = Properties.PitchPriority
		pitchShiftSoundEffect.Parent = sound
	end

	if Properties.ReverbEffectEnabled then
		local reverbSoundEffect = Instance.new("ReverbSoundEffect")
		reverbSoundEffect.Name = "ReverbSoundEffect"
		reverbSoundEffect.DecayTime = Properties.ReverbDecayTime
		reverbSoundEffect.Density = Properties.ReverbDensity
		reverbSoundEffect.Diffusion = Properties.ReverbDiffusion
		reverbSoundEffect.DryLevel = Properties.ReverbDryLevel
		reverbSoundEffect.WetLevel = Properties.ReverbWetLevel
		reverbSoundEffect.Priority = Properties.ReverbPriority
		reverbSoundEffect.Parent = sound
	end

	if Properties.EchoEffectEnabled then
		local echoSoundEffect = Instance.new("EchoSoundEffect")
		echoSoundEffect.Name = "EchoSoundEffect"
		echoSoundEffect.Delay = Properties.EchoDelay
		echoSoundEffect.Feedback = Properties.EchoFeedback
		echoSoundEffect.DryLevel = Properties.EchoDryLevel
		echoSoundEffect.WetLevel = Properties.EchoWetLevel
		echoSoundEffect.Parent = sound
	end

	if Properties.EqualizerEffectEnabled then
		local equalizerSoundEffect = Instance.new("EqualizerSoundEffect")
		equalizerSoundEffect.Name = "EqualizerSoundEffect"
		equalizerSoundEffect.HighGain = Properties.EqualizerHighGain
		equalizerSoundEffect.LowGain = Properties.EqualizerLowGain
		equalizerSoundEffect.MidGain = Properties.EqualizerMidGain
		equalizerSoundEffect.Priority = Properties.EqualizerPriority
		equalizerSoundEffect.Parent = sound
	end
	
	sound.Parent = Properties.Parent
	
	if not Properties.DontDestroyOnFinished then
		local function destroyOnFinished()
			sound:Destroy()
		end
		sound.Ended:Connect(destroyOnFinished)
		sound.Stopped:Connect(destroyOnFinished)
	end
	
	local wrapper = {}
	
	function wrapper:Play()
		sound:Play()
	end
	function wrapper:Stop()
		sound:Stop()
	end
	function wrapper:Pause()
		sound:Pause()
	end
	function wrapper:Destroy()
		sound:Destroy()
	end
	
	-- Intellisense Autocomplete for the wrapper since metatables dont add Autocomplete >:( --
	wrapper.IsPlaying = wrapper.IsPlaying
	wrapper.IsPaused = wrapper.IsPaused
	wrapper.Finished = wrapper.Finished
	wrapper.Paused = wrapper.Paused
	wrapper.Stopped = wrapper.Stopped
	wrapper.Played = wrapper.Played
	wrapper.Destroying = wrapper.Destroying
	
	local metatable = {
		__index = function(t, index)
			if index == "IsPlaying" then
				return sound.IsPlaying
			elseif index == "IsPaused" then
				return sound.IsPaused
			elseif index == "Finished" then
				return sound.Ended
			elseif index == "Paused" then
				return sound.Paused
			elseif index == "Stopped" then
				return sound.Stopped
			elseif index == "Played" then
				return sound.Played
			elseif index == "Destroying" then
				return sound.Destroying
			end
		end,
		__tostring = function(t)
			warn("Sorry, Created sounds cannot be converted to strings!")
			return
		end,
	}
	
	return setmetatable(wrapper, metatable)
end

function module.CreateSoundAtPosition(SoundId : number, Properties)
	if not SoundId then
		error("SoundId was not specified when preloading sound!")
	end

	-- Make sure Properties have Intellisense Autocomplete, AGAIN --
	Properties.RollOffMaxDistance = Properties.RollOffMaxDistance or 10000
	Properties.RollOffMinDistance = Properties.RollOffMinDistance or 10
	Properties.RollOffMode = Properties.RollOffMode or Enum.RollOffMode.InverseTapered
	Properties.DontDestroyOnFinished = Properties.DontDestroyOnFinished or false

	Properties.Looped = Properties.Looped or false
	Properties.PlaybackSpeed = Properties.PlaybackSpeed or 1
	Properties.StartPosition = Properties.StartPosition or 1
	Properties.Volume = Properties.Volume or 0.5

	Properties.ChorusEffectEnabled = Properties.ChorusEffectEnabled or false
	Properties.ChorusDepth = Properties.ChorusDepth or 0.15
	Properties.ChorusMix = Properties.ChorusMix or 0.5
	Properties.ChorusRate = Properties.ChorusRate or 0.5
	Properties.ChorusPriority = Properties.ChorusPriority or 0

	Properties.DistortionEffectEnabled = Properties.DistortionEffectEnabled or false
	Properties.DistortionLevel = Properties.DistortionLevel or 0.75
	Properties.DistortionPriority = Properties.DistortionPriority or 0	

	Properties.EchoEffectEnabled = Properties.EchoEffectEnabled or false
	Properties.EchoDelay = Properties.EchoDelay or 1
	Properties.EchoDryLevel = Properties.EchoDryLevel or 0
	Properties.EchoFeedback = Properties.EchoFeedback or 0.5
	Properties.EchoWetLevel = Properties.EchoWetLevel or 0
	Properties.EchoPriority = Properties.EchoPriority or 0

	Properties.EqualizerEffectEnabled = Properties.EqualizerEffectEnabled or false
	Properties.EqualizerHighGain = Properties.EqualizerHighGain or 0
	Properties.EqualizerLowGain = Properties.EqualizerLowGain or -20
	Properties.EqualizerMidGain = Properties.EqualizerMidGain or -10
	Properties.EqualizerPriority = Properties.EqualizerPriority or 0

	Properties.PitchShiftEffectEnabled = Properties.PitchShiftEffectEnabled or false
	Properties.PitchOctave = Properties.PitchOctave or 1.25
	Properties.PitchPriority = Properties.PitchPriority or 0

	Properties.ReverbEffectEnabled = Properties.ReverbEffectEnabled or false
	Properties.ReverbDecayTime = Properties.ReverbDecayTime or 1.5
	Properties.ReverbDensity = Properties.ReverbDensity or 1
	Properties.ReverbDiffusion = Properties.ReverbDiffusion or 1
	Properties.ReverbDryLevel = Properties.ReverbDryLevel or -6
	Properties.ReverbWetLevel = Properties.ReverbWetLevel or 0
	Properties.ReverbPriority = Properties.ReverbPriority or 0
	
	Properties.Position = Properties.Position
	
	if not Properties.Position then
		-- Throw error if the position property is nil --
		error("The 'Position' property of the played sound was not set.")
	elseif typeof(Properties.Position) ~= "Vector3" then
		-- Throw error if the position property is not an instance. --
		error("The 'Position' property is not a Vector3.")
	end
	
	local SoundPart = Instance.new("Part")
	SoundPart.Name = "SoundPart"
	SoundPart.CanCollide = false
	SoundPart.CanQuery = false
	SoundPart.CanTouch = false
	SoundPart.Transparency = 0
	SoundPart.Anchored = true
	SoundPart.Size = Vector3.new(0.001, 0.001, 0.001)
	SoundPart.Position = Properties.Position
	SoundPart.Parent = game:GetService("Workspace")
	
	Properties.Position = nil
	Properties.Parent = SoundPart
	
	local CreatedSound = module.CreateSound(SoundId, Properties)
	CreatedSound.Destroying:Connect(function()
		SoundPart:Destroy()
	end)
	return CreatedSound
end

return module
