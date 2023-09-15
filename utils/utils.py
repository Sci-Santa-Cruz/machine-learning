def toggle_cell_code(button_id):
    """
    Adds a button to toggle (show/hide) the code cell but not the output. 
    
    Parameters
    ----------
    button_id : str
        An identifier for cells that will hide/show when button is pressed.
    """
    
    from IPython.display import display_html
    my_html = '''
    <button type="button" id="%s" onclick="code_toggle('%s')">Codigo</button>
    <script>
    function code_toggle(my_id) {
        // get the parent element for the cell code and output
        var p = $("#"+my_id);
        if (p.length==0) return;
        while (!p.hasClass("cell")) {
            p = p.parent();
            if (p.prop("tagName") =="body") return;
        }
    // get the cell code and toggle its value
    var cell_code = p.find(".input");
    cell_code.toggle();
    }
    </script>
    ''' %(button_id, button_id)
    return display_html(my_html, raw=True)


def find_boundaries (df, variable, distance): 

    IQR = df [variable] .quantile (0.75) - df [variable] .quantile (0.25) 

    lower_boundary = df [variable] .quantile (0.25) - (IQR * distance) 
    upper_boundary = df [variable] .quantile (0.75) + (IQR * distancia) 

    return upper_boundary, lower_boundary

from IPython.display import HTML

def horizontal(dfs):
    html = '<div style="display:flex">'
    for df in dfs:
        html += '<div style="margin-right: 32px">'
        html += df.to_html()
        html += '</div>'
    html += '</div>'
    display(HTML(html))


lista_test = [1,2,3,5]

prueba = 3.4


texto = "hola que tal "