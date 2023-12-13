const consulta_bot = async (titulo, mensaje) => {
    await new Promise(resolve => setTimeout(resolve, 2000));

    await fetch(
        'http://127.0.0.1:8000/bot/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify( { title: titulo, message : mensaje } ),
        }
    )
    .then(response => response.json())
    .then(data => {
        let respuesta = data.respuesta;
        mensaje_bot(respuesta);
    })
    .catch(error => {
        console.error('Error:', error);
    })
    .finally(() => {
        document.getElementById('window-chat').scrollTop = document.getElementById('window-chat').scrollHeight;
    });
}

const mensaje_bot = ( message ) => {
    let mensaje_html = `
        <div class="row">
            <div class="col-8">
                <div class="alert alert-primary" role="alert" style="display: inline-block">
                    <p class="mb-0">${ message }</p>
                </div>
            </div>
        </div>
    `;

    document.getElementById('chat').innerHTML = document.getElementById('chat').innerHTML + mensaje_html
}

const mensaje_usuario = async ( message ) => {
    let mensaje_html = `
        <div class="row">
            <div class="offset-4 col-8" style="text-align: right">
                <div class="alert alert-secondary ms-auto" role="alert" style="display: inline-block">
                    <p class="mb-0">${ message }</p>
                </div>
            </div>
        </div>
    `;

    document.getElementById('chat').innerHTML = document.getElementById('chat').innerHTML + mensaje_html
}


// Función para obtener la fecha y hora formateadas
function obtenerFechaYHora() {
    var fechaActual = new Date();
    var dia = ("0" + fechaActual.getDate()).slice(-2);
    var mes = ("0" + (fechaActual.getMonth() + 1)).slice(-2);
    var año = fechaActual.getFullYear();
    var hora = ("0" + fechaActual.getHours()).slice(-2);
    var minutos = ("0" + fechaActual.getMinutes()).slice(-2);
    var segundos = ("0" + fechaActual.getSeconds()).slice(-2);

    var fechaFormateada = dia + '/' + mes + '/' + año;
    var horaFormateada = hora + ':' + minutos + ':' + segundos;

    return { fecha: fechaFormateada, hora: horaFormateada };
}
  
// Función para obtener el número de conversación mediante fetch
async function obtenerNumeroConversacion() {
    try {
        const response = await fetch('http://127.0.0.1:8000/ultima_conversacion/'); // Reemplaza 'TU_ENDPOINT_AQUI' con tu URL de la API
        const data = await response.json();
        console.log(data);
        return data.numero_conversacion;
    } catch (error) {
        console.error('Error al obtener el número de conversación:', error);
        return null;
    }
}
  
// Función principal para generar el texto
async function generarTextoConversacion() {
    const numeroConversacion = await obtenerNumeroConversacion();
    
    if (numeroConversacion !== null) {
        const { fecha, hora } = obtenerFechaYHora();
        const conversacionHeader = `Conversacion #${numeroConversacion} - ${fecha} ${hora}`;

        const campo_titulo = document.getElementById('titulo_conversacion');
        campo_titulo.innerText = conversacionHeader;
    }

}

generarTextoConversacion();

document.getElementById("boton_enviar").addEventListener('click', async ( event ) => {
    let user_input = document.getElementById("input_text_user").value;
    let titulo = document.getElementById('titulo_conversacion').innerText;
    
    document.getElementById("input_text_user").value = '';

    await mensaje_usuario(user_input);
    
    document.getElementById('window-chat').scrollTop = document.getElementById('window-chat').scrollHeight;    

    await consulta_bot(titulo, user_input);
});
