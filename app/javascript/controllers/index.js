// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddButtonController from "./add_button_controller"
application.register("add-button", AddButtonController)

import AnimationController from "./animation_controller"
application.register("animation", AnimationController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InfoModalController from "./info_modal_controller"
application.register("info-modal", InfoModalController)

import MovieModalController from "./movie_modal_controller"
application.register("movie-modal", MovieModalController)

import SearchMoviesController from "./search_movies_controller"
application.register("search-movies", SearchMoviesController)

import SubModalController from "./sub_modal_controller"
application.register("sub-modal", SubModalController)

import TypedJsController from "./typed_js_controller"
application.register("typed-js", TypedJsController)

import WaitingController from "./waiting_controller"
application.register("waiting", WaitingController)
