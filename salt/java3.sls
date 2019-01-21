installing java:
  pkg.installed:
    - name: java-1.{{ pillar['java-version'] }}.0-openjdk-devel