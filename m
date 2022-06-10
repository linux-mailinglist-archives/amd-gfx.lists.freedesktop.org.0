Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4354688B
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jun 2022 16:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5211A113375;
	Fri, 10 Jun 2022 14:41:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349F910E918;
 Fri, 10 Jun 2022 11:44:46 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B60B7220D8;
 Fri, 10 Jun 2022 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1654861484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2yNehDhwyQqo17iHRnrFd5b2B4xhq7rJYv9z6HMzWs=;
 b=h+J12/+6dA8PdIqRIwQ/dq8CBxwmkTtmJN+f1WSXzGepjWfdRUp6+83ihl6g6uUh9msQ3L
 qwEBdbkyLPmTrWlEDIIcEPJJpJ7gw2yT7LTS2tkfBcUYqvZX9r9bfGgNgjmvM1nTYHbhA6
 iZFt0rZqsig307bTfbxENF96s0p7l0Q=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 48F442C141;
 Fri, 10 Jun 2022 11:44:44 +0000 (UTC)
Date: Fri, 10 Jun 2022 13:44:43 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 03/13] mm: shmem: provide oom badness for shmem files
Message-ID: <YqMuq/ZrV8loC3jE@dhcp22.suse.cz>
References: <20220531100007.174649-1-christian.koenig@amd.com>
 <20220531100007.174649-4-christian.koenig@amd.com>
 <YqG67sox6L64E6wV@dhcp22.suse.cz>
 <77b99722-fc13-e5c5-c9be-7d4f3830859c@amd.com>
 <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
 <26d3e1c7-d73c-cc95-54ef-58b2c9055f0c@gmail.com>
 <YqIB0bavUeU8Abwl@dhcp22.suse.cz>
 <d4a19481-7a9f-19bf-c270-d89baa0970fc@amd.com>
 <YqIMmK18mb/+s5de@dhcp22.suse.cz>
 <3f7d3d96-0858-fb6d-07a3-4c18964f888e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f7d3d96-0858-fb6d-07a3-4c18964f888e@gmail.com>
X-Mailman-Approved-At: Fri, 10 Jun 2022 14:41:10 +0000
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
Cc: andrey.grodzovsky@amd.com, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 hughd@google.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 linux-tegra@vger.kernel.org, alexander.deucher@amd.com,
 akpm@linux-foundation.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri 10-06-22 12:58:53, Christian K�nig wrote:
> Am 09.06.22 um 17:07 schrieb Michal Hocko:
> > On Thu 09-06-22 16:29:46, Christian K�nig wrote:
> > [...]
> > > Is that a show stopper? How should we address this?
> > This is a hard problem to deal with and I am not sure this simple
> > solution is really a good fit. Not only because of the memcg side of
> > things. I have my doubts that sparse files handling is ok as well.
> 
> Well I didn't claimed that this would be easy, we juts need to start
> somewhere.
> 
> Regarding the sparse file handling, how about using file->f_mapping->nrpages
> as badness for shmem files?
> 
> That should give us the real number of pages allocated through this shmem
> file and gracefully handles sparse files.

Yes, this would be a better approximation.

> > I do realize this is a long term problem and there is a demand for some
> > solution at least. I am not sure how to deal with shared resources
> > myself. The best approximation I can come up with is to limit the scope
> > of the damage into a memcg context. One idea I was playing with (but
> > never convinced myself it is really a worth) is to allow a new mode of
> > the oom victim selection for the global oom event.

And just for the clarity. I have mentioned global oom event here but the
concept could be extended to per-memcg oom killer as well.

> > It would be an opt in
> > and the victim would be selected from the biggest leaf memcg (or kill
> > the whole memcg if it has group_oom configured.
> > 
> > That would address at least some of the accounting issue because charges
> > are better tracked than per process memory consumption. It is a crude
> > and ugly hack and it doesn't solve the underlying problem as shared
> > resources are not guaranteed to be freed when processes die but maybe it
> > would be just slightly better than the existing scheme which is clearly
> > lacking behind existing userspace.
> 
> Well, what is so bad at the approach of giving each process holding a
> reference to some shared memory it's equal amount of badness even when the
> processes belong to different memory control groups?

I am not claiming this is wrong per se. It is just an approximation and
it can surely be wrong in some cases (e.g. in those workloads where the
share memory is mostly owned by one process while the shared content is
consumed by many).

The primary question is whether it actually helps much or what kind of
scenarios it can help with and whether we can actually do better for
those. Also do not forget that shared file memory is not the only thing
to care about. What about the kernel memory used on behalf of processes?

Just consider the above mentioned memcg driven model. It doesn't really
require to chase specific files and do some arbitrary math to share the
responsibility. It has a clear accounting and responsibility model.

It shares the same underlying problem that the oom killing is not
resource aware and therefore there is no guarantee that memory really
gets freed.  But it allows sane configurations where shared resources do
not cross memcg boundaries at least. With that in mind and oom_cgroup
semantic you can get at least some semi-sane guarantees. Is it
pefect? No, by any means. But I would expect it to be more predictable.

Maybe we can come up with a saner model, but just going with per file
stats sounds like a hard to predict and debug approach to me. OOM
killing is a very disruptive operation and having random tasks killed
just because they have mapped few pages from a shared resource sounds
like a terrible thing to debug and explain to users.
 
> If you really think that this would be a hard problem for upstreaming we
> could as well keep the behavior for memcg as it is for now. We would just
> need to adjust the paramters to oom_badness() a bit.

Say we ignore the memcg side of things for now. How does it help long
term? Special casing the global oom is not all that hard but any future
change would very likely be disruptive with some semantic implications
AFAICS.
-- 
Michal Hocko
SUSE Labs
