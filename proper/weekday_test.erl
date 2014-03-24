
weekday() ->
    oneof(["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday",
           "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
          ]).
prop_weekday_test() ->
    ?FORALL(Day, weekday(),
            begin
                test(Day)
            end).
                
