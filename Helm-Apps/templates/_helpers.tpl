{{/*
Expand the name of the chart.
*/}}
{{- define "digital-lending.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "digital-lending.fullname" -}}
{{ .Values.project }}-{{ .Values.env }}-{{ .Values.fullname }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "digital-lending.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "digital-lending.labels" -}}
project: {{ .Chart.Name }}
environment: {{ .Values.env }}
managed-by: argocd
{{- end }}

{{/*
Selector labels
*/}}
{{- define "digital-lending.selectorLabels" -}}
project: {{ .Chart.Name }}
app: {{ .Values.project }}-{{ .Values.env }}-{{ .Values.fullname }}-app
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "digital-lending.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "digital-lending.fullname" .) .Values.serviceAccount.name }}-sa
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create route
*/}}
{{- define "chart.helmRouteFix" -}}
status:
  ingress:
    - host: ""
{{- end -}}


{{/* vim: set filetype=mustache: */}}
{{/*
Setup a chart name
*/}}
{{- define "networkpolicy.name" -}}
{{ .Values.nameOverride }}
{{- end -}}

{{/*
Return the appropriate apiVersion for the object
*/}}
{{- define "apiVersion" -}}
{{- default "networking.k8s.io/v1" .Values.apiVersion -}}
{{- end -}}

{{/*
Namespace
*/}}
{{- define "digital-lending.namespace" -}}
{{ .Values.project }}-{{ .Values.env }}-{{ .Values.fullname }}-ns
{{- end }}

