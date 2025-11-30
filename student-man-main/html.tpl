{{- if . }}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Trivy Report - {{ now }}</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    h1, h2 { margin-bottom: 8px; }
    table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
    th, td { border: 1px solid #ddd; padding: 8px; font-size: 14px; }
    th { background: #f2f2f2; }
    .CRITICAL { background: #ffb3b3; font-weight: bold; }
    .HIGH { background: #ffd9b3; font-weight: bold; }
    .MEDIUM { background: #fff0b3; }
    .LOW { background: #e6ffb3; }
  </style>
</head>
<body>

<h1>Trivy Security Report</h1>
<p><b>Generated:</b> {{ now }}</p>

{{- range . }}
  <h2>Target: {{ escapeXML .Target }}</h2>
  <p><b>Type:</b> {{ escapeXML .Type }}</p>

  {{- if .Vulnerabilities }}
    <table>
      <tr>
        <th>Package</th>
        <th>Vulnerability ID</th>
        <th>Severity</th>
        <th>Installed</th>
        <th>Fixed</th>
        <th>Links</th>
      </tr>

      {{- range .Vulnerabilities }}
      <tr class="{{ escapeXML .Severity }}">
        <td>{{ escapeXML .PkgName }}</td>
        <td>{{ escapeXML .VulnerabilityID }}</td>
        <td>{{ escapeXML .Severity }}</td>
        <td>{{ escapeXML .InstalledVersion }}</td>
        <td>{{ escapeXML .FixedVersion }}</td>
        <td>
          {{- range .References }}
            <a href="{{ escapeXML . }}">{{ escapeXML . }}</a><br/>
          {{- end }}
        </td>
      </tr>
      {{- end }}
    </table>
  {{- else }}
    <p>No Vulnerabilities found ✅</p>
  {{- end }}

  {{- if .Misconfigurations }}
    <table>
      <tr>
        <th>Type</th>
        <th>Misconf ID</th>
        <th>Check</th>
        <th>Severity</th>
        <th>Message</th>
        <th>Primary URL</th>
      </tr>

      {{- range .Misconfigurations }}
      <tr class="{{ escapeXML .Severity }}">
        <td>{{ escapeXML .Type }}</td>
        <td>{{ escapeXML .ID }}</td>
        <td>{{ escapeXML .Title }}</td>
        <td>{{ escapeXML .Severity }}</td>
        <td>{{ escapeXML .Message }}</td>
        <td><a href="{{ escapeXML .PrimaryURL }}">{{ escapeXML .PrimaryURL }}</a></td>
      </tr>
      {{- end }}
    </table>
  {{- else }}
    <p>No Misconfigurations found ✅</p>
  {{- end }}

{{- end }}

</body>
</html>
{{- else }}
<!DOCTYPE html>
<html><body><h1>Trivy Returned Empty Report</h1></body></html>
{{- end }}
