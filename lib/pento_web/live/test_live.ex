defmodule PentoWeb.TestLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Test</h1>
    """
  end
end

