/*
   ! USO DEL this_to EN EL CONSTRUCTOR
   ? Usar 'this._to' en el constructor asigna directamente el valor al campo privado.
   ? Este estilo es conveniente para clases simples sin validaciones, pero no permite
   ? realizar validaciones o transformaciones antes de la asignación.

   ! USO DEL this_to EN EL CONSTRUCTOR
   ? Si necesitas validar o transformar el valor antes de asignarlo, usa el estilo con
   ? ': _to = to'. Así podrás hacer validaciones y lógica adicional antes de la asignación. 
*/

/* 
  ! USO DEL : EN EL CONSTRUCTOR
   ? Constructor con lista de inicialización (':') para asignación directa
   ? Usamos ':' para asignar los valores de los parámetros directamente a las propiedades.
   ? Esto es más eficiente y limpio cuando no se requiere lógica adicional.
   ? La asignación ocurre antes de ejecutar el cuerpo del constructor.

   ! USO DEL {} EN EL CONSTRUCTOR
   ? Si en algún caso necesitamos lógica o validaciones antes de asignar el valor a una propiedad,
   ? usaríamos '{}' en lugar de ':'. Por ejemplo:
   ? Si necesitamos validar que 'to' no esté vacío, lo haríamos aquí en el cuerpo del constructor.
*/

// ignore_for_file: unused_field

class EmailNotification {
  final String _to;
  final String _subject;
  final String _body;
  final List<String>? _cc;
  final List<String>? _bcc;
  final List<String>? _attachments;
  final String? _priority;

  EmailNotification(
      {required String to,
      required String subject,
      required String body,
      List<String>? cc,
      List<String>? bcc,
      List<String>? attachments,
      String? priority})
      : _to = to,
        _subject = subject,
        _body = body,
        _cc = cc,
        _bcc = bcc,
        _attachments = attachments,
        _priority = priority;

  String get to => _to;
  String get subject => _subject;
  String get body => _body;
  List<String>? get cc => _cc;
  List<String>? get bcc => _bcc;
  List<String>? get attachments => _attachments;
  String? get priority => _priority;

  Map<String, dynamic> toMap() {
    return {
      'to': _to,
      'subject': _subject,
      'body': _body,
      'cc': _cc ?? [],
      'bcc': _bcc ?? [],
      'attachments': _attachments ?? [],
      'priority': _priority ?? '---',
    };
  }
}
