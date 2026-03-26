Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLlsGo0KxWma5wQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Mar 2026 11:29:33 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A4333597
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Mar 2026 11:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8FA10E0E2;
	Thu, 26 Mar 2026 10:29:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from redcrew.org (redcrew.org [37.157.195.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9D010E05F
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 10:29:27 +0000 (UTC)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
 by redcrew.org (Postfix) with ESMTP id 82805D4;
 Thu, 26 Mar 2026 11:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org 82805D4
Received: from talos.danny.cz (talos
 [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
 by server.danny.cz (Postfix) with SMTP id 421DD17A006;
 Thu, 26 Mar 2026 11:29:20 +0100 (CET)
Date: Thu, 26 Mar 2026 11:29:20 +0100
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 amd-gfx@lists.freedesktop.org, Donet Tom <donettom@linux.ibm.com>
Subject: Re: amdgpu driver fails to initialize on ppc64le in 7.0-rc1 and newer
Message-Id: <20260326112920.07eb56ee6d133947d8bcf6f3@danny.cz>
In-Reply-To: <341nolfr.ritesh.list@gmail.com>
References: <20260313142351.609bc4c3efe1184f64ca5f44@danny.cz>
 <1phlu3bs.ritesh.list@gmail.com>
 <20260315105021.667e52d4a99b154ef1e6aa34@danny.cz>
 <da93575e-92ad-4a7b-83df-1cb956bd2bc2@linux.ibm.com>
 <5x6knm5q.ritesh.list@gmail.com>
 <2d5fd6ec-003f-4d24-aa2e-06ba94d6cba4@linux.ibm.com>
 <341nolfr.ritesh.list@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:gbatra@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:donettom@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dan@danny.cz,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.998];
	DBL_BLOCKED_OPENRESOLVER(0.00)[danny.cz:email,danny.cz:mid,danny.cz:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E47A4333597
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ritesh,

On Wed, 25 Mar 2026 23:12:16 +0530
Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:

> Gaurav Batra <gbatra@linux.ibm.com> writes:
> 
> > Hello Ritesh
> >
> > I think, what you are proposing to add dev->bus_dma_limit in the check 
> > might work. In the case of PowerNV, this is not set, but 
> > dev->dma_ops_bypass is set. So, for PowerNV, it will fall back to how it 
> > was before.
> >
> > Also, since these both are set in LPAR mode, the current patch as-is 
> > will work.
> >
> > Dan, can you please try Ritesh proposed fix on your PowerNV box? I am 
> > not able to lay my hands on a PowerNV box yet.
> >
> 
> It would be this diff then. Note, I have only compile tested it.
> 
> diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
> index 73e10bd4d56d..8b4de508d2eb 100644
> --- a/arch/powerpc/kernel/dma-iommu.c
> +++ b/arch/powerpc/kernel/dma-iommu.c
> @@ -67,7 +67,7 @@ bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
>  }
>  bool arch_dma_alloc_direct(struct device *dev)
>  {
> -       if (dev->dma_ops_bypass)
> +       if (dev->dma_ops_bypass && dev->bus_dma_limit)
>                 return true;
> 
>         return false;
> @@ -75,7 +75,7 @@ bool arch_dma_alloc_direct(struct device *dev)
> 
>  bool arch_dma_free_direct(struct device *dev, dma_addr_t dma_handle)
>  {
> -       if (!dev->dma_ops_bypass)
> +       if (!dev->dma_ops_bypass || !dev->bus_dma_limit)
>                 return false;
> 
>         return is_direct_handle(dev, dma_handle);

this seems to fix the amdgpu initialization, full kernel log available
as https://fedora.danny.cz/tmp/kernel-7.0-rc5.log

Tested-by: Dan Horák <dan@danny.cz>


		Dan
