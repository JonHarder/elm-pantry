module Msgs exposing (..)

import Http


-- Msg
type Msg = GetResource String
         | GotResource (Result Http.Error String)

