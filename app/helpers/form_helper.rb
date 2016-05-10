module FormHelper

  def parse_question_type(question)
    @label = question["title"]
    @comment = question["comment"]
    @required = question["required"] == "yes" ? true : false
    question_type = question["form"].keys.first
    if question_type == "textarea"
      @input = "text"
      @name = question["form"]["textarea"]["id"]
    elsif question_type == "input"
      @input = question["form"]["input"]["type"]
      @input = @input == "text" ? "string" : @input
      @name = question["form"]["input"]["id"]
    elsif question_type == "__content__"
      @name = [ 'field', question["id"] ].join("_")
      @answers = question["answers"]["answer"].map{|answer| answer.values}
      @input = "check_boxes" if question["type"] == "checkboxes"
    end
    @for = ["application", @name].join("_")
    @required_class = @required == true ? 'required' : "optional"
    puts @input
  end

end
