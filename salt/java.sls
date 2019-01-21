installing java:
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'RedHat' %}
        - name: java-1.{{ pillar['java-version'] }}.0-openjdk-devel
        {% elif grains['os_family'] == 'Debian' %}
        - name: openjdk-{{ pillar['java-version'] }}-jre-headless
        {% endif %}