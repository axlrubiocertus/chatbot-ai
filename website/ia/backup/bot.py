import re
import random

class Bot:
    def get_response(self, user_input):
        split_message = re.split(r'\s|[,:;.?!-_]\s*', user_input.lower())
        response = self.check_all_messages(split_message)
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
        
        response("""
            ¡Claro! Las evidencias se deben entregar siguiendo el enlace de los lineamientos AA1 - AA4.
            <br>
            <a href="https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start">
                https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start
            </a>
        """, [ 'evidencias', 'semanas', 'entrega', 'plazos', 'fechas', 'fecha', 'deadline' ])
            # ¿Cuáles son las semanas de entrega de las evidencias del curso?

        response("""
            Para encontrar la rúbrica de la evidencia AA1, simplemente sigue este enlace.
            <br>     
            <a href="https://campusdigital.certus.edu.pe/pluginfile.php/746234/mod_resource/content/0/R%C3%BAbrica%20AA1.pdf" target="_blank">
                https://campusdigital.certus.edu.pe/pluginfile.php/746234/mod_resource/content/0/R%C3%BAbrica%20AA1.pdf
            </a>
        """, ['rubrica', 'rúbrica', 'enlace', 'aa1', 'instrucciones'])     
                    #¿Dónde encuentro la rúbrica de la evidencia AA1?

        response("""
            Los criterios de evaluación de la evidencia 1 se encuentran en este enlace.
            <br>
            <a href="https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf" target="_blank">
                https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf
            </a>
        """, ['criterios', 'evaluacion', 'evaluación','enlace', 'puntos', 'pautas', 'puntuacion', 'primera', 'evidencia 1'])      #¿Cuáles son los criterios de evaluación de la evidencia x?

        response("""
            La evaluación de la evidencia 2 puede ser grupal o individual. Para más detalles, consulta este enlace.
            <br>
            <a href="https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf" target="_blank">
                https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf
            </a>
        """,  ['evaluacion', 'grupal', 'individual', 'segunda', 'evidencia 2', 'enlace']) #¿La evaluación de la evidencia x es grupal o individual?


        response("""
            Los lineamientos de evaluación del curso se encuentran en el siguiente video. 
            <br><br>
            <div class="mp-3">
                <iframe width="100%" height="315" src="https://www.youtube.com/embed/e7UiyEaXm-Y?si=5fWv1hbtRscv1jLB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
        """, ['lineamientos', 'evaluacion', 'evaluación','ruta', 'video', 'curso', 'pautas', 'indicaciones', 'guia']) #¿Dónde puedo encontrar los lineamientos de evaluación del curso?


        response("""
            ¡Claro! Para ver tus notas, accede al sigueinte enlace del campus del estudiante
            <a href="https://intranet.certus.edu.pe/Login/">
                    https://intranet.certus.edu.pe/Login/
            </a>
                y mira este video que te muestra cómo hacerlo.  
            <br><br>
            <iframe width="100%" height="315" src="https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        """, ['notas', 'visualizar', 'campus', 'video', 'donde', 'ver', 'puntajes', 'puedo'])    #¿Dónde puedo visualizar mis notas?
        
        response("""
            Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.
            <br><br>
            <iframe width="100%" height="315" src="https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        """, ['mejorar', 'notas', 'curso', 'video', 'tips', 'consejos', 'estrategias', 'tips'])  #¿Cómo puedo mejorar mis notas en el curso?

        response("""
            Puedes ver tus notas una semana después de presentar tus evidencias. ¡No te preocupes, es rápido! Una semana después de la presentación de cada una de tus evidencias!
        """, ['semanas', 'visualizar', 'notas', 'cuando', 'disponibles', 'puntajes'])        #¿En qué semanas puedo visualizar las notas del curso?

        """ response('Estoy bien y tu?', ['como', 'estas', 'va', 'vas', 'sientes'], required_words=['como'])
        response('Siempre a la orden', ['gracias', 'te lo agradezco', 'thanks'], single_response=True)
        response('Arquitectura y Diseño con IA', ['sexto ciclo', 'sexto', 'cursos de sexto'], single_response=True)
        response('https://campusdigital.certus.edu.pe/calendar/view.php?view=day&course=11654&time=1697630401#event_8102308', ['¿Cuáles son las semanas de entrega de las evidencias del curso?', 'evidencias', 'semanas'], single_response=True)
        response('Arquitectura y Diseño con IA', ['sexto ciclo', 'sexto', 'cursos de sexto'], single_response=True)
        response('Arquitectura y Diseño con IA', ['sexto ciclo', 'sexto', 'cursos de sexto'], single_response=True)
        response('Arquitectura y Diseño con IA', ['sexto ciclo', 'sexto', 'cursos de sexto'], single_response=True)
        response('Arquitectura y Diseño con IA', ['sexto ciclo', 'sexto', 'cursos de sexto'], single_response=True) """


        best_match = max(highest_prob, key=highest_prob.get)
        #print(highest_prob)

        return self.unknown() if highest_prob[best_match] < 1 else best_match
    

    def unknown(self):
        response = ['no entendi tu consulta', 'No estoy seguro de lo quieres', 'Disculpa, puedes intentarlo de nuevo?'][random.randrange(3)]
        return response