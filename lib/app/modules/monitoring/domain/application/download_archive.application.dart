import "dart:html" as html;

import 'package:value_panel/app/modules/monitoring/domain/usecases/download_archive.usecase.dart';

class DownloadArchive implements DownloadArchiveUseCase{

  @override
  Future call({required String url})async{
    html.AnchorElement anchorElement =  html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
}