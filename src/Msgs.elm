module Msgs exposing (..)

import Http


import Model exposing (..)


-- Msg
type Msg = GetResource Resource Int
         | GotResource (Result Http.Error String)

