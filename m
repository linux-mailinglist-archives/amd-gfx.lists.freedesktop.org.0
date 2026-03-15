Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P1XGBuWAtmluCgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 15 Mar 2026 10:50:29 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7F2905AE
	for <lists+amd-gfx@lfdr.de>; Sun, 15 Mar 2026 10:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A1510E223;
	Sun, 15 Mar 2026 09:50:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from redcrew.org (redcrew.org [37.157.195.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1728A10E223
 for <amd-gfx@lists.freedesktop.org>; Sun, 15 Mar 2026 09:50:24 +0000 (UTC)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
 by redcrew.org (Postfix) with ESMTP id D3ED5D4;
 Sun, 15 Mar 2026 10:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org D3ED5D4
Received: from talos.danny.cz (talos
 [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
 by server.danny.cz (Postfix) with SMTP id 27BC917A006;
 Sun, 15 Mar 2026 10:50:22 +0100 (CET)
Date: Sun, 15 Mar 2026 10:50:21 +0100
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org, Donet Tom <donettom@linux.ibm.com>
Subject: Re: amdgpu driver fails to initialize on ppc64le in 7.0-rc1 and newer
Message-Id: <20260315105021.667e52d4a99b154ef1e6aa34@danny.cz>
In-Reply-To: <1phlu3bs.ritesh.list@gmail.com>
References: <20260313142351.609bc4c3efe1184f64ca5f44@danny.cz>
 <1phlu3bs.ritesh.list@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:gbatra@linux.ibm.com,m:donettom@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dan@danny.cz,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[danny.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan@danny.cz,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[danny.cz:email,danny.cz:mid,danny.cz:url]
X-Rspamd-Queue-Id: 51E7F2905AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ritesh,

On Sun, 15 Mar 2026 09:55:11 +0530
Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:

> Dan Horák <dan@danny.cz> writes:
> 
> +cc Gaurav,
> 
> > Hi,
> >
> > starting with 7.0-rc1 (meaning 6.19 is OK) the amdgpu driver fails to
> > initialize on my Linux/ppc64le Power9 based system (with Radeon Pro WX4100)
> > with the following in the log
> >
> > ...
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
> 
>                   ^^^^
> So looks like this is a PowerNV (Power9) machine.

correct :-)
 
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: [drm] Detected VRAM RAM=4096M, BAR=4096M
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: [drm] RAM width 128bits GDDR5
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: iommu: 64-bit OK but direct DMA is limited by 0
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: dma_iommu_get_required_mask: returning bypass mask 0xfffffffffffffff
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0:  4096M of VRAM memory ready
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0:  32570M of GTT memory ready.
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: (-12) failed to allocate kernel bo
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: [drm] Debug VRAM access will use slowpath MM access
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: [drm] GART: num cpu pages 4096, num gpu pages 65536
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: [drm] PCIE GART of 256M enabled (table at 0x000000F4FFF80000).
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: (-12) failed to allocate kernel bo
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: (-12) create WB bo failed
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu_device_wb_init failed -12
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu_device_ip_init failed
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: Fatal error during GPU init
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: finishing device.
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: probe with driver amdgpu failed with error -12
> > bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0:  ttm finalized
> > ...
> >
> > After some hints from Alex and bisecting and other investigation I have
> > found that https://github.com/torvalds/linux/commit/1471c517cf7dae1a6342fb821d8ed501af956dd0
> > is the culprit and reverting it makes amdgpu load (and work) again.
> 
> Thanks for confirming this. Yes, this was recently added [1]
> 
> [1]: https://lore.kernel.org/linuxppc-dev/20251107161105.85999-1-gbatra@linux.ibm.com/ 
> 
> 
> @Gaurav,
> 
> I am not too familiar with the area, however looking at the logs shared
> by Dan, it looks like we might be always going for dma direct allocation
> path and maybe the device doesn't support this address limit. 
> 
>  bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: iommu: 64-bit OK but direct DMA is limited by 0
>  bře 05 08:35:40 talos.danny.cz kernel: amdgpu 0000:01:00.0: dma_iommu_get_required_mask: returning bypass mask 0xfffffffffffffff

a complete kernel log is at
https://gitlab.freedesktop.org/-/project/4522/uploads/c4935bca6f37bbd06bb4045c07d00b5b/kernel.log

Please let me know if you need more info.


		Dan

 
> Looking at the code..
> 
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index fe7472f13b10..d5743b3c3ab3 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -654,7 +654,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  	/* let the implementation decide on the zone to allocate from: */
>  	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
>  
> -	if (dma_alloc_direct(dev, ops)) {
> +	if (dma_alloc_direct(dev, ops) || arch_dma_alloc_direct(dev)) {
>  		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
>  	} else if (use_dma_iommu(dev)) {
>  		cpu_addr = iommu_dma_alloc(dev, size, dma_handle, flag, attrs);
> 
> Now, do we need arch_dma_alloc_direct() here? It always returns true if
> dev->dma_ops_bypass is set to true, w/o checking for checks that
> dma_go_direct() has.
> 
> whereas...
> 
> /*
>  * Check if the devices uses a direct mapping for streaming DMA operations.
>  * This allows IOMMU drivers to set a bypass mode if the DMA mask is large
>  * enough.
>  */
> static inline bool
> dma_alloc_direct(struct device *dev, const struct dma_map_ops *ops)
> ..dma_go_direct(dev, dev->coherent_dma_mask, ops);
> ....  ...
>       #ifdef CONFIG_DMA_OPS_BYPASS
>           if (dev->dma_ops_bypass)
>               return min_not_zero(mask, dev->bus_dma_limit) >=
>                       dma_direct_get_required_mask(dev);
>       #endif
> 
> dma_alloc_direct() already checks for dma_ops_bypass and also if
> dev->coherent_dma_mask >= dma_direct_get_required_mask(). So...
> 
> .... Do we really need the machinary of arch_dma_{alloc|free}_direct()?
> Isn't dma_alloc_direct() checks sufficient?
> 
> Thoughts?
> 
> -ritesh
> 
> 
> >
> > for the record, I have originally opened https://gitlab.freedesktop.org/drm/amd/-/issues/5039
> >
> >
> > 	With regards,
> >
> > 		Dan
