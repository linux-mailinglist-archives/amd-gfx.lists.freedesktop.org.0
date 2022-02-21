Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526934BDB1C
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Feb 2022 18:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65A110E6EB;
	Mon, 21 Feb 2022 17:13:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F10810E6A6;
 Mon, 21 Feb 2022 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645463618; x=1676999618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d9R1l+t6g3iE2bFfr1t2C1MAzM4hajXoz6i5aqnlTRA=;
 b=iKAGFcTJ8bYFNSZTzl0rL8mNVG6PPURYRzFpCh+rC34yXwof1xsVudvu
 9Z2H+374x3UZgiFz7WByUlk7Xech2kvZjSZde9IOpItzVayduztcKspvI
 pXTXxH0AUaNe1MbQqAnMy0Aa1aJeWoEq+ZQ/i4pFG0XnuGkh/itScN028
 E6BBfEom7KYRNaVTd9Fxg2Lt6uhr0xSuRa79l4tn9eFepFD8QfLGEQuoQ
 zNcXq8j+0r9834M6up9aglES9w1arPnSVakOAZ0PJB731uuH3yuw2kvLo
 LdFdQ6NQweeg/7cy99Xi3deQQ3U2lZMawaMpOUeBpxNctt87hiQcxRvqJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232164831"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="232164831"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 09:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="591024169"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2022 09:13:35 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMCFj-0001oS-0U; Mon, 21 Feb 2022 17:13:35 +0000
Date: Tue, 22 Feb 2022 01:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawei Gu <Jiawei.Gu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christian.Koenig@amd.com,
 Andrey.Grodzovsky@amd.com, Monk.Liu@amd.com, Emily.Deng@amd.com,
 Horace.Chen@amd.com
Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Message-ID: <202202220108.kzXHnO9I-lkp@intel.com>
References: <20220221095705.5290-1-Jiawei.Gu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095705.5290-1-Jiawei.Gu@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Jiawei Gu <Jiawei.Gu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Jiawei,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc5 next-20220217]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiawei-Gu/drm-sched-Add-device-pointer-to-drm_gpu_scheduler/20220221-175818
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20220222/202202220108.kzXHnO9I-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9fdafca855faca0a3b8f213f024985c4112fa0bb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiawei-Gu/drm-sched-Add-device-pointer-to-drm_gpu_scheduler/20220221-175818
        git checkout 9fdafca855faca0a3b8f213f024985c4112fa0bb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_ringbuffer.c:92:41: error: too few arguments to function call, expected 9, have 8
                           NULL, NULL, to_msm_bo(ring->bo)->name);
                                                                ^
   include/drm/gpu_scheduler.h:463:5: note: 'drm_sched_init' declared here
   int drm_sched_init(struct drm_gpu_scheduler *sched,
       ^
   1 error generated.


vim +92 drivers/gpu/drm/msm/msm_ringbuffer.c

1d8a5ca436ee4a Rob Clark     2021-07-27   47  
f97decac5f4c2d Jordan Crouse 2017-10-20   48  struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
f97decac5f4c2d Jordan Crouse 2017-10-20   49  		void *memptrs, uint64_t memptrs_iova)
7198e6b03155f6 Rob Clark     2013-07-19   50  {
7198e6b03155f6 Rob Clark     2013-07-19   51  	struct msm_ringbuffer *ring;
1d8a5ca436ee4a Rob Clark     2021-07-27   52  	long sched_timeout;
f97decac5f4c2d Jordan Crouse 2017-10-20   53  	char name[32];
7198e6b03155f6 Rob Clark     2013-07-19   54  	int ret;
7198e6b03155f6 Rob Clark     2013-07-19   55  
f97decac5f4c2d Jordan Crouse 2017-10-20   56  	/* We assume everwhere that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
f97decac5f4c2d Jordan Crouse 2017-10-20   57  	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
7198e6b03155f6 Rob Clark     2013-07-19   58  
7198e6b03155f6 Rob Clark     2013-07-19   59  	ring = kzalloc(sizeof(*ring), GFP_KERNEL);
7198e6b03155f6 Rob Clark     2013-07-19   60  	if (!ring) {
7198e6b03155f6 Rob Clark     2013-07-19   61  		ret = -ENOMEM;
7198e6b03155f6 Rob Clark     2013-07-19   62  		goto fail;
7198e6b03155f6 Rob Clark     2013-07-19   63  	}
7198e6b03155f6 Rob Clark     2013-07-19   64  
7198e6b03155f6 Rob Clark     2013-07-19   65  	ring->gpu = gpu;
f97decac5f4c2d Jordan Crouse 2017-10-20   66  	ring->id = id;
84c6127580c1ce Jordan Crouse 2018-11-07   67  
f97decac5f4c2d Jordan Crouse 2017-10-20   68  	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
604234f33658cd Jordan Crouse 2020-09-03   69  		check_apriv(gpu, MSM_BO_WC | MSM_BO_GPU_READONLY),
604234f33658cd Jordan Crouse 2020-09-03   70  		gpu->aspace, &ring->bo, &ring->iova);
8223286d62e296 Jordan Crouse 2017-07-27   71  
69a834c28fb514 Rob Clark     2016-05-24   72  	if (IS_ERR(ring->start)) {
69a834c28fb514 Rob Clark     2016-05-24   73  		ret = PTR_ERR(ring->start);
375f9a63a66bae Rob Clark     2021-07-27   74  		ring->start = NULL;
69a834c28fb514 Rob Clark     2016-05-24   75  		goto fail;
69a834c28fb514 Rob Clark     2016-05-24   76  	}
0815d7749a6852 Jordan Crouse 2018-11-07   77  
0815d7749a6852 Jordan Crouse 2018-11-07   78  	msm_gem_object_set_name(ring->bo, "ring%d", id);
0815d7749a6852 Jordan Crouse 2018-11-07   79  
f97decac5f4c2d Jordan Crouse 2017-10-20   80  	ring->end   = ring->start + (MSM_GPU_RINGBUFFER_SZ >> 2);
4c7085a5d581a5 Jordan Crouse 2017-10-20   81  	ring->next  = ring->start;
7198e6b03155f6 Rob Clark     2013-07-19   82  	ring->cur   = ring->start;
7198e6b03155f6 Rob Clark     2013-07-19   83  
f97decac5f4c2d Jordan Crouse 2017-10-20   84  	ring->memptrs = memptrs;
f97decac5f4c2d Jordan Crouse 2017-10-20   85  	ring->memptrs_iova = memptrs_iova;
f97decac5f4c2d Jordan Crouse 2017-10-20   86  
1d8a5ca436ee4a Rob Clark     2021-07-27   87  	 /* currently managing hangcheck ourselves: */
1d8a5ca436ee4a Rob Clark     2021-07-27   88  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
1d8a5ca436ee4a Rob Clark     2021-07-27   89  
1d8a5ca436ee4a Rob Clark     2021-07-27   90  	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
1d8a5ca436ee4a Rob Clark     2021-07-27   91  			num_hw_submissions, 0, sched_timeout,
f1b7996551a40a Dave Airlie   2021-07-30  @92  			NULL, NULL, to_msm_bo(ring->bo)->name);
1d8a5ca436ee4a Rob Clark     2021-07-27   93  	if (ret) {
1d8a5ca436ee4a Rob Clark     2021-07-27   94  		goto fail;
1d8a5ca436ee4a Rob Clark     2021-07-27   95  	}
1d8a5ca436ee4a Rob Clark     2021-07-27   96  
f97decac5f4c2d Jordan Crouse 2017-10-20   97  	INIT_LIST_HEAD(&ring->submits);
77d205290aa944 Rob Clark     2020-10-23   98  	spin_lock_init(&ring->submit_lock);
77c406038e830a Rob Clark     2020-10-23   99  	spin_lock_init(&ring->preempt_lock);
f97decac5f4c2d Jordan Crouse 2017-10-20  100  
f97decac5f4c2d Jordan Crouse 2017-10-20  101  	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
f97decac5f4c2d Jordan Crouse 2017-10-20  102  
da3d378dec8634 Rob Clark     2021-07-26  103  	ring->fctx = msm_fence_context_alloc(gpu->dev, &ring->memptrs->fence, name);
7198e6b03155f6 Rob Clark     2013-07-19  104  
7198e6b03155f6 Rob Clark     2013-07-19  105  	return ring;
7198e6b03155f6 Rob Clark     2013-07-19  106  
7198e6b03155f6 Rob Clark     2013-07-19  107  fail:
7198e6b03155f6 Rob Clark     2013-07-19  108  	msm_ringbuffer_destroy(ring);
7198e6b03155f6 Rob Clark     2013-07-19  109  	return ERR_PTR(ret);
7198e6b03155f6 Rob Clark     2013-07-19  110  }
7198e6b03155f6 Rob Clark     2013-07-19  111  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
