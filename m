Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED897AF15F
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Sep 2023 18:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9061110E229;
	Tue, 26 Sep 2023 16:55:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E4610E101;
 Tue, 26 Sep 2023 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695747146; x=1727283146;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=JtwXZBfCANqoHC0STBQiKuC44epDLfMf+Y7x5BnA8kQ=;
 b=W0zrflzzHB6qaAU64P1PtkBDtpvIetUiiRzYpx7ee1KoVVRcVUyJNEkM
 8aWbC1Sd1Ovo3gP7Cs1VlTg7wPtIL6kI7/Kp5i8EUoSA3cKihcXpXXsHB
 pClnHPwnSSFvHgI17t1gGqN/oBHSVNtJ7P+0u1EO9YD+SjVmCAY0k5xos
 QGcAsC3vm0YQ7XdcdIOTsf+cPixcgiRJOhL4tT1K+HS6ZxzOfil0Fn0jJ
 wZQgxf8mxnUigiLRGnIPFuh0/gFxtW/InkJpm7Gu8tw3ZqMmScpkTTkv2
 lcyi7icjAlnwT344DaCsaQNRG4OAqPM1eQ3TZQvQaEykjakMWXuw3j2i5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378893530"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378893530"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778196364"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="778196364"
Received: from hhalmen-mobl.ger.corp.intel.com ([10.251.219.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:52:21 -0700
Date: Tue, 26 Sep 2023 19:52:18 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 03/15] platform/x86/amd/pmf: Change signature of
 amd_pmf_set_dram_addr
In-Reply-To: <20230922175056.244940-4-Shyam-sundar.S-k@amd.com>
Message-ID: <3b914165-ea96-b180-3fca-86b196e3638@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-4-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Tue, 26 Sep 2023 16:55:48 +0000
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, hdegoede@redhat.com, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, daniel@ffwll.ch, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, airlied@gmail.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

Add () to the function name in the shortlog. "Change signature" is quite 
vague, perhaps you could come up something more descriptive.

> Make amd_pmf_set_dram_addr() as non-static so that same function
> can be used across files.

This says nothing about the move of allocation.

> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 14 ++++++++------
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 68f1389dda3e..5fb03ed614ff 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -251,26 +251,28 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> -static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>  {
>  	u64 phys_addr;
>  	u32 hi, low;
>  
> +	/* Get Metrics Table Address */
> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +	if (!dev->buf)
> +		return -ENOMEM;
> +
>  	phys_addr = virt_to_phys(dev->buf);
>  	hi = phys_addr >> 32;
>  	low = phys_addr & GENMASK(31, 0);
>  
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> +
> +	return 0;
>  }
>  
>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  {
> -	/* Get Metrics Table Address */
> -	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> -	if (!dev->buf)
> -		return -ENOMEM;
> -
>  	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>  
>  	amd_pmf_set_dram_addr(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a9333ff6c0a7..ea15ce547d24 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>  int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> 

Why are not amd_pmf_set_dram_addr() callers made to handle/pass on 
errors???

-- 
 i.

