# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    def index
      # Add code for when the index view is loaded
      page._new_calculation = ""
    end

    def about
      # Add code for when the about view is loaded
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
          #{ save_calculation }
        }
      }
    end

    def print_error
      flash._errors << 'We were unable to evaluate your equation!'
    end

    def save_calculation
      `alert('save_calculation')`
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
