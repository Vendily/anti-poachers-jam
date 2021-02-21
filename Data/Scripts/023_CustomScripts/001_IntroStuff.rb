def pbIntroPlayerChoice
  vport=Viewport.new(0,0,Graphics.width,Graphics.height)
  vport.z = 99999
  sprite0=IconSprite.new(64,112,vport)
  sprite0.setBitmap(pbPlayerSpriteFile(0))
  sprite0.tone.set(0,0,0,255)
  sprite0.opacity=0
  sprite1=IconSprite.new(288,112,vport)
  sprite1.setBitmap(pbPlayerSpriteFile(1))
  sprite1.tone.set(0,0,0,255)
  sprite1.opacity=0
  Graphics.frame_rate.times do |f|
    Graphics.update
    Input.update
    sprite0.update
    sprite1.update
    sprite0.opacity=(255/Graphics.frame_rate)*f
    sprite1.opacity=(255/Graphics.frame_rate)*f
  end
  sprite0.opacity=255
  sprite1.opacity=255
  ids=["10471","43554"]
  cmd=0
  loop do
    cmd=pbMessage(_INTL("What's your ID Number so I can update the status?"),ids,0,nil,cmd){|i|
      if i==1
        sprite0.tone.set(0,0,0,255)
        sprite1.tone.set(0,0,0,0)
      else
        sprite0.tone.set(0,0,0,0)
        sprite1.tone.set(0,0,0,255)

      end
      sprite0.update
      sprite1.update
    }
   break if pbConfirmMessage(_INTL("Is {1} correct?",ids[cmd]))
  end
  Graphics.frame_rate.times do |f|
    Graphics.update
    Input.update
    sprite0.update
    sprite1.update
    sprite0.opacity=(255/Graphics.frame_rate)*(Graphics.frame_rate-f)
    sprite1.opacity=(255/Graphics.frame_rate)*(Graphics.frame_rate-f)
  end
  sprite0.opacity=0
  sprite1.opacity=0
  sprite0.update
  sprite1.update
  Graphics.update
  Input.update
  sprite0.dispose
  sprite1.dispose
end