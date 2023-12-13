import re
import random
from ..models import PalabrasClave, Respuestas

class Bot:
    def get_response(self, user_input):
        split_message = re.split(r'\s|[,:;.?!-_]\s*', user_input.lower())
        print(split_message)
        response = self.check_all_messages(split_message)
        print(response)
        return response

    # Resto del código del chatbot...
    def message_probability(self, user_message, recognized_words, single_response=False, required_word=[]):
        message_certainty = 0
        has_required_words = True

        for word in user_message:
            if word in recognized_words:
                message_certainty +=1

        percentage = float(message_certainty) / float (len(recognized_words))

        for word in required_word:
            if word not in user_message:
                has_required_words = False
                break

        if has_required_words or single_response:
            return int(percentage * 100)
        else:
            return 0
        

    def check_all_messages(self, message):
        highest_prob = {}

        def response(bot_response, list_of_words, single_response = False, required_words = []):
            nonlocal highest_prob
            highest_prob[bot_response] = self.message_probability(message, list_of_words, single_response, required_words)

        response('Hola soy <strong>certusBot</strong>', ['hola', 'hi', 'saludos', 'buenas','¿Cómo', 'estás', 'va', 'vas', 'sientes'],  single_response = True)

        respuestas = Respuestas.objects.filter(id__range=(1, 13))

        for i in range(len(respuestas)):
            id_respuesta = i + 1

            result_respuesta = Respuestas.objects.get(id=id_respuesta)
            result_palabras_clave = PalabrasClave.objects.filter(respuesta=id_respuesta)
            
            respuesta = result_respuesta.descripcion
            palabras_clave = []

            for objeto_palabra_clave in result_palabras_clave:
                palabras_clave.append(objeto_palabra_clave.palabra)

            try:
                response(respuesta, palabras_clave)
            except:
                pass


        best_match = max(highest_prob, key=highest_prob.get)

        return self.unknown() if highest_prob[best_match] < 1 else best_match
    

    def unknown(self):
        response = ['no entendi tu consulta', 'No estoy seguro de lo quieres', 'Disculpa, puedes intentarlo de nuevo?'][random.randrange(3)]
        return response