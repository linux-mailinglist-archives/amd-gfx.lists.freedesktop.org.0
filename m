Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D906DFD7E
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Apr 2023 20:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EAB10E913;
	Wed, 12 Apr 2023 18:27:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0010E910;
 Wed, 12 Apr 2023 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681324049; x=1712860049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cqKO9TziOmEEhE0gbMgiPkWcojaHbnVzNzEhpsuxk3A=;
 b=MlYpcDd2b5+ONb6XHEywyqnKE2gIZwHj5ajiBDdeIyrF4/Obg4sXBgij
 2J5MaKfSCorl+KRRkh05nMGQS/mEw1EFDI//7eWd3c3q7o8HcIdmmm3VS
 fiBWRjGX3W04zi+xQwcD3h1Fu4DdTu7VDTErvC7kk4S4e+DXIItQ58wc9
 RmjeNCz+xCjvAP1p+jBquLjw3qlZ91Xx7JKKdENtmG+x6WyZzrSiVtfpZ
 UFbWhZiVsKmnXWX+g5MkFlms+yWSzGyECl9CoT4bJxu03JSxxiR1ABX1J
 RmvWcK6nLAQMoQTAue8NmuEQXRiuY+qUaJz4at4UnjDNbDQFz71mWv6yj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328099184"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328099184"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753646682"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="753646682"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 12 Apr 2023 11:27:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pmfBg-000Xyx-2P;
 Wed, 12 Apr 2023 18:27:20 +0000
Date: Thu, 13 Apr 2023 02:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] video/hdmi: minor fixes for *_infoframe_init functions
Message-ID: <202304130224.59cNkdgV-lkp@intel.com>
References: <20230412152910.9486-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412152910.9486-1-n.zhandarovich@fintech.ru>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-fbdev@vger.kernel.org,
 lvc-project@linuxtesting.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 oe-kbuild-all@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Nikita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on tegra/for-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikita-Zhandarovich/video-hdmi-minor-fixes-for-_infoframe_init-functions/20230412-232947
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230412152910.9486-1-n.zhandarovich%40fintech.ru
patch subject: [PATCH] video/hdmi: minor fixes for *_infoframe_init functions
config: i386-randconfig-a005-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130224.59cNkdgV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/36210f5b0ac3046f4c1c1d0c6e392eab40811699
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nikita-Zhandarovich/video-hdmi-minor-fixes-for-_infoframe_init-functions/20230412-232947
        git checkout 36210f5b0ac3046f4c1c1d0c6e392eab40811699
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130224.59cNkdgV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_hdmi.c:769:37: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (drm_WARN_ON(encoder->base.dev, ret))
                                              ^~~
   include/drm/drm_print.h:630:19: note: expanded from macro 'drm_WARN_ON'
           drm_WARN((drm), (x), "%s",                                      \
                            ^
   include/drm/drm_print.h:620:7: note: expanded from macro 'drm_WARN'
           WARN(condition, "%s %s: " format,                               \
                ^~~~~~~~~
   include/asm-generic/bug.h:131:25: note: expanded from macro 'WARN'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/gpu/drm/i915/display/intel_hdmi.c:756:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +769 drivers/gpu/drm/i915/display/intel_hdmi.c

b055c8f3ef9f7b drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-07-08  748  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  749  static bool
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  750  intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  751  				 struct intel_crtc_state *crtc_state,
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  752  				 struct drm_connector_state *conn_state)
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  753  {
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  754  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  755  	struct hdmi_spd_infoframe *frame = &crtc_state->infoframes.spd.spd;
5adaea799c1c2c drivers/gpu/drm/i915/intel_hdmi.c         Damien Lespiau      2013-08-06  756  	int ret;
5adaea799c1c2c drivers/gpu/drm/i915/intel_hdmi.c         Damien Lespiau      2013-08-06  757  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  758  	if (!crtc_state->has_infoframe)
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  759  		return true;
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  760  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  761  	crtc_state->infoframes.enable |=
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  762  		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_SPD);
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  763  
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  764  	if (IS_DGFX(i915))
36210f5b0ac304 drivers/gpu/drm/i915/display/intel_hdmi.c Nikita Zhandarovich 2023-04-12  765  		hdmi_spd_infoframe_init(frame, "Intel", "Discrete gfx");
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  766  	else
36210f5b0ac304 drivers/gpu/drm/i915/display/intel_hdmi.c Nikita Zhandarovich 2023-04-12  767  		hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  768  
3a47ae201e0749 drivers/gpu/drm/i915/display/intel_hdmi.c Pankaj Bharadiya    2020-01-15 @769  	if (drm_WARN_ON(encoder->base.dev, ret))
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  770  		return false;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  771  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  772  	frame->sdi = HDMI_SPD_SDI_PC;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  773  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  774  	ret = hdmi_spd_infoframe_check(frame);
3a47ae201e0749 drivers/gpu/drm/i915/display/intel_hdmi.c Pankaj Bharadiya    2020-01-15  775  	if (drm_WARN_ON(encoder->base.dev, ret))
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  776  		return false;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  777  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj�l�       2019-02-25  778  	return true;
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  779  }
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
