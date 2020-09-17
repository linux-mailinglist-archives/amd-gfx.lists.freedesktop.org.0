Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D126E2F7
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Sep 2020 19:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13D36E2D7;
	Thu, 17 Sep 2020 17:53:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6F6EC61;
 Thu, 17 Sep 2020 17:27:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1123B6736F; Thu, 17 Sep 2020 19:27:16 +0200 (CEST)
Date: Thu, 17 Sep 2020 19:27:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
Message-ID: <20200917172715.GA8325@lst.de>
References: <20200915184607.84435-1-alexander.deucher@amd.com>
 <20200916070436.GA9392@lst.de>
 <CADnq5_P9nEZDiB0Fx_tsK1GCB_NJ-AOnx7Fd=706tZ4aKrmPzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_P9nEZDiB0Fx_tsK1GCB_NJ-AOnx7Fd=706tZ4aKrmPzA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 17 Sep 2020 17:53:41 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "for 3.8" <stable@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 06:16:25PM -0400, Alex Deucher wrote:
> On Wed, Sep 16, 2020 at 3:04 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Tue, Sep 15, 2020 at 02:46:07PM -0400, Alex Deucher wrote:
> > > This change breaks tons of systems.
> >
> > Did you do at least some basic root causing on why?  Do GPUs get
> > fed address they can't deal with?  Any examples?
> >
> > Bug 1 doesn't seem to contain any analysis and was reported against
> > a very old kernel that had all kind of fixes since.
> >
> > Bug 2 seems to imply a drm kthread is accessing some structure it
> > shouldn't, which would imply a mismatch between pools used by radeon
> > now and those actually provided by the core.  Something that should
> > be pretty to trivial to fix for someone understanding the whole ttm
> > pool maze.
> >
> > Bug 3: same as 1, but an even older kernel.
> >
> > Bug 4: looks like 1 and 3, and actually verified to work properly
> > in 5.9-rc.  Did you try to get the other reporters test this as well?
> 
> It would appear that the change in 5.9 to disable AGP on radeon fixed
> the issue.  I'm following up on the other tickets to see if I can get
> confirmation.  On another thread[1], the user was able to avoid the
> issue by disabling HIMEM.  Looks like some issue with HIMEM and/or
> AGP.

Thanks.  I'll try to spend some time to figure out what could be
highmem related.  I'd much rather get this fixed properly.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
