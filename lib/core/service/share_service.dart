import 'dart:io';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/bond_detail.dart';

enum ShareMethod { text, pdf, whatsapp, email, telegram, copy, custom }

abstract class ShareService {
  Future<void> shareBondDetails(BondDetail bondDetail, ShareMethod method);
  Future<void> copyToClipboard(String text);
  Future<void> shareViaWhatsApp(String text);
  Future<void> shareViaEmail(String subject, String body);
  Future<void> shareViaTelegram(String text);
  Future<void> shareAsText(String text);
  Future<void> shareAsPdf(String title, String content);
}

@LazySingleton(as: ShareService)
class ShareServiceImpl implements ShareService {
  @override
  Future<void> shareBondDetails(BondDetail bondDetail, ShareMethod method) async {
    final bondDetailsText = _formatBondDetailsAsText(bondDetail);

    switch (method) {
      case ShareMethod.text:
        await shareAsText(bondDetailsText);
        break;
      case ShareMethod.pdf:
        await shareAsPdf(bondDetail.companyName, bondDetailsText);
        break;
      case ShareMethod.whatsapp:
        await shareViaWhatsApp(bondDetailsText);
        break;
      case ShareMethod.email:
        await shareViaEmail('Bond Details: ${bondDetail.companyName}', bondDetailsText);
        break;
      case ShareMethod.telegram:
        await shareViaTelegram(bondDetailsText);
        break;
      case ShareMethod.copy:
        await copyToClipboard(bondDetailsText);
        break;
      case ShareMethod.custom:
        await Share.share(
          bondDetailsText,
          subject: 'Bond Details: ${bondDetail.companyName}',
        );
        break;
    }
  }

  @override
  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<void> shareViaWhatsApp(String text) async {
    final encodedText = Uri.encodeComponent(text);
    final whatsappUrl = 'whatsapp://send?text=$encodedText';

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw Exception('Could not launch WhatsApp');
    }
  }

  @override
  Future<void> shareViaEmail(String subject, String body) async {
    final emailUrl = 'mailto:?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

    if (await canLaunchUrl(Uri.parse(emailUrl))) {
      await launchUrl(Uri.parse(emailUrl));
    } else {
      throw Exception('Could not launch email client');
    }
  }

  @override
  Future<void> shareViaTelegram(String text) async {
    final encodedText = Uri.encodeComponent(text);
    final telegramUrl = 'tg://msg?text=$encodedText';

    if (await canLaunchUrl(Uri.parse(telegramUrl))) {
      await launchUrl(Uri.parse(telegramUrl));
    } else {
      throw Exception('Could not launch Telegram');
    }
  }

  @override
  Future<void> shareAsText(String text) async {
    await Share.share(text);
  }

  @override
  Future<void> shareAsPdf(String title, String content) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(level: 0, child: pw.Text(title)),
              pw.SizedBox(height: 20),
              pw.Text(content),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/bond_details.pdf');
    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'Bond Details: $title',
    );
  }

  String _formatBondDetailsAsText(BondDetail bondDetail) {
    final buffer = StringBuffer();

    buffer.writeln('BOND DETAILS\n');
    buffer.writeln('Company: ${bondDetail.companyName}');
    buffer.writeln('ISIN: ${bondDetail.isin}');
    buffer.writeln('Status: ${bondDetail.isActive ? "Active" : "Inactive"}');
    buffer.writeln('\nDescription:\n${bondDetail.description}\n');

    // Add pros
    if (bondDetail.pros.isNotEmpty) {
      buffer.writeln('\nPROS:');
      for (final pro in bondDetail.pros) {
        buffer.writeln('• ${pro.description}');
      }
    }

    // Add cons
    if (bondDetail.cons.isNotEmpty) {
      buffer.writeln('\nCONS:');
      for (final con in bondDetail.cons) {
        buffer.writeln('• ${con.description}');
      }
    }

    // Add issuer details
    buffer.writeln('\nISSUER DETAILS:');
    buffer.writeln('Issuer Name: ${bondDetail.issuerDetails.issuerName}');
    buffer.writeln('Sector: ${bondDetail.issuerDetails.sector}');
    buffer.writeln('Industry: ${bondDetail.issuerDetails.industry}');
    buffer.writeln('Issuer Nature: ${bondDetail.issuerDetails.issuerNature}');
    buffer.writeln('CIN: ${bondDetail.issuerDetails.cin}');

    buffer.writeln('\nShared from Hella Infra Bond App');

    return buffer.toString();
  }
}
