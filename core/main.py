from mistral_inference.transformer import Transformer
from mistral_inference.generate import generate

from mistral_common.tokens.tokenizers.mistral import MistralTokenizer
from mistral_common.protocol.instruct.messages import UserMessage
from mistral_common.protocol.instruct.request import ChatCompletionRequest

from prompt import prompt

tokenizer = MistralTokenizer.from_file("./mistral-nemo-instruct-v0.1/tekken.json")  # change to extracted tokenizer file
model = Transformer.from_folder("./mistral-nemo-instruct-v0.1")  # change to extracted model dir

prompt = "How expensive would it be to ask a window cleaner to clean all windows in Paris. Make a reasonable guess in US Dollar."

def main():
  result = prompt(model, tokenizer, prompt)
  print(result)