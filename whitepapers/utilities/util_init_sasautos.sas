/***

This utility macro ensures that OPTIONS SASAUTOS=() statements add a new autocall path
only one time, even if called multiple times during an interactive session.

Usage:  %util_init_sasautos;
        options sasautos=(&init_sasautos "user-specified-path");

INPUTS
  -NONE-

OUTPUT
  INIT_SASAUTOS  Global symbol that stores the initial sasautos system setting.
                 A subsequent OPTIONS SASAUTOS=(&INIT_SASAUTOS "user-specified-path")
                 will only add that new path one time to the autocalls search paths,
                 even if run multiple times in an interactive SAS session.

***/

%macro util_init_sasautos;
  %if not %symexist(init_sasautos) %then %do;
    %global init_sasautos;
    %let init_sasautos = %sysfunc(getoption(sasautos));
  %end;

%mend util_init_sasautos;
