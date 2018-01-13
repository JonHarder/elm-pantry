module Msgs exposing (Msg, Msg(..))

import Http

import Element.Input as Input


import Model exposing (..)


-- Msg
type Msg = GetResource Resource
         | GotResource (Result Http.Error String)
         | SetId String
         | SetResource (Input.SelectMsg Resource)

