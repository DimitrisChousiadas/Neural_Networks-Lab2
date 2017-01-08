%% SOM Train

function somTrain (patterns)

    P = size(patterns,2);

    %% ordering
    
    neighborDistSpace = 10.^linspace(log10(tuneND), log10(maxNeighborDist), orderSteps);
    learningRateSpace = 10.^linspace(log10(tuneLR), log10(orderLR), orderSteps);
    for epoch = 1:orderSteps
        neighborDist = neighborDistSpace(orderSteps - epoch + 1);
        learningRate = learningRateSpace(orderSteps - epoch + 1);
        for iter = 1:P
            pattern = pattern(:,iter);
            somUpdate(pattern, learningRate, neighborDist);
        end
    end
    
    %% tuning
    
    tuningSteps = 3*orderSteps;
    neighborDist = tuneND;
    learningRate = tuneLR;
    for epoch = 1:tuningSteps
        for iter = 1:P
            pattern = pattern(:,iter);
            somUpdate(pattern, learningRate, neighborDist);
        end
    end

end