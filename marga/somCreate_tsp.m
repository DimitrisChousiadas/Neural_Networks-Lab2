function somCreate_tsp(minMax,gridSize)

global neuronsPerRow neuronsPerColumn N IW distances dimensions positions;

neuronsPerRow = gridSize(1,1);
neuronsPerColumn = gridSize(1,2);
N = neuronsPerRow*neuronsPerColumn;
minFeatureValues = minMax(:,1)'; 
maxFeatureValues = minMax(:,2)';
dimensions = size(minMax,1); 
IW = zeros(N,dimensions);
%Initial Weights
for i = 1:N,
    IW(i,:) = rand(1,dimensions).*(maxFeatureValues-minFeatureValues)+minFeatureValues;
end

%positions = hexagonalTopology(neuronsPerRow,neuronsPerColumn);
%plotsom(positions)
positions = gridtop(neuronsPerRow,neuronsPerColumn);
%distances = dist(positions);
%%%%%%%%%%%%
distances = ring_distances(N);
end