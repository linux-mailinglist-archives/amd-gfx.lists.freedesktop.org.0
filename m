Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F872F336D
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jan 2021 16:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28C16E2B4;
	Tue, 12 Jan 2021 15:00:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160156E2B4
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 15:00:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1850AC24;
 Tue, 12 Jan 2021 15:00:24 +0000 (UTC)
Date: Tue, 12 Jan 2021 16:00:24 +0100
Message-ID: <s5him82qjxz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] ALSA: hda/hdmi - enable runtime pm for CI AMD display
 audio
In-Reply-To: <20210105175245.963451-1-alexander.deucher@amd.com>
References: <20210105175245.963451-1-alexander.deucher@amd.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
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
Cc: Alex Deucher <alexander.deucher@amd.com>, alsa-devel@alsa-project.org,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, 05 Jan 2021 18:52:45 +0100,
Alex Deucher wrote:
> 
> We are able to power down the GPU and audio via the GPU driver
> so flag these asics as supporting runtime pm.
> 
> Reviewed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

I wanted to apply this one now, but noticed that the author address
(gmail) is different from your S-o-b address (amd.com).
Alex, is this intentional and keep it, or should I correct the author
address?


thanks,

Takashi

> ---
>  sound/pci/hda/hda_intel.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index d539f52009a1..2ea46b5a9a23 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2597,7 +2597,8 @@ static const struct pci_device_id azx_ids[] = {
>  	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
>  	/* ATI HDMI */
>  	{ PCI_DEVICE(0x1002, 0x0002),
> -	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> +	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> +	  AZX_DCAPS_PM_RUNTIME },
>  	{ PCI_DEVICE(0x1002, 0x1308),
>  	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
>  	{ PCI_DEVICE(0x1002, 0x157a),
> @@ -2659,9 +2660,11 @@ static const struct pci_device_id azx_ids[] = {
>  	{ PCI_DEVICE(0x1002, 0xaab0),
>  	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
>  	{ PCI_DEVICE(0x1002, 0xaac0),
> -	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> +	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> +	  AZX_DCAPS_PM_RUNTIME },
>  	{ PCI_DEVICE(0x1002, 0xaac8),
> -	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> +	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> +	  AZX_DCAPS_PM_RUNTIME },
>  	{ PCI_DEVICE(0x1002, 0xaad8),
>  	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
>  	  AZX_DCAPS_PM_RUNTIME },
> -- 
> 2.29.2
> 
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
