module Msgs exposing (..)

import Http


import Model exposing (..)


-- Msg
type Msg = GetResource Resource
         | GotResource (Result Http.Error String)
         | SetId String
         | SetResource String

