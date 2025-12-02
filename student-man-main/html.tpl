<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Trivy Vulnerability Report</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    h1, h2 { color: #222; }
    table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
    th, td { border: 1px solid #ddd; padding: 8px; font-size: 14px; }
    th { background: #f4f4f4; }
    .CRITICAL { background: #ffdddd; font-weight: bold; }
    .HIGH { background: #ffe8cc; font-weight: bold; }
    .MEDIUM { background: #fffacc; }
    .LOW { background: #eaffea; }
  </style>
</head>
<body>

<h1>Trivy Vulnerability Report</h1>

<h2>Target: {{ .Target }}</h2>
<p>Type: {{ .Type }}</p>

{{- if .Vulnerabilities }}
<table>
  <thead>
    <tr>
      <th>Vulnerability ID</th>
      <th>Pkg</th>
      <th>Installed</th>
      <th>Fixed</th>
      <th>Severity</th>
      <th>Title</th>
    </tr>
  </thead>
  <tbody>
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
  </tbody>
</table>
{{- else }}
<p><b>No vulnerabilities found.</b></p>
{{- end }}

</body>
</html>
