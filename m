Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0004026C3C8
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Sep 2020 16:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC5C6E101;
	Wed, 16 Sep 2020 14:37:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D7B6E101;
 Wed, 16 Sep 2020 14:36:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A06F668B05; Wed, 16 Sep 2020 16:36:28 +0200 (CEST)
Date: Wed, 16 Sep 2020 16:36:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
Message-ID: <20200916143628.GA6894@lst.de>
References: <20200916132017.1221927-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916132017.1221927-1-alexander.deucher@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 16 Sep 2020 14:37:23 +0000
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

On Wed, Sep 16, 2020 at 09:20:17AM -0400, Alex Deucher wrote:
> This causes screen corruption when using the GPU which makes the
> system unusable.

You have not addressed any of my questions, especially if the commit
that fixed one of the reports (the only one with a recent kernel)
fixed most of the others as well.  Nor that fact that the crash
one really looks like the symptom of an underlying issue that absolutely
needs to be fixed first.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
