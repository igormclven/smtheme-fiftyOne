local params = ...
return Def.ActorFrame {
	-- Base; to be foofified
	Def.Quad {
		InitCommand=cmd(zoomto,50,50;rotationz,45;diffuse,params.base_color)
	},
	-- The wanted value
	LoadFont("Common Normal") .. {
		InitCommand=cmd(diffuse,ColorDarkTone(params.base_color)),
		OnCommand=function(self)
			self:settext( params.value_text )
			self:zoom(string.len(params.value_text) > 4 and 0.6 or 1.5)
		end
	},
	-- Label
	LoadFont("_roboto condensed Bold 48px") .. {
		InitCommand=cmd(x,50;zoom,0.35;diffuse,color("#512232");horizalign,left;uppercase,true),
		OnCommand= function(self)
			self:shadowlength(0):settext(params.label_text)
		end,
	}
}