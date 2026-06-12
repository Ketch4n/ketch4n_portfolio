import 'package:http/http.dart' as http;
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:printing/printing.dart';

/// Fetches the resume PDF from the remote URL and opens
/// the browser's print/preview dialog with the PDF content.
Future<void> printResume() async {
  await Printing.layoutPdf(
    onLayout: (_) async {
      final response = await http.get(Uri.parse(PortfolioConfig.resumeLink));
      return response.bodyBytes;
    },
  );
}
