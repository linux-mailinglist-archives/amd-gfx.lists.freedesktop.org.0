Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4q04EhAYPWrCwwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 13:59:12 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F86C5551
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 13:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AArBWtJu;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB6D10E1E1;
	Thu, 25 Jun 2026 11:59:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DFA10E1E1;
 Thu, 25 Jun 2026 11:59:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F328843232;
 Thu, 25 Jun 2026 11:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12FB1F000E9;
 Thu, 25 Jun 2026 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782388748;
 bh=SOWUv1XfnbEbqm4GgtkhR5DJeEd/Hng/YV/E0/Qc0Cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=AArBWtJuZNc+/FIFUIMlGuEZ8kMvlKEFWkOuvjAEvmSCRP6Xtr79DwdLfMRKxlCsp
 Y3IT3WOyGk6qDjC+t4HKdGewaQIfROBx3//zGaqkVvAIWSn89JQ5+qpQIXdCm6oMxe
 psbFJ8N1cByHOQzNmWU63y70+iMNRCiyAjs4IyQzZXKg4LEnhDy1S1MXdKCNt/nrsZ
 xUKH6wlT1qw0OomPAMWfNmOPisTudnb6s7TrvtA9fGPJODLcaiOKBZlSZh07z2lZvG
 ARk0cWPCvn/SNRPjo4quuTXhn9k1+0qPGQG2NWAw6QswrpPXgADAiOxmSiH3UgiJ/3
 BLqOQd0LHWe1A==
Date: Thu, 25 Jun 2026 12:58:58 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Yitao Jiang <jytscientist@hotmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/3] mm/mmu_notifier: let interval notifiers block THP
Message-ID: <aj0XB-ZLl8uhSDzQ@lucifer>
References: <SY1PR01MB10596EB75463208A8E1EBBA0FC0EC2@SY1PR01MB10596.ausprd01.prod.outlook.com>
 <SY1PR01MB1059616E59F213B6FB4F4E3C5C0EC2@SY1PR01MB10596.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SY1PR01MB1059616E59F213B6FB4F4E3C5C0EC2@SY1PR01MB10596.ausprd01.prod.outlook.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[hotmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux-foundation.org,kernel.org,nvidia.com,linux.alibaba.com,infradead.org,redhat.com,arm.com,linux.dev,google.com,suse.com,lists.freedesktop.org,vger.kernel.org,kvack.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,kvack.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF6F86C5551

On Thu, Jun 25, 2026 at 06:59:51PM +0800, Yitao Jiang wrote:
> Assisted-by: OpenAI-Codex:GPT-5.5

Thanks for acking AI involvement, that's appreciated (and there appears to be a
fair but of unacknowledged AI-generated code being submitted at the moment).

However, may I gnetly direct you towards the last few paragraphs in this document:

https://origin.kernel.org/doc/html/latest/process/generated-content.html

I think this MAY be a case of the AI possibly misleading you into a crazy idea
when, as David points out, page pinning is what you need :)

We don't bite, if you have a problem that you need to solve, feel free to email
linux-mm@kvack.org and relevant maintainers/reviewers from MAINTAINERS with a
'[DISCUSSION]' or '[QUESTION]'-prefixed thread and we can help you ahead of
time.

Thanks, Lorenzo
