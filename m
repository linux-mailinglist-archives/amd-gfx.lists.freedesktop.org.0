Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJfMAOSzgGl3AgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 02 Feb 2026 15:25:40 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79548CD500
	for <lists+amd-gfx@lfdr.de>; Mon, 02 Feb 2026 15:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BCA10E27E;
	Mon,  2 Feb 2026 14:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JDXIlJxa";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F75410E27E
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Feb 2026 14:25:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4445E441E5;
 Mon,  2 Feb 2026 14:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE28DC116C6;
 Mon,  2 Feb 2026 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770042336;
 bh=MfLhM5e97Nipl4AuIOyTgqniVaWOPQgKJJgli6NMNCo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JDXIlJxalYQDWocevJIuWbRY0YNX+owQ2GEsU2DgXG/UZbzgujNWfsPDRQOpzyfLL
 ZEvvetqwZ+wqMPFeMmDpfkzhtOShAf+rQ2ETWW+NHZzixfC/y8fsIKwueH32Tewey5
 vl3W1Ir56S45h/qSLEu1QGsV9IIYyFoGVQENWRw0VdIU/KMa748ksbLCAuW90AGedx
 kd0D66jWDtmenDyhW1zHABaePvfsqZ2Bqkbsl+NEZycE4TwSbls7z7F5w7FwEPJZpN
 AxEWma99f4Dok+Q280RPCfMOe0PJgPhNJhrK+3VGZzsswTdLEDXeUMs2Y7iRMIL+xT
 KDXFzHPDK3TiA==
Message-ID: <02fe7f9e-f25b-4b6b-8420-57de982147bd@kernel.org>
Date: Mon, 2 Feb 2026 08:25:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd: Check if ASPM is enabled from PCIe
 subsystem"
To: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260201002446.1293486-1-spasswolf@web.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260201002446.1293486-1-spasswolf@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:spasswolf@web.de,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[web.de,vger.kernel.org];
	FORGED_SENDER(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 79548CD500
X-Rspamd-Action: no action

On 1/31/26 6:24 PM, Bert Karwatzki wrote:
> This reverts commit 7294863a6f01248d72b61d38478978d638641bee.
> 
> This commit was erroneously applied again after commit 0ab5d711ec74
> ("drm/amd: Refactor `amdgpu_aspm` to be evaluated per device")
> removed it, leading to very hard to debug crashes, when used with a system with two
> AMD GPUs of which only one supports ASPM.
> 
> Link: https://lore.kernel.org/linux-acpi/20251006120944.7880-1-spasswolf@web.de/
> Link: https://github.com/acpica/acpica/issues/1060
> Fixes: 0ab5d711ec74 ("drm/amd: Refactor `amdgpu_aspm` to be evaluated per device")
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---

Amazing detective work, thanks so much.

This added the code initially:
cba07cce39ace drm/amd: Check if ASPM is enabled from PCIe subsystem

This effectively removed it:
0ab5d711ec74d drm/amd: Refactor `amdgpu_aspm` to be evaluated per device

This was the accidental re-apply:
7294863a6f012 drm/amd: Check if ASPM is enabled from PCIe subsystem

It looks like this as right on the edge of the 5.17-rc6 and 5.18-rc1.
I think drm-fixes-2022-02-25 and amd-drm-next-5.18-2022-02-25 ended up 
with different content.

Nonethless this is the correct change and I've applied it to 
amd-staging-drm-next.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index d6d0a6e34c6b..95d26f086d54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2405,9 +2405,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>   			return -ENODEV;
>   	}
>   
> -	if (amdgpu_aspm == -1 && !pcie_aspm_enabled(pdev))
> -		amdgpu_aspm = 0;
> -
>   	if (amdgpu_virtual_display ||
>   	    amdgpu_device_asic_has_dc_support(pdev, flags & AMD_ASIC_MASK))
>   		supports_atomic = true;

