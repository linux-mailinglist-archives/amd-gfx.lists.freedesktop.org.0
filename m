Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACC72890A
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Jun 2023 21:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16E310E33F;
	Thu,  8 Jun 2023 19:52:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364AB10E33F
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Jun 2023 19:52:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8206F60FB6;
 Thu,  8 Jun 2023 19:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A67C433D2;
 Thu,  8 Jun 2023 19:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686253963;
 bh=VJNbfl7ur9asyNZBqTr7SnXNe0VdqWbZjoHtSp9mbDM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KxAxzHcyP9KgJs1oCW2E0PJKveamozbtzTq0toPwxSwPMJZsVS6+BlnbrrvG5eASB
 ad8kQD2WITB/hrP+6UqfI2bKHDpC0M2spiobAkjoKF9jwdyBSQC9DC+ipJzILHppso
 2qdIWzE0RgVkqrSigmvJepxOYv1udyQOD7DN6eBeDyDyRZsUleoeSDawglAzQEQFIa
 l6eryb+mxYAt97ETvmWLsssm0E3KYMSeLCaBuE7w4MIXGXWG7BGOmLmpDMuBCCIb+b
 64AzN0Y5bUNPRNnwuAdDgqLj1vMrR8hqvI6xOiROhNItZPE7n3t9awhk0hb1QdptZf
 M54fBkYtoN02g==
Date: Thu, 8 Jun 2023 14:52:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shiwu Zhang <shiwu.zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: add the accelerator pcie class
Message-ID: <20230608195242.GA1211647@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523040232.21756-1-shiwu.zhang@amd.com>
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
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

s/pcie/PCIe/ in the subject.

On Tue, May 23, 2023 at 12:02:32PM +0800, Shiwu Zhang wrote:
> v2: add the base class id for accelerator (lijo)

Please include a commit log.  For PCI, the "v2: ..." stuff would go
below the "---" so it doesn't get included in the git commit.  I don't
know what the DRM convention is.

It's OK if the commit log repeats the subject.  The subject is like
the title of a story -- it's not the first sentence of the story.

Please include a spec citation for the PCI_BASE_CLASS_ACCELERATOR
values in the commit log.  I think it's something like "PCI Code and
ID Assignment, r1.9, sec 1, 1.19".

> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
> Acked-by: Lijo Lazar <lijo.lazar@amd.com>

With the above:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>  # pci_ids.h

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++++
>  include/linux/pci_ids.h                 | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 3d91e123f9bd..5d652e6f0b1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2042,6 +2042,11 @@ static const struct pci_device_id pciidlist[] = {
>  	  .class_mask = 0xffffff,
>  	  .driver_data = CHIP_IP_DISCOVERY },
>  
> +	{ PCI_DEVICE(0x1002, PCI_ANY_ID),
> +	  .class = PCI_CLASS_ACCELERATOR_PROCESSING << 8,
> +	  .class_mask = 0xffffff,
> +	  .driver_data = CHIP_IP_DISCOVERY },
> +
>  	{0, 0, 0}
>  };
>  
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index b362d90eb9b0..4918ff26a987 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -151,6 +151,9 @@
>  #define PCI_CLASS_SP_DPIO		0x1100
>  #define PCI_CLASS_SP_OTHER		0x1180
>  
> +#define PCI_BASE_CLASS_ACCELERATOR	0x12
> +#define PCI_CLASS_ACCELERATOR_PROCESSING	0x1200
> +
>  #define PCI_CLASS_OTHERS		0xff
>  
>  /* Vendors and devices.  Sort key: vendor first, device next. */
> -- 
> 2.17.1
> 
