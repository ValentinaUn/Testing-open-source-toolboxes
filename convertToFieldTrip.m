function [ spikeData, newNumbers ] = ...
          convertToFieldTrip( Data, area, unitsSelection, nTrials, timeSegment )

nUnits = length( unitsSelection );
for iUnit = 1:nUnits
  spikeData.label{ iUnit} = [ 'Unit' num2str( unitsSelection( iUnit ) ) ];
  % spike times are expressed as seconds relative to the trigger
  spikeData.time{ iUnit }      = [];
  spikeData.timestamp{ iUnit } = [];
  spikeData.trial{ iUnit }     = [];
  % counter of trials which have > timeSegement( 2 ) length
  trialCnt = 1;
  for iTrial = 1:nTrials
    % to make it in seconds
    % take trial if it is long enough
    if ( size( Data.neural_data_PMd{ iTrial }( unitsSelection( iUnit ), : ), 2 ) > 1000 )
      if ( strcmp( area, 'M1' ) )
        indices = find( Data.neural_data_M1{ iTrial }( unitsSelection( iUnit ), 1:1000 ) > 0 )/1000;
      elseif ( strcmp( area, 'PMd' ) )
        indices = find( Data.neural_data_PMd{ iTrial }( unitsSelection( iUnit ), 1:1000 ) > 0 )/1000;
      end
      spikeData.time{ iUnit } = horzcat( spikeData.time{ iUnit }, indices );
      spikeData.timestamp{ iUnit } = horzcat( spikeData.timestamp{ iUnit }, indices );
      % for every spike register in which trials it was recorded
      spikeData.trial{ iUnit } = horzcat( spikeData.trial{ iUnit }, ...
                                      ones( 1, numel( indices ) )*trialCnt );
      newNumbers( trialCnt ) = rem( iTrial, 4 ); 
      if ( newNumbers( trialCnt ) == 0 )
        newNumbers( trialCnt ) = 4;
      end
      trialCnt = trialCnt + 1;
    end
  end
end

for iTrial = 1:trialCnt-1
    spikeData.trialtime( iTrial, : ) = timeSegment;
end