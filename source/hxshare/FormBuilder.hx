package hxshare;

import js.jquery.JQuery in JQ;
import js.html.Element;
import js.html.InputElement;
import js.html.SelectElement;
import js.html.TextAreaElement;
import js.Browser;

import haxe.Json;

class FormBuilder<T>
{

    var id:Int = -1;
    var data:Dynamic;
    var dataFilled:Bool;

    /**
    * A callback function taking a data object respective of the given type
    * and returns a boolean value determining if object values are correct.
    **/
    public var onValidate:T -> Bool;
    /**
    * A callback function that is called when data is submitted to the server.
    **/
    public var onSubmit:Void -> Void;
    /**
    * A callback function that is called when a delete request is successful.
    **/
    public var onDeleted:Void -> Void;

    public function new(data:T = null, id:Int = -1)
    {
        if (data != null)
        {
            this.data = data;
            this.id = id;
            dataFilled = true;
        }
        else
        {
            this.data = {};
        }
    }

    /**
    * Begins a dynamic form using AJAX requests to submit data to the server.
    *
    * @param submitSelector An ID value identifying the button used for submitting data.
    * @param deleteSelector An ID value identifying the button used for deleting data from the server.
    * @param structure The name of the root REST URL (defined in Builder.addRestRoute) for the object you wish to update.
    * @param editing (Optional) Sets a value determining if the form is either editing data or not.
    * @param id (Optional) If editing, the provided ID is the item to retrieve from the database to begin editing with.
    **/
    public function beginDynamic(submitSelector:String, structure:String, ?deleteSelector:String = "", editing:Bool = false, id:Int = -1)
    {
        if (editing && id > -1 && !dataFilled)
        {
            this.id = id;

            Request.get(structure + "/" + id, function(content, success)
            {
                if (success)
                {
                    data = Json.parse(content);
                    dataFilled = true;
                }
                else
                {
                    throw content;
                }
            });
        }
        else if (editing && !dataFilled)
        {
            throw "You must give an ID value if you are editing an item.";
        }

        new JQ(submitSelector).click(function(e)
        {
            var validated = false;
            if (onValidate != null)
                validated = onValidate(data);
            else
                validated = true;
            
            if (validated)
            {
                if (editing) 
                {
                    Request.post(structure + "/" + this.id, data, function(content, success) {
                        if (success)
                        {
                            if (onSubmit != null)
                                onSubmit();
                        }
                    });
                }
                else
                {
                    Request.put(structure, data, function(content, success)
                    {
                        if (success)
                        {
                            data = Json.parse(content);
                            if (Reflect.hasField(data, "id"))
                                this.id = Reflect.field(data, "id");

                            if (onSubmit != null)
                                onSubmit();
                        }
                    });
                }
            }
        });

        if (deleteSelector != "")
        {
            new JQ(deleteSelector).click(function(e)
            {
                if (this.id > -1)
                {
                    Request.delete(structure + "/" + this.id, function(content, success)
                    {
                        if (success)
                        {
                            if (onDeleted != null)
                                onDeleted();
                        }
                    });
                }
            });
        }
    }

    /**
    * Syncs the field name of the data object with the given element.
    * Whenever the value of the respective element changes, so does the field.
    *
    * @param field The name of the field you want to sync with. The `id` value
    * and field name must be the same to work.
    **/
    public function fieldSync(field:String)
    {
        var el = Browser.document.getElementById(field);
        if (Std.is(el, InputElement))
        {
            var casted = cast (el, InputElement);
            switch (casted.type)
            {
                case "date", "time", "datetime-local":
                    if (dataFilled)
                        casted.value = (cast (Reflect.field(data, field), Date)).toString();
                    
                    new JQ("#" + field).bind("input", function()
                    {
                        Reflect.setField(data, field, casted.value);
                    });

                case "text", "email", "password", 
                    "file", "month", "number", "range", 
                    "search", "tel", "url", "week":
                    if (dataFilled)
                        casted.value = cast Reflect.field(data, field);

                    new JQ("#" + field).bind("input", function()
                    {
                        Reflect.setField(data, field, casted.value);
                    });
                case "checkbox":
                    if (dataFilled)
                        casted.checked = cast Reflect.field(data, field);

                    new JQ("#" + field).bind("input", function()
                    {
                        Reflect.setField(data, field, casted.checked);
                    });
            }
        }
        else if (Std.is(el, SelectElement))
        {
            var casted = cast (el, SelectElement);
            if (dataFilled)
                casted.selectedIndex = cast Reflect.field(data, field);

            new JQ("#" + field).on("change", function()
            {
                Reflect.setField(data, field, casted.selectedIndex);
            });
        }
        else if (Std.is(el, TextAreaElement))
        {
            var casted = cast (el, TextAreaElement);
            if (dataFilled)
                casted.value = cast Reflect.field(data, field);

            new JQ("#" + field).bind("input", function()
            {
                Reflect.setField(data, field, casted.value);
            });
        }
    }

    /**
    * Retrieves the local copy of the data instance.
    **/
    public function getData()
    {
        return data;
    }

}