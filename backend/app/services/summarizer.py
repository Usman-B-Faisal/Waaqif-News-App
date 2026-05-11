from langchain.chat_models import ChatOpenAI  # Replace with your actual LLaMA wrapper
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain

# You'd replace ChatOpenAI with your LLaMA setup
llm = ChatOpenAI(model_name="gpt-3.5-turbo", temperature=0)

template = PromptTemplate(
    input_variables=["text"],
    template="Summarize the following article:\n\n{text}"
)
chain = LLMChain(llm=llm, prompt=template)

async def summarize_text(text: str) -> str:
    return chain.run(text)