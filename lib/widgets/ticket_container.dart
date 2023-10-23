import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youthopia/data/models/ticket_model.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/common_utils.dart';
import 'package:youthopia/utils/snackbar.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/black_container.dart';
import 'package:gallery_saver/gallery_saver.dart';

class TicketContainer extends StatefulWidget {
  const TicketContainer({super.key, required this.ticket});
  final TicketDetails ticket;

  @override
  State<TicketContainer> createState() => _TicketContainerState();
}

class _TicketContainerState extends State<TicketContainer> {
  final GlobalKey key = GlobalKey();
  bool loading = false;
  void download() async {
    {
      setState(() {
        loading = true;
      });
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      String path = '$tempPath/$ts.png';

      RenderRepaintBoundary boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary;

      if (boundary.debugNeedsPaint) {
        print("Waiting for boundary to be painted.");
        await Future.delayed(const Duration(milliseconds: 20));
        return download();
      }

      var image = await boundary.toImage();

      final picData = await image.toByteData(format: ui.ImageByteFormat.png);
      await writeToFile(picData!, path);

      final success = await GallerySaver.saveImage(path);
      if (success!) {
        ShowSnackBar.snack(context,
            title: 'Download Success',
            message: 'Ticket successfully downloaded',
            type: 'success');
      } else {
        ShowSnackBar.snack(context,
            title: 'Error Downloading',
            message: 'Please Try again later!',
            type: 'failure');
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: key,
      child: BlackContainer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(25)),
            child: Image.network(
              widget.ticket.event.poster,
              errorBuilder: (context, exception, stacktrace) {
                return Image.asset(
                  'Assets/fake_image.png',
                  alignment: Alignment.center,
                  height: 200,
                  width: 350,
                  fit: BoxFit.cover,
                );
              },
              alignment: Alignment.center,
              height: 200,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.ticket.event.eventName,
            style: const TextStyle(
                color: CustomColors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ).wrapCenter().paddingWithSymmetry(horizontal: 8, vertical: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.ticket.teamName,
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 20,
                ),
              ).paddingWithSymmetry(horizontal: 20, vertical: 8),
              Text(
                'Total Members: ${1 + widget.ticket.teamMembers.length}',
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 20,
                ),
              ).paddingWithSymmetry(horizontal: 20, vertical: 8)
            ],
          ),
          Text(
            "Date - ${CommonUtils.getDate(widget.ticket.event.date)}",
            style: const TextStyle(
              color: CustomColors.white,
              fontSize: 20,
            ),
          ).paddingWithSymmetry(horizontal: 20, vertical: 8),
          Text(
            "Time - ${widget.ticket.event.startTime} - ${widget.ticket.event.endTime}",
            style: const TextStyle(
              color: CustomColors.white,
              fontSize: 20,
            ),
          ).paddingWithSymmetry(horizontal: 20, vertical: 2),
          Text(
            "Venue - ${widget.ticket.event.venue}",
            style: const TextStyle(
              color: CustomColors.white,
              fontSize: 20,
            ),
          ).paddingWithSymmetry(horizontal: 20, vertical: 2),
          Text(
            "Ticket ID - ${widget.ticket.ticketId}",
            style: const TextStyle(
                color: CustomColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ).paddingWithSymmetry(horizontal: 20, vertical: 8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                side:
                    const BorderSide(color: CustomColors.glowBlue, width: 2)),
            onPressed: () => download(),
            child: (loading) ? LoadingAnimationWidget.staggeredDotsWave(
              color: CustomColors.glowBlue,
              size: 20,
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Download Ticket',
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.glowBlue,
                  ),
                ).paddingWithSymmetry(horizontal: 2),
                const Icon(
                  Icons.download,
                  color: CustomColors.glowBlue,
                ).paddingWithSymmetry(horizontal: 2)
              ],
            ),
          ).paddingWithSymmetry(horizontal: 20, vertical: 10).wrapCenter()
        ],
      )),
    );
  }
}

Future<void> writeToFile(ByteData data, String path) async {
  final buffer = data.buffer;
  await File(path)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}
