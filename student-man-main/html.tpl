{{- /* Trivy HTML template (simple + compatible) */ -}}
<html>
<head>
  <meta charset="utf-8"/>
  <title>Trivy Report</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    h2 { margin-top: 30px; }
    table { border-collapse: collapse; width: 100%; margin-top: 10px; }
    th, td { border: 1px solid #ddd; padding: 8px; font-size: 14px; }
    th { background: #f4f4f4; }
    .HIGH { background: #fff3cd; }
    .CRITICAL { background: #f8d7da; }
    .MEDIUM, .LOW, .UNKNOWN { background: #eee; }
  </style>
</head>
<body>

<h1>Trivy Container Scan Report</h1>

{{- range .Results }}
  <h2>Target: {{ .Target }}</h2>

  {{- if .Vulnerabilities }}
    <table>
      <tr>
        <th>VulnerabilityID</th>
        <th>Package</th>
        <th>Installed</th>
        <th>Fixed</th>
        <th>Severity</th>
        <th>Title</th>
      </tr>

      {{- range .Vulnerabilities }}
      <tr class="{{ .Severity }}">
        <td>{{ .VulnerabilityID }}</td>
        <td>{{ .PkgName }}</td>
        <td>{{ .InstalledVersion }}</td>
        <td>{{ .FixedVersion }}</td>
        <td>{{ .Severity }}</td>
        <td>{{ .Title }}</td>
      </tr>
      {{- end }}
    </table>
  {{- else }}
    <p>No vulnerabilities found 🎉</p>
  {{- end }}

{{- end }}

</body>
</html>
