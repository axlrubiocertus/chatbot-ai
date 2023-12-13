const titulo = document.getElementById('titulo_conversacion');
const chat = document.getElementById('chat');

const obtener_conversacion_db = async (titulo) => {
    return await fetch(
        'http://127.0.0.1:8000/obtener_conversacion_bd/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify( { titulo_conversacion_buscar : titulo } ),
        }
    )
    .then(response => response.json())
    .then(data => {
        return data.conversations;
    })
    .catch(error => {
        console.error('Error:', error);
    })
}

const obtener_conversacion_guardada = async (titulo_conversacion) => {
    const lista_conversaciones = await obtener_conversacion_db(titulo_conversacion);
    
    lista_conversaciones.forEach(conversacion => {
        mensaje_usuario(conversacion.solicitud);
        mensaje_bot(conversacion.respuesta);
    });

    document.getElementById('window-chat').scrollTop = document.getElementById('window-chat').scrollHeight;
}

const limpiar_chat = () => {
    chat.innerHTML = '';
}

const modificar_titulo = (nuevo_titulo) => {
    titulo.innerText = nuevo_titulo;
}

const seleccionar_conversacion = (e, conversacion) => {
    e.preventDefault();
    
    const conversacion_seleccionada = conversacion.children[0].children[0].innerText;
    console.log(conversacion_seleccionada);
    
    modificar_titulo(conversacion_seleccionada);
    limpiar_chat();
    obtener_conversacion_guardada(conversacion_seleccionada);
};

document.querySelectorAll('.card-conversation').forEach(conversacion => {
    conversacion.addEventListener('click', (e) => seleccionar_conversacion(e, conversacion));
});