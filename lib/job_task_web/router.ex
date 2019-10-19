defmodule JobTaskWeb.Router do
  use JobTaskWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "text"]
  end

  scope "/", JobTaskWeb do
    pipe_through :api

    post "/process", TaskController, :process_job
  end

  # Other scopes may use custom stacks.
  # scope "/api", JobTaskWeb do
  #   pipe_through :api
  # end
end
