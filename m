Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E69C08C6
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Nov 2024 15:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6872410E85B;
	Thu,  7 Nov 2024 14:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yqRgB49e";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDED10E7EB
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Nov 2024 10:38:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso480730f8f.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 07 Nov 2024 02:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730975884; x=1731580684; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ea2x5q1iMawp9uzNjcI5iHXvZAYMp3llBYpFWmiscrQ=;
 b=yqRgB49ea0vZgK4EGl485Bik2WgdOOGLaYJqn5pkRRoGgppaYJiqMI1bISZk2iAVzy
 hqAxZ7tAea3qhGLCBbv1Zgn3F7UEX3KmRps5/vV4S4QKvmbEgArJAo9O6andBEEZmo/0
 oTIjTRO/9e9oTPJMe8ZBxWt6+AMj2JN9Lmay13mEm8fxPITVa5dgCu9S42dT0hnXgsJq
 Pd/8IQkzXaTMFvGGWuQNhxLkcu6ml/DLCOwGwyeMD5CLVbnFmpK6bsIZixbg463Mjdy5
 AlHBSmmj9moakdIGS9XauBLe9O4tM2dI8S6L26cWi36rGXp55Qf9lbmdngBO6YXQGp/h
 nl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730975884; x=1731580684;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ea2x5q1iMawp9uzNjcI5iHXvZAYMp3llBYpFWmiscrQ=;
 b=SWL/izkYR8RZNmLo7Ls2+lbX5zFFzGSNKJuXPlnv7TggvXO9FJp3e/VnHNS/uPpnsL
 mXgyK7zdQFAXK5/rVwfHk4E6gyLrgduRW6Ptld7ZY8bGYlUB/1kY9g/mgjRBNn/HsnTB
 lGjV4C24sKlgD6HU6OWcaLlpkUJpbx5kRC3NR9BtMZhuHL3wrwBuElNWhfvotIDtz+4h
 vS//WPgRvtyVacy7fMs3alSmzdKFpJVfc+lxuyGIhaDWkKhY34lcirNlhHRCmAlZ5uVA
 yXdsEL1SuxdOzClSzMnP7dA6lJxONxXAQ0r07Ct0dqZWJ/chEnQJlBlGFQVOIbQgpHtI
 JzNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl98JzzGlLTW7qH+hnnK8sWKRsR1pl+QAqjmDHjasi5pojRI1+r2ffKeyYbOArV0H6S/nSiQhr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2vqQzbZJuc/+m7MG6whdGNmJaqJVWOmGaB8LSZduHrWffUnSd
 LuU+i9J2bbNeP6wJwsAnP7Xd3XY4wIVf4zLxHjQkywxacj0A+eIm12iZK3gHqgM=
X-Google-Smtp-Source: AGHT+IE/JyUY2849SdaTntRM722nrvqF2Ek0pKx7giJ2CxkVbfrvqDorwDiGkVI96IfoO0Q1OO0+jw==
X-Received: by 2002:a05:6000:104a:b0:37d:2de4:d64 with SMTP id
 ffacd0b85a97d-38061162c32mr28765698f8f.35.1730975884157; 
 Thu, 07 Nov 2024 02:38:04 -0800 (PST)
Received: from localhost ([89.101.134.25]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9707c8sm1359412f8f.17.2024.11.07.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 02:38:03 -0800 (PST)
Date: Thu, 7 Nov 2024 13:38:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, lyude@redhat.com,
 jani.nikula@intel.com, imre.deak@intel.com, simona@ffwll.ch,
 wayne.lin@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, harry.wentland@amd.com,
 rodrigo.siqueira@amd.com, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: Re: [PATCH v3 1/2] drm/display/dsc: Refactor DRM MST DSC
 Determination Policy
Message-ID: <a1720b79-e59f-4f69-a089-c03f3a6cbba9@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106150444.424579-2-Jerry.Zuo@amd.com>
X-Mailman-Approved-At: Thu, 07 Nov 2024 14:22:21 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Fangzhi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fangzhi-Zuo/drm-display-dsc-Refactor-DRM-MST-DSC-Determination-Policy/20241106-230854
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241106150444.424579-2-Jerry.Zuo%40amd.com
patch subject: [PATCH v3 1/2] drm/display/dsc: Refactor DRM MST DSC Determination Policy
config: i386-randconfig-141-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071102.0CMTIEIo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411071102.0CMTIEIo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:6043 drm_dp_mst_dsc_aux_for_port() warn: variable dereferenced before check 'port' (see line 6033)

vim +/port +6043 drivers/gpu/drm/display/drm_dp_mst_topology.c

c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6031  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6032  {
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06 @6033  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
                                                                                                                                      ^^^^^^^^^
Dereferenced

fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6034  	struct drm_dp_mst_port *immediate_upstream_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6035  	struct drm_dp_mst_port *fec_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6036  	struct drm_dp_mst_port *dsc_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6037  	struct drm_dp_aux *upstream_aux;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6038  	bool end_has_dpcd = (port->dpcd_rev > 0);
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6039  	u8 endpoint_dsc = 0;
70a6587dca37a3 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak     2024-09-09  6040  	u8 upstream_dsc;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6041  	u8 fec_cap;
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6042  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26 @6043  	if (!port)
                                                                                                    ^^^^^
Checked too late.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

