Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LVM2H/oWPWqSwwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 13:54:34 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136776C54B3
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 13:54:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=beu4O6BZ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6290E10E1EC;
	Thu, 25 Jun 2026 11:54:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70E610E1EB;
 Thu, 25 Jun 2026 11:54:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 96DF040B7B;
 Thu, 25 Jun 2026 11:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264EE1F000E9;
 Thu, 25 Jun 2026 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782388470;
 bh=/GXFi/MVRAwUZHw1Zk5DPCqLioIWwoiNAiqmK1nO1Ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=beu4O6BZP1eXIi45Dd5+lSUZZefTpFb3TjvzlFxLH0t/BOcXi8L6Dale141fqCl6Z
 /Xte0MUmMr3yT9Pcbt1Lg8nplPdvKdmOnIVohDbRXzgub0s/+nTkR/vXxf57AZz0CF
 SBFlmlwifSmHo/3s7jGSTq143SfCAFMwOl8TxWJ61LJRBo6NS6O+GjGXDZFEdykJda
 ZAhI6fYFT/UqiaP96opC92vgpKZ/jIEtfoHBzsGwNgcrPxbp9F0u58F4tUoecbcYza
 skRccOgyZHJp/MMsUbljWviO84DFhaq696UGJc6N0ZebJUxf28JNGPE6nucgOmoHxO
 kXQfySON4fttw==
Date: Thu, 25 Jun 2026 12:54:20 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yitao Jiang <jytscientist@hotmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/3] mm/mmu_notifier, drm/amdgpu: block THP for GPU user
 mappings
Message-ID: <aj0V0Dqg-4Xa8-6Y@lucifer>
References: <SY1PR01MB10596EB75463208A8E1EBBA0FC0EC2@SY1PR01MB10596.ausprd01.prod.outlook.com>
 <d462612c-508c-4682-a776-92f4f4a40e28@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d462612c-508c-4682-a776-92f4f4a40e28@kernel.org>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,lucifer:server fail,lists.freedesktop.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[hotmail.com,amd.com,gmail.com,ffwll.ch,linux-foundation.org,nvidia.com,linux.alibaba.com,infradead.org,redhat.com,arm.com,kernel.org,linux.dev,google.com,suse.com,lists.freedesktop.org,vger.kernel.org,kvack.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 136776C54B3

NAK to this or any version of this.

This series is insane and the idea is insane.

On Thu, Jun 25, 2026 at 01:47:25PM +0200, David Hildenbrand (Arm) wrote:
> On 6/25/26 12:59, Yitao Jiang wrote:
> > Hi,
> >
> > This series fixes a THP policy problem I found while debugging
> > frequent ROCm GPU failures on an AMD Radeon 780M system during ML
> > training.
> >
> > Some AMDGPU/KFD user mappings are registered through interval
> > notifiers and cannot safely tolerate the backing VMA changing from base
> > pages to a transparent huge page after registration. Userspace can
> > still apply MADV_HUGEPAGE or MADV_COLLAPSE, and khugepaged can also
> > collapse the range, after the GPU mapping has been registered.
>
> Huh, why? As a memory notifier user, you must be prepared from memory to get
> unmapped+remapped at random points in time.
>
> What is the precise problem here? How are you handling THPs at registration time?
>
> Letting arbitrary drivers make THP policies sounds like the very wrong approach.

We absolutely will not _ever_ allow drivers to do this while I still breath :)

>
> --
> Cheers,
>
> David

Thanks, Lorenzo
