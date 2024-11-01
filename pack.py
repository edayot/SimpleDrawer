from beet import Context




def beet_default(ctx: Context):
    render_path = "simpledrawer:render/simpledrawer/block/new_drawer/oak_1"
    tex = ctx.assets.textures[render_path]
    ctx.data.extra["pack.png"] = tex
    ctx.assets.extra["pack.png"] = tex