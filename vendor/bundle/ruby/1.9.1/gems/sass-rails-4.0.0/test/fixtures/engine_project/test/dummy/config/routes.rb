# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

  mount EngineProject::Engine => "/engine_project"
end
