def prompt(model, tokenizer, prompt):
  completion_request = ChatCompletionRequest(messages=[UserMessage(content=prompt)])

  tokens = tokenizer.encode_chat_completion(completion_request).tokens

  out_tokens, _ = generate([tokens], model, max_tokens=1024, temperature=0.35, eos_id=tokenizer.instruct_tokenizer.tokenizer.eos_id)
  result = tokenizer.instruct_tokenizer.tokenizer.decode(out_tokens[0])

  return result