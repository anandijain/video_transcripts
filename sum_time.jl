using JSON3, CondaPkg, PythonCall, Plots
tt = pyimport("tiktoken")
enc = tt.get_encoding("o200k_base")

function parse_segment(s)
    if !haskey(s, "tOffsetMs")
        offset = 0
    else
        offset = s.tOffsetMs
    end
    utf8 = s.utf8
    (offset, utf8)
end

function parse_event(e)
    !haskey(e, "segs") && return []
    t0 = e.tStartMs
    pss = parse_segment.(e.segs)
    map(x -> (x[1] + t0, x[2]), pss)
end

f(x) = x.formats[1].fragments[1].duration
get_timestamped_words(j) = reduce(vcat, parse_event.(j.events))
get_txt_transcipt(timestamped_words::Vector) = join(last.(timestamped_words))
get_txt_transcipt(j) = get_txt_transcipt(get_timestamped_words(j))

function token_tally(enc, txt)
    e = enc.encode(txt)
    v = pyconvert(Vector{Integer}, e)
    t = tally(v)
    map(x -> string(enc.decode([x[1]])) => x[2], t)
end

fn_to_vid_id(s) = last(match(r"\[([^\]]+)\]", s).captures)

fns = filter(endswith(".json"), readdir("data/"; join=true))

js = @. JSON3.read(read(fns));
durs = []

g, b = goodbad(x -> f(x[2]), zip(fns, js));
sum(last.(g))

fn = "tmp/i spent 8 HOURS in onshape [K2OsuCs2YrE].en.json"

fns2 = filter(endswith(".json3"), readdir("data/json_transcripts/"; join=true))

# write("eight_hours.txt", join(last.(data)))
js2 = @. JSON3.read(read(fns2));
txts = fns2 .=> get_txt_transcipt.(js2);

data = token_tally.(enc, last.(txts));
ds = Dict.(data)
m = mergewith(+, ds...)
bigp = collect(m)
sortl!(bigp)
plot(last.(bigp))


map(println, first(bigp, 200));

tvids = fn_to_vid_id.(fns2)
tvid = tvids[1]
vid_to_mfn(fns, vid) = fns[only(findall(x -> occursin(vid, x), fns))]
vid = tvid
fns[only(findall(x -> occursin(vid, x), fns))]

for vid in tvids 
    try 
        vid_to_mfn(fns, vid)

    catch e 
        @show vid
    end
end
