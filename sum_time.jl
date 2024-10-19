using JSON3

fns = filter(endswith(".json"), readdir("data/";join=true))

js = @. JSON3.read(read(fns))
f(x) = x.formats[1].fragments[1].duration
durs = []

g, b = goodbad(x -> f(x[2]), zip(fns, js));
sum(last.(g))