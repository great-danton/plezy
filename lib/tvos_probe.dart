import 'dart:ui' as ui;

void main() {
  ui.PlatformDispatcher.instance.onBeginFrame = (Duration timeStamp) {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    
    // Paint entire screen red
    canvas.drawPaint(ui.Paint()..color = const ui.Color(0xFFFF0000));
    
    // Draw white text
    final paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontSize: 80,
        textAlign: ui.TextAlign.center,
      ),
    )
      ..pushStyle(ui.TextStyle(color: const ui.Color(0xFFFFFFFF)))
      ..addText('TVOS OK');
    
    final paragraph = paragraphBuilder.build()
      ..layout(const ui.ParagraphConstraints(width: 1920));
    
    canvas.drawParagraph(paragraph, const ui.Offset(0, 440));
    
    final picture = recorder.endRecording();
    
    final sceneBuilder = ui.SceneBuilder();
    sceneBuilder.pushOffset(0, 0);
    sceneBuilder.addPicture(ui.Offset.zero, picture);
    sceneBuilder.pop();
    
    ui.window.render(sceneBuilder.build());
  };
  
  ui.PlatformDispatcher.instance.scheduleFrame();
  ui.PlatformDispatcher.instance.onDrawFrame = () {
    ui.PlatformDispatcher.instance.scheduleFrame();
  };
}
