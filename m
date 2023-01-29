Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB6D680747
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Jan 2023 09:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146C010E140;
	Mon, 30 Jan 2023 08:18:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D407D10E057;
 Sun, 29 Jan 2023 13:31:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CD2560D3A;
 Sun, 29 Jan 2023 13:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573CFC433EF;
 Sun, 29 Jan 2023 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674999112;
 bh=vbOcOQvLI7LJlxcTePJ5Zy1AAvu47HqN45gtrJuttt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P6GacKiwueCw3hOihvbZQYjL+kShUibaANrpvwDF2j7San2zs3U8gCZl7/4ti7Wcl
 NsNyi36DdWbyg4i7M8gB6ooxQvWE+U9vQCVthKZYrwQtIBN99Os0jYzTdfS0y0kyFz
 uMpK5+mQyoE6XBmMqfzR9zWcSRSmABylszZFXvyU=
Date: Sun, 29 Jan 2023 14:31:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
Message-ID: <Y9Z1RdnfM4ypM/zW@kroah.com>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
 <20230120174634.GA889896@roeck-us.net>
 <a9deecb3-5955-ee4e-c76f-2654ee9f1a92@amd.com>
 <Y9N/wiIL758c3ozv@kroah.com>
 <36e72298-e9d3-967e-8b14-7197719953cb@leemhuis.info>
 <MN0PR12MB610184AF496001F3B92706BDE2CC9@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR12MB610184AF496001F3B92706BDE2CC9@MN0PR12MB6101.namprd12.prod.outlook.com>
X-Mailman-Approved-At: Mon, 30 Jan 2023 08:18:12 +0000
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "stanislav.lisovskiy@intel.com" <stanislav.lisovskiy@intel.com>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, Guenter Roeck <linux@roeck-us.net>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 03:02:41PM +0000, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
> > -----Original Message-----
> > From: Linux kernel regression tracking (Thorsten Leemhuis)
> > <regressions@leemhuis.info>
> > Sent: Friday, January 27, 2023 03:15
> > To: Greg KH <gregkh@linuxfoundation.org>; Limonciello, Mario
> > <Mario.Limonciello@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; stable@vger.kernel.org;
> > stanislav.lisovskiy@intel.com; Zuo, Jerry <Jerry.Zuo@amd.com>; amd-
> > gfx@lists.freedesktop.org; Lin, Wayne <Wayne.Lin@amd.com>; Guenter
> > Roeck <linux@roeck-us.net>; bskeggs@redhat.com
> > Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
> > the atomic state"
> > 
> > On 27.01.23 08:39, Greg KH wrote:
> > > On Fri, Jan 20, 2023 at 11:51:04AM -0600, Limonciello, Mario wrote:
> > >> On 1/20/2023 11:46, Guenter Roeck wrote:
> > >>> On Thu, Jan 12, 2023 at 04:50:44PM +0800, Wayne Lin wrote:
> > >>>> This reverts commit 4d07b0bc403403438d9cf88450506240c5faf92f.
> > >>>>
> > >>>> [Why]
> > >>>> Changes cause regression on amdgpu mst.
> > >>>> E.g.
> > >>>> In fill_dc_mst_payload_table_from_drm(), amdgpu expects to
> > add/remove payload
> > >>>> one by one and call fill_dc_mst_payload_table_from_drm() to update
> > the HW
> > >>>> maintained payload table. But previous change tries to go through all
> > the
> > >>>> payloads in mst_state and update amdpug hw maintained table in once
> > everytime
> > >>>> driver only tries to add/remove a specific payload stream only. The
> > newly
> > >>>> design idea conflicts with the implementation in amdgpu nowadays.
> > >>>>
> > >>>> [How]
> > >>>> Revert this patch first. After addressing all regression problems caused
> > by
> > >>>> this previous patch, will add it back and adjust it.
> > >>>
> > >>> Has there been any progress on this revert, or on fixing the underlying
> > >>> problem ?
> > >>>
> > >>> Thanks,
> > >>> Guenter
> > >>
> > >> Hi Guenter,
> > >>
> > >> Wayne is OOO for CNY, but let me update you.
> > >>
> > >> Harry has sent out this series which is a collection of proper fixes.
> > >> https://patchwork.freedesktop.org/series/113125/
> > >>
> > >> Once that's reviewed and accepted, 4 of them are applicable for 6.1.
> > >
> > > Any hint on when those will be reviewed and accepted?  patchwork
> > doesn't
> > > show any activity on them, or at least I can't figure it out...
> > 
> > I didn't look closer (hence please correct me if I'm wrong), but the
> > core changes afaics are in the DRM pull airlied send a few hours ago to
> > Linus (note the "amdgpu […] DP MST fixes" line):
> > 
> > https://lore.kernel.org/all/CAPM%3D9tzuu4xnx6T5v7sKsK%2BA5HEaPOc1ie
> > MyzNSYQZGztJ%3D6Qw@mail.gmail.com/
> 
> That's right.  There are 4 commits in that PR with the appropriate stable tags
> that should fix the majority of the MST issues introduced in 6.1 by 4d07b0bc40340
> ("drm/display/dp_mst: Move all payload info into the atomic state"):
> 
>       drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count assignments
>       drm/amdgpu/display/mst: limit payload to be updated one by one
>       drm/amdgpu/display/mst: update mst_mgr relevant variable when long HPD
>       drm/display/dp_mst: Correct the kref of port.
> 
> There will be follow ups for any remaining corner cases.

Great, thanks for this, all are now queued up in the 6.1.y queue.

greg k-h
