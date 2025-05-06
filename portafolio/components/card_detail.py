import reflex as rx
from portafolio.data import Extra
from portafolio.styles.styles import IMAGE_HEIGHT, Size


def card_detail(extra: Extra) -> rx.Component:
    return rx.card(
        rx.link(
            rx.vstack(
                # Imagen separada con padding inferior
                rx.image(
                    src=extra.image,
                    height=IMAGE_HEIGHT,
                    width="100%",
                    object_fit="cover",
                    border_radius="lg"
                ),
                # Contenido textual con padding y separación
                rx.vstack(
                    rx.text.strong(extra.title),
                    rx.text(
                        extra.description,
                        size=Size.SMALL.value,
                        color_scheme="gray",
                        no_of_lines=4  # Limita altura de texto
                    ),
                    spacing=Size.SMALL.value,
                    width="100%",
                    padding_x=Size.SMALL.value,
                    padding_bottom=Size.SMALL.value
                ),
                spacing=Size.SMALL.value
            ),
            href=extra.url,
            is_external=True,
            width="100%"
        ),
        width="100%",
        height="100%",
        overflow="hidden"
    )
