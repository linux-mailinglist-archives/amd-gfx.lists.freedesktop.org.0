Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE455A257
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Jun 2022 22:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A3410E8F5;
	Fri, 24 Jun 2022 20:08:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0E710E378;
 Fri, 24 Jun 2022 09:59:12 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 29BB821A74;
 Fri, 24 Jun 2022 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1656064751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRx5MsPC3bOKBussEAACbRbCrT13pUlZg+D3y9hzeFQ=;
 b=k1jLteFpvAGft+ORFG/tzqlURXKLRNicj7+oUgUIuX8osjH4+RjNVm62/jfqHf/FKhN7zD
 JkM1/iDo+UtWtCT89LSvKZPXJRE/SPVqpxUdXuUhXgeFakRbgDUpIRPPRwwC/o9HRxOK/+
 gqzcjpY9QSRIzgUY++eA0/TlwRk7dss=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D56122C1E2;
 Fri, 24 Jun 2022 09:59:10 +0000 (UTC)
Date: Fri, 24 Jun 2022 11:59:10 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Per file OOM-badness / RSS once more
Message-ID: <YrWK7pwZP3K2vbye@dhcp22.suse.cz>
References: <20220624080444.7619-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
X-Mailman-Approved-At: Fri, 24 Jun 2022 20:08:07 +0000
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
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri 24-06-22 10:04:30, Christian K�nig wrote:
> Hello everyone,
> 
> To summarize the issue I'm trying to address here: Processes can allocate
> resources through a file descriptor without being held responsible for it.
> 
> I'm not explaining all the details again. See here for a more deeply
> description of the problem: https://lwn.net/ml/linux-kernel/20220531100007.174649-1-christian.koenig@amd.com/
> 
> With this iteration I'm trying to address a bunch of the comments Michal Hocko
> (thanks a lot for that) gave as well as giving some new ideas.
> 
> Changes made so far:
> 1. Renamed the callback into file_rss(). This is at least a start to better
>    describe what this is all about. I've been going back and forth over the
>    naming here, if you have any better idea please speak up.
> 
> 2. Cleanups, e.g. now providing a helper function in the fs layer to sum up
>    all the pages allocated by the files in a file descriptor table.
> 
> 3. Using the actual number of allocated pages for the shmem implementation
>    instead of just the size. I also tried to ignore shmem files which are part
>    of tmpfs, cause that has a separate accounting/limitation approach.

OK, this is better than the original approach there are still holes
there though I am afraid. I am not sure your i_count hack is correct
but that would be mostly an implementation detail.  The scheme will
over-account memory mapped files (including memfd).  How much that
matters will really differ.

For the global OOM situations it is very likely that there will be
barely any disk based page cache as it would be reclaimed by the time
the oom killer is invoked. So this should be OK. Swap backed page cache
(shmem and its users) is more tricky. It is swap bound and processes
which map it will get "charged" in the form of swap entries while those
which rely on read/write will just escape from the sight of the oom
killer no matter how much memory they own via their shmem backed fd.
This sounds rather serious to me and I hope I haven't missed anything
subtle here that would keep those pages somehow visible. Anyway
something to very carefully document.

For the memcg OOM this gets even more tricky. Files can be shared among
tasks accross memcgs. Something that is not really straightforward from
the userspace POV because this is not strictly deterministic as
first-one-first-charged logic is applied so a lot might depend on timing.
This could also easily mean that a large part of the in memory state of
the file is outside of the reclaim and therefore OOM scope of the memcg
which is hitting the hard limit. This could result in tasks being killed
just because they (co)operate on a large file outside of their memcg
domain. To be honest I am not sure how big of a problem this would be in
practice and the existing behavior has its own cons so to me it sounds
like changing one set of deficiency with other.

As we have discussed previously, there is unlikely a great solution but
you a) need to document most prominent downsides so that people can at
least see this is understood and documented behavior and b) think of the
runaway situation wrt non mapped shmems memtioned above and see whether
there is something we can do about that.
-- 
Michal Hocko
SUSE Labs
