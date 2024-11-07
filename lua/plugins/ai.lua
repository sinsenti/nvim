return {
  {
 "David-Kunz/gen.nvim",
  config=function()
    require('gen').prompts['DevOps me!'] = {
      prompt = "You are a senior devops engineer, acting as an assistant. You offer help with cloud technologies like: Terraform, AWS, kubernetes, c++, python. You answer with code examples when possible. $input:\n$text",
      replace = true
    }
  end,
  },
}

