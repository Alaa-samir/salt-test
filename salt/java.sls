installing java:
  pkg.installed:
    - name: openjdk-{{ pillar['java-version'] }}-jre-headless