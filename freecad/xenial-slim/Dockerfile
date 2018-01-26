FROM izone/arm32v7:xenial-slim
MAINTAINER Leonardo Loures <luvres@hotmail.com>

# sudo apt-get install qemu-user-static binfmt-support
# sudo update-binfmts --enable qemu-arm
# sudo update-binfmts --display qemu-arm 
# cp /usr/bin/qemu-arm-static .
COPY qemu-arm-static /usr/bin/qemu-arm-static

## References:
# https://gist.github.com/berndhahnebach/38d5bfe73134928c0a1ad001a94df05f
# https://github.com/berndhahnebach/Netgen
# https://sourceforge.net/p/netgen-mesher/wiki/Home/
# https://aur.archlinux.org/packages
# http://www.boost.org/doc/libs/1_64_0/more/getting_started/unix-variants.html
# https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html


ENV FREECAD=/opt/FreeCAD
RUN \
	mkdir -p $FREECAD \
  \
	&& pack_dev=" \
		doxygen \
		libpyside-dev \
		libqtcore4 \
		libshiboken-dev \
		libxerces-c-dev \
		libxmu-dev \
		libxmu-headers \
		libxmu6 \
		libxmuu-dev \
		libxmuu1 \
		libqtwebkit-dev \
		pyside-tools \
		python-pivy \
		python-pyside \
		python-matplotlib \
		swig " \
  \
	&& libBoost_dev=" \
		libboost-filesystem1.58-dev \
		libboost-program-options1.58-dev \
		libboost-python1.58-dev \
		libboost-regex1.58-dev \
		libboost-signals1.58-dev \
		libboost-system1.58-dev \
		libboost-thread1.58-dev " \
  \
	&& pack_tools=" \
		automake \
		dictionaries-common \
		git \
		wget \
		g++ \
		tcl8.5-dev \
		tk8.5-dev \
		libcoin80-dev \
		libhdf5-dev \
		libfreetype6-dev \
		python-dev \
		qt4-dev-tools \
		qt4-qmake " \
  \
	&& pack_netgen=" \
		openmpi-bin \
		libopenmpi-dev \
		libtogl-dev " \
  \
	&& pack_occt=" \
		libfreeimage-dev \
		libtbb-dev " \
  \
	&& pack_calculix=" \
		gfortran \
		cpio " \
  \
	&& apt-get update \
	&& apt-get install -y \
		$pack_dev \
		$libBoost_dev \
		$pack_tools \
		$pack_netgen \
		$pack_occt \
		$pack_calculix \
		cmake \
  \
  ### libMED 3.2.0
  #----------------
	&& MAKEDIR=med \
	&& cd \
	&& mkdir $MAKEDIR \
	&& cd $MAKEDIR \
	&& git clone https://github.com/luvres/libMED.git \
  \
  # building MED
	&& mkdir build \
	&& cd build \
  \
	&& cmake ../libMED \
		-DCMAKE_INSTALL_PREFIX:PATH=$FREECAD \
  \
	&& make -j$(nproc) \
	&& make install \
  # Clean
	&& cd && rm $MAKEDIR -fR \
  \
  ### OCCT 7.1.0p1 -> libfreeimage-dev libfreeimage3 libtbb-dev libtbb2
  #----------------
	&& MAKEDIR=occt \
	&& cd \
	&& mkdir $MAKEDIR \
	&& cd $MAKEDIR \
	&& git clone https://github.com/luvres/occt71.git \
	&& mkdir build \
	&& cd build \
  \
	&& cmake \
		../occt71 \
		-DCMAKE_INSTALL_PREFIX:PATH=$FREECAD \
		-DUSE_VTK:BOOL=OFF \
		-DUSE_TBB:BOOL=ON \
		-DUSE_FREEIMAGE:BOOL=ON \
		-DCMAKE_BUILD_TYPE=Release \
  \
	&& make -j$(nproc) \
	&& make install \
  \
  # Clean
	&& cd && rm $MAKEDIR -fR \
  \
  ### Netgen 5.3.1
  #----------------
	&& cd \
	&& git clone https://github.com/luvres/netgen.git \
	&& cd netgen \
  \
	# building Netgen
	&& ./configure \
		--prefix=$FREECAD \
		--enable-occ \
		--with-occ=$FREECAD \
		--with-tcl=/usr/lib/tcl8.5 \
		--with-tk=/usr/lib/tk8.5 \
		--with-togl=/usr/lib/ \
		--enable-shared \
		--enable-nglib \
		--disable-gui \
		--disable-dependency-tracking \
		CXXFLAGS="-DNGLIB_EXPORTS -std=gnu++11" \
  \
	&& make -j$(nproc) \
	&& make install \
  \
	&& cp -fR libsrc $FREECAD/libsrc \
  \
  # Clean
	&& cd && rm netgen -fR \
  \
  ### Eigen 3.3.4
  #---------------
  # http://eigen.tuxfamily.org/index.php?title=Main_Page
	&& eigen_VERSION=3.3.4 \
  \
	&& MAKEDIR=eigen \
	&& cd \
	&& mkdir $MAKEDIR \
	&& cd $MAKEDIR \
	&& wget -c http://bitbucket.org/eigen/eigen/get/${eigen_VERSION}.tar.gz \
	&& tar zxf ${eigen_VERSION}.tar.gz \
	&& rm ${eigen_VERSION}.tar.gz \
	&& mv eigen-* eigen-${eigen_VERSION} \
	&& mkdir build \
	&& cd build \
  \
    && cmake ../eigen-${eigen_VERSION} \
        -DCMAKE_INSTALL_PREFIX=$FREECAD \
        -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG \
        -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
  \
    && make install \
  # Clean
	&& cd && rm $MAKEDIR -fR \
  \
  ### VTK 8.0.1
  #-------------
	&& vtk_VERSION_MAJOR=8.0 \
	&& vtk_VERSION_MINOR=8.0.1 \
  \
	&& MAKEDIR=vtk \
	&& cd \
	&& mkdir $MAKEDIR \
	&& cd $MAKEDIR \
	&& wget http://www.vtk.org/files/release/${vtk_VERSION_MAJOR}/VTK-${vtk_VERSION_MINOR}.tar.gz \
	&& gunzip VTK-${vtk_VERSION_MINOR}.tar.gz \
	&& tar xf VTK-${vtk_VERSION_MINOR}.tar \
	&& rm VTK-${vtk_VERSION_MINOR}.tar \
  # building VTK
	&& mkdir build \
	&& cd build \
  \
	&& cmake ../VTK-${vtk_VERSION_MINOR} \
			-DCMAKE_INSTALL_PREFIX:PATH=$FREECAD \
			-DVTK_Group_Rendering:BOOL=OFF \
			-DVTK_Group_StandAlone:BOOL=ON \
			-DVTK_RENDERING_BACKEND=None \
  \
	&& make -j$(nproc) \
	&& make install \
  # Clean
	&& cd && rm $MAKEDIR -fR \
  \
  ### FreeCAD latest Github commit
  #--------------------------------
  # get FreeCAD
	&& cd \
	&& git clone https://github.com/FreeCAD/FreeCAD \
  \
  # building FreeCAD
	&& cd \
	&& mkdir build \
	&& cd build \
  \
	&& cmake ../FreeCAD \
			-DCMAKE_INSTALL_PREFIX:PATH=$FREECAD \
			-DOCC_INCLUDE_DIR=$FREECAD/include/opencascade \
			-DNETGEN_ROOT=$FREECAD \
			-DBUILD_FEM_NETGEN=ON \
  \
  # Make FreeCAD
	&& cd \
	&& cd build \
	&& make -j$(nproc) \
  \
  # Install FreeCAD
	&& cd \
	&& cd build \
	&& make install \
	&& ln -s /opt/FreeCAD/bin/FreeCAD /usr/bin/freecad-git \
  # Clean
	&& cd && rm -fR \
		FreeCAD/ build/ \
	  # 79M
		$FREECAD/doc/* \
	  # 128M
		$FREECAD/share/doc/* \
  \
  ### Calculix 2.12 and CGX
  #-------------------------
	&& ccx_VERSION=2.12 \
  \
	&& cd \
	&& git clone https://github.com/luvres/calculix.git \
	&& cd calculix/ \
	&& ./install \
	&& cp $HOME/CalculiX-${ccx_VERSION}/bin/ccx_${ccx_VERSION} /usr/bin/ccx \
	&& cp $HOME/CalculiX-${ccx_VERSION}/bin/cgx /usr/bin/cgx \
  # Clean
	&& cd && rm CalculiX-${ccx_VERSION} calculix -fR \
  \
  ## Clean All
	&& strip \
		$FREECAD/lib/*.? \
		$FREECAD/lib/*.so \
#		/usr/bin/ccx /usr/bin/cgx \
  \
	&& apt-get remove -y \
		$libBoost_dev \
		$pack_tools \
		$pack_netgen \
		$pack_occt \
		$pack_calculix \
		cmake \
  \
	&& apt-get autoremove -y \
  \
	&& apt-get install -y \
	  \
		libfreeimage3 \
		libtbb2 \
		libhdf5-10 \
		libfreetype6 \
		openssh-client \
	  # libBoost-1.58
		libboost-atomic1.58.0 \
		libboost-chrono1.58.0 \
		libboost-filesystem1.58.0 \
		libboost-program-options1.58.0 \
		libboost-python1.58.0 \
		libboost-regex1.58.0 \
		libboost-signals1.58.0 \
		libboost-system1.58.0 \
		libboost-thread1.58.0 \
		libboost-date-time1.58.0 \
		libboost-serialization1.58.0 \
	  # libhdf5-dev
		libhdf5-cpp-11 libjpeg-dev libjpeg-turbo8-dev zlib1g-dev \
  \
  # gmsh 2.10.1
	&& apt-get install -y gmsh \
  \
	&& rm /usr/share/doc/* -fR

WORKDIR /root
