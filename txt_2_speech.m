NET.addAssembly('System.Speech');
synthesizer.SelectVoiceByHints(2 , 15);
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Voice.Gender(2)
obj.Volume = 100;
obj.Rate=10
Speak(obj, 'you are in stage 1 and chance 32.454%');
%%

%%SpeechSynthesizer synthesizer = new SpeechSynthesizer();
                    synthesizer.SelectVoiceByHints(VoiceGender.Male , VoiceAge.Adult);
                    synthesizer.Volume = 100;  
                    synthesizer.Rate = 0;    
                    
                    synthesizer.Speak("Now I'm speaking, no other function'll work");
                    
                    synthesizer.SpeakAsync("Welcome" + args); 