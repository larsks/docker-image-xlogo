FROM fedora

RUN yum -y install xlogo xauth

ADD startxlogo /startxlogo
CMD /startxlogo

