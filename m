Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE426BE0F
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Sep 2020 09:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430DA6E9C6;
	Wed, 16 Sep 2020 07:32:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Wed, 16 Sep 2020 07:14:36 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552C16E2FF
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 07:14:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CFFD668BEB; Wed, 16 Sep 2020 09:04:36 +0200 (CEST)
Date: Wed, 16 Sep 2020 09:04:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
Message-ID: <20200916070436.GA9392@lst.de>
References: <20200915184607.84435-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915184607.84435-1-alexander.deucher@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 16 Sep 2020 07:32:53 +0000
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
Cc: amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 02:46:07PM -0400, Alex Deucher wrote:
> This change breaks tons of systems.

Did you do at least some basic root causing on why?  Do GPUs get
fed address they can't deal with?  Any examples?

Bug 1 doesn't seem to contain any analysis and was reported against
a very old kernel that had all kind of fixes since.

Bug 2 seems to imply a drm kthread is accessing some structure it
shouldn't, which would imply a mismatch between pools used by radeon
now and those actually provided by the core.  Something that should
be pretty to trivial to fix for someone understanding the whole ttm
pool maze.

Bug 3: same as 1, but an even older kernel.

Bug 4: looks like 1 and 3, and actually verified to work properly
in 5.9-rc.  Did you try to get the other reporters test this as well?

All over not a very useful changelog.

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
