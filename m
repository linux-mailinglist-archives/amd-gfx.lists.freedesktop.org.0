Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE359C04D
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Aug 2022 15:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EE18AF77;
	Mon, 22 Aug 2022 13:16:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C97113D57
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Aug 2022 11:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5PcSssONmYM3nGWZ6RybkrMzsWV43+5Lu+oPjbsK9zI=; b=Aed23r0BX7Hj140U9k0lKyJGR8
 Piw3zgTmPGsDamksZWnfXohz+mJqQOE8Faq0OpNVqaVGRnemNwYYe2HFgFEHn8KfF1Pg9ERojir1x
 7V7Tp8SJivsdTaTkWWupTE9k6QnGrFTZikAa7n5N3zptDcEgyq8yXin3HRPlC5pHeyiT3gQoAbVhm
 qkOhqJlZwlkYwv/RdH4F0fnune1YpcADQ5RwEVTBAFgqqd4GW8q2VzdMhlc00au8nclJHynTpzkDX
 iKkT1tTOFSHQ+WrIoFyZjEv/eAaEYtog9XIuIaTaeAUNCdjS0fYV6BsQ2Dv1zYH6O59I3zLjZKjhz
 DdyyUBzA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oQ5d7-008FXQ-Tk; Mon, 22 Aug 2022 11:30:05 +0000
Date: Mon, 22 Aug 2022 04:30:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: export cpu_smallcore_map for modules
Message-ID: <YwNovfuf3pDBh2Zk@infradead.org>
References: <20220819210112.7924-1-rdunlap@infradead.org>
 <87o7wdkkt4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7wdkkt4.fsf@mpe.ellerman.id.au>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 22 Aug 2022 13:16:09 +0000
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 amd-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Tejun Heo <tj@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Aug 22, 2022 at 01:40:23PM +1000, Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> > drivers/gpu/drm/amd/amdkfd/kfd_device.c calls cpu_smt_mask().
> > This is an inline function on powerpc which references
> > cpu_smallcore_map.
> >
> > Fixes: 425752c63b6f ("powerpc: Detect the presence of big-cores via "ibm, thread-groups"")
> > Fixes: 7bc913085765 ("drm/amdkfd: Try to schedule bottom half on same core")
> 
> That 2nd commit is not in mainline, only linux-next.
> 
> I don't mind merging this fix preemptively, but is that SHA stable?

I really do not think this has any business being exported at all.

kfd_queue_work is not something that should be done in a driver.
Something like this belongs into the workqueue core, not in an
underdocumented helper in a random driver.

Drm guys:  once again, please please work with the maintainers instead
of just making up random stuff in the drivers.
