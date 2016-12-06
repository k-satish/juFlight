
__precompile__()

module MyPlot

using PyPlot
export plot

function myplot(x, y)
    plot(x, y,linewidth=2)
    grid("on")
end

myplot(y) = myplot(collect(1:length(y)), y)

function myplot(x, y,x_label,y_label)
    myplot(x, y)
    xlabel(x_label)
    ylabel(y_label)
end

function myplot(x, y, x_label, y_label, figtitle)
    myplot(x, y,x_label,y_label)
    title(figtitle)
end

export myplot

end #module


# vim:filetype=julia:


