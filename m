Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1232CDE5
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Mar 2021 08:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362F6EA00;
	Thu,  4 Mar 2021 07:46:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ED36E9FE;
 Thu,  4 Mar 2021 07:46:29 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id mj10so27390729ejb.5;
 Wed, 03 Mar 2021 23:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=mw9FcVdR9rQzHHZj0vnCkJGH7I+pJ8JEfes/9h+ULVI=;
 b=BQZgca85d2XnSC7/nC4c+B3dWtNClTTkyQdWrUw7CbZgeaVBQfJWrc8dDV1MDv2+bI
 JLZ/VkG2oVRaKUql7WK5dN+IP2hST2h9QzfdDanBmKQtoQFsw620+JYe1D8fIXPVs24g
 yBvrGU99HVlwiFGrbLx3ocCZyoPC4RFXRGdsd3PAm0MyrZ4TzT9iv9HUKf3FqzvbDNIK
 0PgGaBqn3LdRmYvwzO8t3Vk9tcBk8l2HvAluDjcxjq63nrgQx4TdO1iIKC7j47R7nZhB
 quYORluFFRzwxLGMkR375QsZD8XD6oYY3NTXJp6WL0/PWgZm4m1MoosuXcm+Q8n/N81m
 TcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=mw9FcVdR9rQzHHZj0vnCkJGH7I+pJ8JEfes/9h+ULVI=;
 b=cOoEsZLqFpUwbKW6LQCQPndixiS9ED2dyPoARPwnPfNlzk1N7TN0r4ovQ/ucH5IquH
 HiwoSpJM/hH14+zvX+BhCVpzaVnuk3XpMqRTNr+ZC9P1QRtqK9XQcY3nsNL5FS/C/e6U
 DBWyxg/7rapZllYa4TFwyx70SsCNwLwo9Dx1a0Ox/q1L6x7eQARH/dAVmPa1rT0vwP1z
 cftA3TLZvsdPgM51oeDkNeeneyhprCz4CM062BJroNtFdxKmxqoaveg0XYbgCGVATg+F
 y2IVCX1ZLrFhW/AhmGzxYPlYYsD/pZm1vRO7TKpyz4KFa3mWh2CxHipNJlxiPVEz4YNe
 0LSQ==
X-Gm-Message-State: AOAM533stlrM7ee2HIYZWRoG7QRmrJoRenyzjXXwTYOq2oWCOAWNXr2u
 /783ut1cvQDxlPoSLUWTLOg=
X-Google-Smtp-Source: ABdhPJw2pewmjKhSqidGFD0NCAILMtXo141txBPvgiKRUumLZjYlz3Y+zhl+iWCBqmnBVPif3po5eA==
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr2896144ejb.39.1614843987964; 
 Wed, 03 Mar 2021 23:46:27 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:64f0:29b:e922:7ee4?
 ([2a02:908:1252:fb60:64f0:29b:e922:7ee4])
 by smtp.gmail.com with ESMTPSA id b18sm22676046ejb.77.2021.03.03.23.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 23:46:27 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
 <202103021104.NudsKKei-lkp@intel.com>
 <34b706ca-d15f-223f-e1a3-2ec071d578a2@gmail.com>
 <DM6PR12MB4732C8CF2FE2642A44B32C9C80999@DM6PR12MB4732.namprd12.prod.outlook.com>
 <c64ab60b-6541-6a78-d30e-9d2904debcd0@gmail.com>
 <DM6PR12MB4732BD6E9C9C1AE00CD1713380989@DM6PR12MB4732.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4fcb0d6d-3e44-c3b0-0c10-2b0a32932c8d@gmail.com>
Date: Thu, 4 Mar 2021 08:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB4732BD6E9C9C1AE00CD1713380989@DM6PR12MB4732.namprd12.prod.outlook.com>
Content-Language: en-US
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0045660521=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0045660521==
Content-Type: multipart/alternative;
 boundary="------------6D60D1BF07A71B2A655DF29E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6D60D1BF07A71B2A655DF29E
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oak,

as far as I know some architectures like PowerPC/ARM/MIPS need that. And 
we at least officially support PowerPC and ARM and MIPS is best effort 
and shouldn't break if possible.

Thomas just recently had a whole bunch of DMA-buf patches to also fix 
that up for DMA-bufs vmap as well, previously we have just been casting 
away the __iomem and hoped that it always works.

Regards,
Christian.

Am 03.03.21 um 21:59 schrieb Zeng, Oak:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Hi Christian,
>
> Can you explain why __iomem annotation is mandatory for amdgpu driver? 
> If this is the case, we can�t switch to memremap. The only fix seems 
> to me is add a #ifdef __x86_64__ to the ioremap_cache codes.
>
> Regards,
>
> Oak
>
> *From:* Christian K�nig <ckoenig.leichtzumerken@gmail.com>
> *Sent:* Wednesday, March 3, 2021 5:46 AM
> *To:* Zeng, Oak <Oak.Zeng@amd.com>; amd-gfx@lists.freedesktop.org; 
> dri-devel@lists.freedesktop.org; Daniel Vetter <daniel@ffwll.ch>; Dave 
> Airlie <airlied@redhat.com>; Thomas Hellstr�m (Intel) 
> <thomas_os@shipmail.org>; dan.j.williams@intel.com
> *Cc:* kbuild-all@lists.01.org; Kuehling, Felix 
> <Felix.Kuehling@amd.com>; Kasiviswanathan, Harish 
> <Harish.Kasiviswanathan@amd.com>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; Huang, JinHuiEric 
> <JinHuiEric.Huang@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> *Subject:* Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem 
> caching setting
>
> Hi Oak,
>
>
>     config: parisc-randconfig-r012-20210302 (attached as .config)
>
>
> It's not the Intel driver build which fails here, but the build bot is 
> just hosted by Intel.
>
> The problem is that the parisc architecture doesn't defines the 
> ioremap_cache() function.
>
> I've looked at using memremap() instead of ioremap_cache(). The 
> problem is that we do support architectures with the TTM as well as 
> amndgpu code where the __iomem annotation is mandatory and correct.
>
> Regards,
> Christian.
>
> Am 02.03.21 um 23:45 schrieb Zeng, Oak:
>
>     [AMD Official Use Only - Internal Distribution Only]
>
>     Hi Daniel, Thomas, Dan,
>
>     Does below message mean the calling ioremap_cache failed intel�s
>     driver build? I can see both ioremap_cache and ioremap_wc are
>     defined in arch/x86/mm/ioremap.c � why ioremap_wc doesn�t break
>     intel driver�s build?
>
>     Are we supposed to use memremap (offset, size, MEMREMAP_WB) to
>     replace ioremap_cache? When I read here
>     https://lwn.net/Articles/653585/
>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F653585%2F&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624296472%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=ljCFrIfrYbb%2FXmKKS2TJ7dSQ7oCRNWoUhWS4gEBv%2FW4%3D&reserved=0>
>     I felt that ioremap_cache returns an address annotated with _iomem
>     while memremap returns an address without __iomem annotation. In
>     our use case, GPU memory is treated as UEFI SPM (specific purpose
>     memory). I am not very sure whether memremap (thus no __iomem
>     annotation) is the right thing to do. What I am sure is, we have
>     tested ioremap_cache and it works fine on AMD system.
>
>     I will send out a test patch replacing ioremap_cache with
>     ioremap_wc, to trigger Intel build robot to see whether it fails
>     Intel build. I suppose it will not fail Intel build.
>
>     Regards,
>
>     Oak
>
>     *From:* Christian K�nig <ckoenig.leichtzumerken@gmail.com>
>     <mailto:ckoenig.leichtzumerken@gmail.com>
>     *Sent:* Tuesday, March 2, 2021 6:31 AM
>     *To:* amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>;
>     dri-devel@lists.freedesktop.org
>     <mailto:dri-devel@lists.freedesktop.org>; Daniel Vetter
>     <daniel@ffwll.ch> <mailto:daniel@ffwll.ch>; Dave Airlie
>     <airlied@redhat.com> <mailto:airlied@redhat.com>; Thomas Hellstr�m
>     (Intel) <thomas_os@shipmail.org> <mailto:thomas_os@shipmail.org>
>     *Cc:* Zeng, Oak <Oak.Zeng@amd.com> <mailto:Oak.Zeng@amd.com>;
>     kbuild-all@lists.01.org <mailto:kbuild-all@lists.01.org>;
>     Kuehling, Felix <Felix.Kuehling@amd.com>
>     <mailto:Felix.Kuehling@amd.com>; Kasiviswanathan, Harish
>     <Harish.Kasiviswanathan@amd.com>
>     <mailto:Harish.Kasiviswanathan@amd.com>; Deucher, Alexander
>     <Alexander.Deucher@amd.com> <mailto:Alexander.Deucher@amd.com>;
>     Huang, JinHuiEric <JinHuiEric.Huang@amd.com>
>     <mailto:JinHuiEric.Huang@amd.com>; Koenig, Christian
>     <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>
>     *Subject:* Re: [PATCH] drm/ttm: ioremap buffer according to TTM
>     mem caching setting
>
>     Hi guys,
>
>     adding the usual suspects direct. Does anybody of hand know how to
>     check if an architecture supports ioremap_cache()?
>
>     For now we only need this on X86, but I would feel better if we
>     don't use an #ifdef here.
>
>     Regards,
>     Christian.
>
>     Am 02.03.21 um 05:12 schrieb kernel test robot:
>
>         Hi Oak,
>
>           
>
>         Thank you for the patch! Yet something to improve:
>
>           
>
>         [auto build test ERROR on drm-intel/for-linux-next]
>
>         [also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc1 next-20210302]
>
>         [cannot apply to tegra-drm/drm/tegra/for-next drm-exynos/exynos-drm-next drm/drm-next]
>
>         [If your patch is applied to the wrong git tree, kindly drop us a note.
>
>         And when submitting patch, we suggest to use '--base' as documented in
>
>         https://git-scm.com/docs/git-format-patch  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624306464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3f5ib%2FlZ6DXXF%2Bk1rXPKGu1IkOhXHdkUmX3obtuIRtA%3D&reserved=0>]
>
>           
>
>         url:https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FOak-Zeng%2Fdrm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting%2F20210302-064500&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624306464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=Y9h9ZHM7d2Sqo3XQWr%2Frpb2DAk9SkHFIm5nD4ABFNbE%3D&reserved=0>
>
>         base:�� git://anongit.freedesktop.org/drm-intel for-linux-next
>
>         config: parisc-randconfig-r012-20210302 (attached as .config)
>
>         compiler: hppa-linux-gcc (GCC) 9.3.0
>
>         reproduce (this is a W=1 build):
>
>          ������� wgethttps://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624316464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=wGo3Nwk4mWZjb2W3E7qKf3FtKzLOxCVmQu1zd2rmzRU%3D&reserved=0>  -O ~/bin/make.cross
>
>          ������� chmod +x ~/bin/make.cross
>
>          ������� #https://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5af8e62d34ea60a64  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F225bb3711439ec559dd72ae5af8e62d34ea60a64&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624316464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=kOz18UAawmA4SZ6IrCGRt4HISfsmmjfGN2TUgAtm0Ak%3D&reserved=0>
>
>          ������� git remote add linux-reviewhttps://github.com/0day-ci/linux  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624326458%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=QnKs47gjzAz%2Fjv%2FAO6H%2BwYNQF6mdk1D8dCNveW0YHuM%3D&reserved=0>
>
>          ������� git fetch --no-tags linux-review Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500
>
>          ������� git checkout 225bb3711439ec559dd72ae5af8e62d34ea60a64
>
>          ������� # save the attached .config to linux build tree
>
>          ������� COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc
>
>           
>
>         If you fix the issue, kindly add following tag as appropriate
>
>         Reported-by: kernel test robot<lkp@intel.com>  <mailto:lkp@intel.com>
>
>           
>
>         All errors (new ones prefixed by >>):
>
>           
>
>          �� drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_resource_ioremap':
>
>                 drivers/gpu/drm/ttm/ttm_bo_util.c:95:11: error: implicit declaration of function 'ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=implicit-function-declaration]
>
>          ����� 95 |��� addr = ioremap_cache(mem->bus.offset, bus_size);
>
>          �������� |���������� ^~~~~~~~~~~~~
>
>          �������� |���������� ioremap_uc
>
>          �� drivers/gpu/drm/ttm/ttm_bo_util.c:95:9: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>
>          ����� 95 |��� addr = ioremap_cache(mem->bus.offset, bus_size);
>
>          �������� |�������� ^
>
>          �� drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_ioremap':
>
>          �� drivers/gpu/drm/ttm/ttm_bo_util.c:379:17: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>
>          ���� 379 |��� map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
>
>          �������� |���������������� ^
>
>          �� drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vmap':
>
>          �� drivers/gpu/drm/ttm/ttm_bo_util.c:500:16: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>
>          ���� 500 |��� vaddr_iomem = ioremap_cache(mem->bus.offset,
>
>          �������� |��������������� ^
>
>          �� cc1: some warnings being treated as errors
>
>           
>
>           
>
>         vim +95 drivers/gpu/drm/ttm/ttm_bo_util.c
>
>           
>
>          ��� 74
>
>          ��� 75� static int ttm_resource_ioremap(struct ttm_bo_device *bdev,
>
>          ��� 76������������������������ ������ struct ttm_resource *mem,
>
>          ��� 77������������������������ ������ void **virtual)
>
>          ��� 78� {
>
>          ��� 79��������� int ret;
>
>          ��� 80��������� void *addr;
>
>          ��� 81
>
>          ��� 82��������� *virtual = NULL;
>
>          ��� 83��������� ret = ttm_mem_io_reserve(bdev, mem);
>
>          ��� 84��������� if (ret || !mem->bus.is_iomem)
>
>          ��� 85����������������� return ret;
>
>          ��� 86
>
>          ��� 87��������� if (mem->bus.addr) {
>
>          ��� 88����������������� addr = mem->bus.addr;
>
>          ��� 89��������� } else {
>
>          ��� 90����������������� size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
>
>          ��� 91
>
>          ��� 92����������������� if (mem->bus.caching == ttm_write_combined)
>
>          ��� 93������������������������ addr = ioremap_wc(mem->bus.offset, bus_size);
>
>          ��� 94����������������� else if (mem->bus.caching == ttm_cached)
>
>          � > 95������������������������ addr = ioremap_cache(mem->bus.offset, bus_size);
>
>          ��� 96����������������� else
>
>          ��� 97������������������������ addr = ioremap(mem->bus.offset, bus_size);
>
>          ��� 98����������������� if (!addr) {
>
>          ��� 99������������������������ ttm_mem_io_free(bdev, mem);
>
>          �� 100������������������������ return -ENOMEM;
>
>          �� 101����������������� }
>
>          �� 102��������� }
>
>          �� 103��������� *virtual = addr;
>
>          �� 104��������� return 0;
>
>          �� 105� }
>
>          �� 106
>
>           
>
>         ---
>
>         0-DAY CI Kernel Test Service, Intel Corporation
>
>         https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624326458%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=MY6tEGVY0X4VyS750dYmsfVoR71Zp78YdxuqqRljnsI%3D&reserved=0>
>
>
>
>
>         _______________________________________________
>
>         amd-gfx mailing list
>
>         amd-gfx@lists.freedesktop.org  <mailto:amd-gfx@lists.freedesktop.org>
>
>         https://lists.freedesktop.org/mailman/listinfo/amd-gfx  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624336455%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=Or3tWmS5M6mXOaFP4FHsEbg0rqoizNGpTl6JEkD6fac%3D&reserved=0>
>


--------------6D60D1BF07A71B2A655DF29E
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    Hi Oak,<br>
    <br>
    as far as I know some architectures like PowerPC/ARM/MIPS need that.
    And we at least officially support PowerPC and ARM and MIPS is best
    effort and shouldn't break if possible.<br>
    <br>
    Thomas just recently had a whole bunch of DMA-buf patches to also
    fix that up for DMA-bufs vmap as well, previously we have just been
    casting away the __iomem and hoped that it always works.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 03.03.21 um 21:59 schrieb Zeng, Oak:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM6PR12MB4732BD6E9C9C1AE00CD1713380989@DM6PR12MB4732.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <p
        style="font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;"
        align="Left">
        [AMD Official Use Only - Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div class="WordSection1">
          <p class="MsoNormal">Hi Christian,<o:p></o:p></p>
          <p class="MsoNormal"><o:p>�</o:p></p>
          <p class="MsoNormal">Can you explain why __iomem annotation is
            mandatory for amdgpu driver? If this is the case, we can�t
            switch to memremap. The only fix seems to me is add a #ifdef
            __x86_64__ to the ioremap_cache codes.<o:p></o:p></p>
          <p class="MsoNormal"><o:p>�</o:p></p>
          <div>
            <p class="MsoNormal">Regards,<o:p></o:p></p>
            <p class="MsoNormal">Oak<o:p></o:p></p>
          </div>
          <p class="MsoNormal"><o:p>�</o:p></p>
          <div style="border:none;border-left:solid blue
            1.5pt;padding:0in 0in 0in 4.0pt">
            <div>
              <div style="border:none;border-top:solid #E1E1E1
                1.0pt;padding:3.0pt 0in 0in 0in">
                <p class="MsoNormal"><b>From:</b> Christian K�nig
                  <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>
                  <br>
                  <b>Sent:</b> Wednesday, March 3, 2021 5:46 AM<br>
                  <b>To:</b> Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:Oak.Zeng@amd.com">&lt;Oak.Zeng@amd.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; Daniel Vetter
                  <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Dave Airlie
                  <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Thomas Hellstr�m (Intel)
                  <a class="moz-txt-link-rfc2396E" href="mailto:thomas_os@shipmail.org">&lt;thomas_os@shipmail.org&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:dan.j.williams@intel.com">dan.j.williams@intel.com</a><br>
                  <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:kbuild-all@lists.01.org">kbuild-all@lists.01.org</a>; Kuehling, Felix
                  <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>; Kasiviswanathan,
                  Harish <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Kasiviswanathan@amd.com">&lt;Harish.Kasiviswanathan@amd.com&gt;</a>;
                  Deucher, Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>;
                  Huang, JinHuiEric <a class="moz-txt-link-rfc2396E" href="mailto:JinHuiEric.Huang@amd.com">&lt;JinHuiEric.Huang@amd.com&gt;</a>;
                  Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH] drm/ttm: ioremap buffer
                  according to TTM mem caching setting<o:p></o:p></p>
              </div>
            </div>
            <p class="MsoNormal"><o:p>�</o:p></p>
            <p class="MsoNormal">Hi Oak,<br>
              <br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>config: parisc-randconfig-r012-20210302 (attached as .config)<o:p></o:p></pre>
            </blockquote>
            <p class="MsoNormal" style="margin-bottom:12.0pt"><br>
              It's not the Intel driver build which fails here, but the
              build bot is just hosted by Intel.<br>
              <br>
              The problem is that the parisc architecture doesn't
              defines the ioremap_cache() function.<br>
              <br>
              I've looked at using memremap() instead of
              ioremap_cache(). The problem is that we do support
              architectures with the TTM as well as amndgpu code where
              the __iomem annotation is mandatory and correct.<br>
              <br>
              Regards,<br>
              Christian.<o:p></o:p></p>
            <div>
              <p class="MsoNormal">Am 02.03.21 um 23:45 schrieb Zeng,
                Oak:<o:p></o:p></p>
            </div>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <p style="margin:5.0pt"><span
                  style="font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
                  Official Use Only - Internal Distribution Only]<o:p></o:p></span></p>
              <p class="MsoNormal"><o:p>�</o:p></p>
              <div>
                <p class="MsoNormal">Hi Daniel, Thomas, Dan,<o:p></o:p></p>
                <p class="MsoNormal">�<o:p></o:p></p>
                <p class="MsoNormal">Does below message mean the calling
                  ioremap_cache failed intel�s driver build? I can see
                  both ioremap_cache and ioremap_wc are defined in
                  arch/x86/mm/ioremap.c � why ioremap_wc doesn�t break
                  intel driver�s build?<o:p></o:p></p>
                <p class="MsoNormal">�<o:p></o:p></p>
                <p class="MsoNormal">Are we supposed to use memremap
                  (offset, size, MEMREMAP_WB) to replace ioremap_cache?
                  When I read here
                  <a
href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F653585%2F&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624296472%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ljCFrIfrYbb%2FXmKKS2TJ7dSQ7oCRNWoUhWS4gEBv%2FW4%3D&amp;reserved=0"
                    moz-do-not-send="true">
                    https://lwn.net/Articles/653585/</a> I felt that
                  ioremap_cache returns an address annotated with _iomem
                  while memremap returns an address without __iomem
                  annotation. In our use case, GPU memory is treated as
                  UEFI SPM (specific purpose memory). I am not very sure
                  whether memremap (thus no __iomem annotation) is the
                  right thing to do. What I am sure is, we have tested
                  ioremap_cache and it works fine on AMD system.<o:p></o:p></p>
                <p class="MsoNormal">�<o:p></o:p></p>
                <p class="MsoNormal">I will send out a test patch
                  replacing ioremap_cache with ioremap_wc, to trigger
                  Intel build robot to see whether it fails Intel build.
                  I suppose it will not fail Intel build.<o:p></o:p></p>
                <p class="MsoNormal">�<o:p></o:p></p>
                <div>
                  <p class="MsoNormal">Regards,<o:p></o:p></p>
                  <p class="MsoNormal">Oak<o:p></o:p></p>
                </div>
                <p class="MsoNormal">�<o:p></o:p></p>
                <div style="border:none;border-left:solid blue
                  1.5pt;padding:0in 0in 0in 4.0pt">
                  <div>
                    <div style="border:none;border-top:solid #E1E1E1
                      1.0pt;padding:3.0pt 0in 0in 0in">
                      <p class="MsoNormal"><b>From:</b> Christian K�nig
                        <a
                          href="mailto:ckoenig.leichtzumerken@gmail.com"
                          moz-do-not-send="true">
                          &lt;ckoenig.leichtzumerken@gmail.com&gt;</a> <br>
                        <b>Sent:</b> Tuesday, March 2, 2021 6:31 AM<br>
                        <b>To:</b> <a
                          href="mailto:amd-gfx@lists.freedesktop.org"
                          moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                        <a href="mailto:dri-devel@lists.freedesktop.org"
                          moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>;
                        Daniel Vetter
                        <a href="mailto:daniel@ffwll.ch"
                          moz-do-not-send="true">&lt;daniel@ffwll.ch&gt;</a>;
                        Dave Airlie <a href="mailto:airlied@redhat.com"
                          moz-do-not-send="true">
                          &lt;airlied@redhat.com&gt;</a>; Thomas
                        Hellstr�m (Intel) <a
                          href="mailto:thomas_os@shipmail.org"
                          moz-do-not-send="true">
                          &lt;thomas_os@shipmail.org&gt;</a><br>
                        <b>Cc:</b> Zeng, Oak <a
                          href="mailto:Oak.Zeng@amd.com"
                          moz-do-not-send="true">&lt;Oak.Zeng@amd.com&gt;</a>;
                        <a href="mailto:kbuild-all@lists.01.org"
                          moz-do-not-send="true">
                          kbuild-all@lists.01.org</a>; Kuehling, Felix <a
                          href="mailto:Felix.Kuehling@amd.com"
                          moz-do-not-send="true">
                          &lt;Felix.Kuehling@amd.com&gt;</a>;
                        Kasiviswanathan, Harish <a
                          href="mailto:Harish.Kasiviswanathan@amd.com"
                          moz-do-not-send="true">
                          &lt;Harish.Kasiviswanathan@amd.com&gt;</a>;
                        Deucher, Alexander <a
                          href="mailto:Alexander.Deucher@amd.com"
                          moz-do-not-send="true">
                          &lt;Alexander.Deucher@amd.com&gt;</a>; Huang,
                        JinHuiEric <a
                          href="mailto:JinHuiEric.Huang@amd.com"
                          moz-do-not-send="true">
                          &lt;JinHuiEric.Huang@amd.com&gt;</a>; Koenig,
                        Christian <a
                          href="mailto:Christian.Koenig@amd.com"
                          moz-do-not-send="true">
                          &lt;Christian.Koenig@amd.com&gt;</a><br>
                        <b>Subject:</b> Re: [PATCH] drm/ttm: ioremap
                        buffer according to TTM mem caching setting<o:p></o:p></p>
                    </div>
                  </div>
                  <p class="MsoNormal">�<o:p></o:p></p>
                  <p class="MsoNormal" style="margin-bottom:12.0pt">Hi
                    guys,<br>
                    <br>
                    adding the usual suspects direct. Does anybody of
                    hand know how to check if an architecture supports
                    ioremap_cache()?<br>
                    <br>
                    For now we only need this on X86, but I would feel
                    better if we don't use an #ifdef here.<br>
                    <br>
                    Regards,<br>
                    Christian.<o:p></o:p></p>
                  <div>
                    <p class="MsoNormal">Am 02.03.21 um 05:12 schrieb
                      kernel test robot:<o:p></o:p></p>
                  </div>
                  <blockquote
                    style="margin-top:5.0pt;margin-bottom:5.0pt">
                    <pre>Hi Oak,<o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>Thank you for the patch! Yet something to improve:<o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>[auto build test ERROR on drm-intel/for-linux-next]<o:p></o:p></pre>
                    <pre>[also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc1 next-20210302]<o:p></o:p></pre>
                    <pre>[cannot apply to tegra-drm/drm/tegra/for-next drm-exynos/exynos-drm-next drm/drm-next]<o:p></o:p></pre>
                    <pre>[If your patch is applied to the wrong git tree, kindly drop us a note.<o:p></o:p></pre>
                    <pre>And when submitting patch, we suggest to use '--base' as documented in<o:p></o:p></pre>
                    <pre><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624306464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3f5ib%2FlZ6DXXF%2Bk1rXPKGu1IkOhXHdkUmX3obtuIRtA%3D&amp;reserved=0" moz-do-not-send="true">https://git-scm.com/docs/git-format-patch</a>]<o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>url:��� <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FOak-Zeng%2Fdrm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting%2F20210302-064500&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624306464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Y9h9ZHM7d2Sqo3XQWr%2Frpb2DAk9SkHFIm5nD4ABFNbE%3D&amp;reserved=0" moz-do-not-send="true">https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500</a><o:p></o:p></pre>
                    <pre>base:�� git://anongit.freedesktop.org/drm-intel for-linux-next<o:p></o:p></pre>
                    <pre>config: parisc-randconfig-r012-20210302 (attached as .config)<o:p></o:p></pre>
                    <pre>compiler: hppa-linux-gcc (GCC) 9.3.0<o:p></o:p></pre>
                    <pre>reproduce (this is a W=1 build):<o:p></o:p></pre>
                    <pre>������� wget <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624316464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=wGo3Nwk4mWZjb2W3E7qKf3FtKzLOxCVmQu1zd2rmzRU%3D&amp;reserved=0" moz-do-not-send="true">https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross</a> -O ~/bin/make.cross<o:p></o:p></pre>
                    <pre>������� chmod +x ~/bin/make.cross<o:p></o:p></pre>
                    <pre>������� # <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F225bb3711439ec559dd72ae5af8e62d34ea60a64&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624316464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kOz18UAawmA4SZ6IrCGRt4HISfsmmjfGN2TUgAtm0Ak%3D&amp;reserved=0" moz-do-not-send="true">https://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5af8e62d34ea60a64</a><o:p></o:p></pre>
                    <pre>������� git remote add linux-review <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624326458%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QnKs47gjzAz%2Fjv%2FAO6H%2BwYNQF6mdk1D8dCNveW0YHuM%3D&amp;reserved=0" moz-do-not-send="true">https://github.com/0day-ci/linux</a><o:p></o:p></pre>
                    <pre>������� git fetch --no-tags linux-review Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500<o:p></o:p></pre>
                    <pre>������� git checkout 225bb3711439ec559dd72ae5af8e62d34ea60a64<o:p></o:p></pre>
                    <pre>������� # save the attached .config to linux build tree<o:p></o:p></pre>
                    <pre>������� COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc <o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>If you fix the issue, kindly add following tag as appropriate<o:p></o:p></pre>
                    <pre>Reported-by: kernel test robot <a href="mailto:lkp@intel.com" moz-do-not-send="true">&lt;lkp@intel.com&gt;</a><o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>All errors (new ones prefixed by &gt;&gt;):<o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>�� drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_resource_ioremap':<o:p></o:p></pre>
                    <blockquote
                      style="margin-top:5.0pt;margin-bottom:5.0pt">
                      <blockquote
                        style="margin-top:5.0pt;margin-bottom:5.0pt">
                        <pre>drivers/gpu/drm/ttm/ttm_bo_util.c:95:11: error: implicit declaration of function 'ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=implicit-function-declaration]<o:p></o:p></pre>
                      </blockquote>
                    </blockquote>
                    <pre>����� 95 |��� addr = ioremap_cache(mem-&gt;bus.offset, bus_size);<o:p></o:p></pre>
                    <pre>�������� |���������� ^~~~~~~~~~~~~<o:p></o:p></pre>
                    <pre>�������� |���������� ioremap_uc<o:p></o:p></pre>
                    <pre>�� drivers/gpu/drm/ttm/ttm_bo_util.c:95:9: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]<o:p></o:p></pre>
                    <pre>����� 95 |��� addr = ioremap_cache(mem-&gt;bus.offset, bus_size);<o:p></o:p></pre>
                    <pre>�������� |�������� ^<o:p></o:p></pre>
                    <pre>�� drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_ioremap':<o:p></o:p></pre>
                    <pre>�� drivers/gpu/drm/ttm/ttm_bo_util.c:379:17: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]<o:p></o:p></pre>
                    <pre>���� 379 |��� map-&gt;virtual = ioremap_cache(bo-&gt;mem.bus.offset + offset,<o:p></o:p></pre>
                    <pre>�������� |���������������� ^<o:p></o:p></pre>
                    <pre>�� drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vmap':<o:p></o:p></pre>
                    <pre>�� drivers/gpu/drm/ttm/ttm_bo_util.c:500:16: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]<o:p></o:p></pre>
                    <pre>���� 500 |��� vaddr_iomem = ioremap_cache(mem-&gt;bus.offset,<o:p></o:p></pre>
                    <pre>�������� |��������������� ^<o:p></o:p></pre>
                    <pre>�� cc1: some warnings being treated as errors<o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>vim +95 drivers/gpu/drm/ttm/ttm_bo_util.c<o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>��� 74� <o:p></o:p></pre>
                    <pre>��� 75� static int ttm_resource_ioremap(struct ttm_bo_device *bdev,<o:p></o:p></pre>
                    <pre>��� 76������������������������ ������ struct ttm_resource *mem,<o:p></o:p></pre>
                    <pre>��� 77������������������������ ������ void **virtual)<o:p></o:p></pre>
                    <pre>��� 78� {<o:p></o:p></pre>
                    <pre>��� 79��������� int ret;<o:p></o:p></pre>
                    <pre>��� 80��������� void *addr;<o:p></o:p></pre>
                    <pre>��� 81� <o:p></o:p></pre>
                    <pre>��� 82��������� *virtual = NULL;<o:p></o:p></pre>
                    <pre>��� 83��������� ret = ttm_mem_io_reserve(bdev, mem);<o:p></o:p></pre>
                    <pre>��� 84��������� if (ret || !mem-&gt;bus.is_iomem)<o:p></o:p></pre>
                    <pre>��� 85����������������� return ret;<o:p></o:p></pre>
                    <pre>��� 86� <o:p></o:p></pre>
                    <pre>��� 87��������� if (mem-&gt;bus.addr) {<o:p></o:p></pre>
                    <pre>��� 88����������������� addr = mem-&gt;bus.addr;<o:p></o:p></pre>
                    <pre>��� 89��������� } else {<o:p></o:p></pre>
                    <pre>��� 90����������������� size_t bus_size = (size_t)mem-&gt;num_pages &lt;&lt; PAGE_SHIFT;<o:p></o:p></pre>
                    <pre>��� 91� <o:p></o:p></pre>
                    <pre>��� 92����������������� if (mem-&gt;bus.caching == ttm_write_combined)<o:p></o:p></pre>
                    <pre>��� 93������������������������ addr = ioremap_wc(mem-&gt;bus.offset, bus_size);<o:p></o:p></pre>
                    <pre>��� 94����������������� else if (mem-&gt;bus.caching == ttm_cached)<o:p></o:p></pre>
                    <pre>� &gt; 95������������������������ addr = ioremap_cache(mem-&gt;bus.offset, bus_size);<o:p></o:p></pre>
                    <pre>��� 96����������������� else<o:p></o:p></pre>
                    <pre>��� 97������������������������ addr = ioremap(mem-&gt;bus.offset, bus_size);<o:p></o:p></pre>
                    <pre>��� 98����������������� if (!addr) {<o:p></o:p></pre>
                    <pre>��� 99������������������������ ttm_mem_io_free(bdev, mem);<o:p></o:p></pre>
                    <pre>�� 100������������������������ return -ENOMEM;<o:p></o:p></pre>
                    <pre>�� 101����������������� }<o:p></o:p></pre>
                    <pre>�� 102��������� }<o:p></o:p></pre>
                    <pre>�� 103��������� *virtual = addr;<o:p></o:p></pre>
                    <pre>�� 104��������� return 0;<o:p></o:p></pre>
                    <pre>�� 105� }<o:p></o:p></pre>
                    <pre>�� 106� <o:p></o:p></pre>
                    <pre>�<o:p></o:p></pre>
                    <pre>---<o:p></o:p></pre>
                    <pre>0-DAY CI Kernel Test Service, Intel Corporation<o:p></o:p></pre>
                    <pre><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624326458%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=MY6tEGVY0X4VyS750dYmsfVoR71Zp78YdxuqqRljnsI%3D&amp;reserved=0" moz-do-not-send="true">https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org</a><o:p></o:p></pre>
                    <p class="MsoNormal"><br>
                      <br>
                      <br>
                      <o:p></o:p></p>
                    <pre>_______________________________________________<o:p></o:p></pre>
                    <pre>amd-gfx mailing list<o:p></o:p></pre>
                    <pre><a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><o:p></o:p></pre>
                    <pre><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624336455%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Or3tWmS5M6mXOaFP4FHsEbg0rqoizNGpTl6JEkD6fac%3D&amp;reserved=0" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></pre>
                  </blockquote>
                  <p class="MsoNormal">�<o:p></o:p></p>
                </div>
              </div>
            </blockquote>
            <p class="MsoNormal"><o:p>�</o:p></p>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------6D60D1BF07A71B2A655DF29E--

--===============0045660521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0045660521==--
