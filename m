Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F044667C8C
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Jan 2023 18:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C67810E306;
	Thu, 12 Jan 2023 17:31:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9D10E304
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Jan 2023 17:16:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3175620CE;
 Thu, 12 Jan 2023 17:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20128C433EF;
 Thu, 12 Jan 2023 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673543781;
 bh=3bnWEPduZsTwoZhQ+s+9BJcG/wOwJICZoWcN1mmU7uM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jMY3W59b5D875v21/LsMe6rUopf5u1kdYDQs4FyBuwYoDO24ROHV8ABKroOA/5hJa
 gA/BOV4bF51tBgTiIne7EeIGog+BEsF0DVQj66ZPkcyk23JS/HnWsmLOWxRG3b3+QX
 pfJD4YKNEdmILqXx56r00Qx3F+k0WhoEfQYqnw6o=
Date: Thu, 12 Jan 2023 18:16:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 6.0 108/148] drm/amdgpu: Fix size validation for
 non-exclusive domains (v4)
Message-ID: <Y8BAYV0Q+YdcGXAK@kroah.com>
References: <20230110180017.145591678@linuxfoundation.org>
 <20230110180020.610387724@linuxfoundation.org>
 <e4b4b0ca-b6e6-70ae-1652-3df71df53ab4@amd.com>
 <Y8A6AC9DrYfO1c4+@kroah.com>
 <ee614df9-390b-1736-c2a3-3157e47f9d6a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee614df9-390b-1736-c2a3-3157e47f9d6a@amd.com>
X-Mailman-Approved-At: Thu, 12 Jan 2023 17:31:33 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev,
 AMD Graphics <amd-gfx@lists.freedesktop.org>, stable@vger.kernel.org,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 11:59:06AM -0500, Luben Tuikov wrote:
> On 2023-01-12 11:49, Greg Kroah-Hartman wrote:
> > On Thu, Jan 12, 2023 at 11:25:08AM -0500, Luben Tuikov wrote:
> >> Hi Greg,
> >>
> >> The patch in the link is a Fixes patch of the quoted patch, and should also go in:
> >>
> >> https://lore.kernel.org/all/20230104221935.113400-1-luben.tuikov@amd.com/
> > 
> > Is that in Linus's tree already?  if so, what is the git commit id?
> 
> I just checked, and not yet. Just wanted to give a heads up.
> 
> It does have a Fixes tag, and I hope it would be picked up automatically,
> when it lands in Linus' tree.

That does not always happen if it does not have a "cc: stable@..." tag.
So when it does land in Linus's tree, please let us know the id so we
are sure to pick it up.

thanks,

greg k-h
