
defmodule RenderingDemo do
  @behaviour Ratatouille.App

  alias Ratatouille.Runtime.Subscription

  import Ratatouille.Constants, only: [key: 1]
  import Ratatouille.View

  @spacebar key(:space)

  def init(_context) do
    %{
      current_time: DateTime.utc_now(),
      series_1: [],
      series_2: [],
      overlay: true
    }
  end

  def update(model, message) do
    case message do
      {:event, %{key: @spacebar}} ->
        %{model | overlay: !model.overlay}

      :tick ->
        %{
          model
          | current_time: DateTime.utc_now(),
            series_1: for(_ <- 0..50, do: :rand.uniform() * 1000),
            series_2: Enum.shuffle([0, 1, 2, 3, 4, 5, 6])
        }

      _ ->
        model
    end
  end

  def subscribe(_model) do
    Subscription.interval(500, :tick)
  end

  def render(model) do
    top_bar =
      bar do
        label(content: "Pomme - the pomodoro timer of the present")
      end


    view(top_bar: top_bar) do
      panel title: "Rendering Demo", height: :fill do
        row do
          column(size: 12) do
            panel title: "Timer" do
              label(content: "Pomodoro Timer")
            end
          end
        end

        row do
          column(size: 3) do
            panel title: "TODO list 1"
          end
          column(size: 3) do
            panel title: "TODO list 2"
          end
          column(size: 3) do
            panel title: "TODO list 3"
          end
          column(size: 3) do
            panel title: "Score"
          end
        end

      end
    end
  end
end

