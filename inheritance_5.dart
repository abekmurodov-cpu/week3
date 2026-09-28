/// Abstract base class defining a template for a report generator.
abstract class ReportGenerator {
  final String reportTitle;

  ReportGenerator(this.reportTitle);

  // 1. ABSTRACT METHOD: Subclasses MUST provide their own implementation
  String formatContent();

  // 2. CONCRETE METHOD: Common logic already implemented for all subclasses
  void generate() {
    print('==============================');
    print('REPORT: $reportTitle');
    print('Generated on: ${DateTime.now().toIso8601String()}');
    print('------------------------------');
    // Calls the subclass-specific abstract method implementation
    print(formatContent());
    print('==============================\n');
  }
}

/// Concrete subclass 1: Formats data as CSV
class CsvReport extends ReportGenerator {
  final List<String> rows;

  CsvReport(super.reportTitle, this.rows);

  // Must implement the abstract method
  @override
  String formatContent() => rows.join('\n');
}

/// Concrete subclass 2: Formats data as JSON
class JsonReport extends ReportGenerator {
  final Map<String, dynamic> data;

  JsonReport(super.reportTitle, this.data);

  // Must implement the abstract method
  @override
  String formatContent() => data.toString();
}

void main() {
  final csv = CsvReport('Monthly Sales', ['Item,Price', 'Book,12.50', 'Pen,1.50']);
  // Uses inherited concrete method .generate()
  csv.generate();

  final json = JsonReport('System Status', {'cpu': '12%', 'memory': '4.2GB'});
  json.generate();
}