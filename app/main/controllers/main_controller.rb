# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    def index
      # Add code for when the index view is loaded
      page._new_calculation = ""
      %x{
        $( document ).ready(function() {
          $("button").mousedown(function(evt) { 
            evt.preventDefault(); 
          });
        });
      }
      
    end

    def run_calculation
      return if page._new_calculation == ""
     
      %x{
        try {
          var my_result = eval(#{ page._new_calculation }); // might generate an exception
        }
        catch (e) {
          // statements to handle any exceptions
          console.log(e); // output exception object to console
        }
        if (typeof my_result === 'undefined') {
          #{ print_error }
        } else {
          #{ save_calculation(`my_result`) }
        }
      }
    end

    def print_error
      flash._errors << 'We were unable to evaluate your equation!'
    end

    def save_calculation(result)
      store._calculations << {
        equation: page._new_calculation,
        result: result
      }

      page._new_calculation = ""
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end
  end
end
