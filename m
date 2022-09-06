Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6465AEFE2
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Sep 2022 18:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6BD10E030;
	Tue,  6 Sep 2022 16:07:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108AA10E5B5;
 Tue,  6 Sep 2022 15:06:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88D1DB818D4;
 Tue,  6 Sep 2022 15:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55A4C43470;
 Tue,  6 Sep 2022 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662476808;
 bh=HKn5OtHPRNYi5Ma7JN4h+bzSjA8wE1EFVOf8KPNOmo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O/Kd9WyvCC8md97D3KyKkPBWv2afnrofuMcsjPEdtM3LpqX6IEbhFZUyCBI8pTwRX
 4kgrTKTiHuynGEwtGi+I2IsLenPfIcUGhl8EIuVw87tirpyNRbaSIRWpr57UPqGHC8
 T5n9espBQz9VWinK4X2AEBfHHg2x1zEiN7eKQwVA=
Date: Tue, 6 Sep 2022 17:06:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] drm/amd/display: fix memory leak when using
 debugfs_lookup()
Message-ID: <YxdiBRCmhlrRxAz5@kroah.com>
References: <20220902130105.139138-1-gregkh@linuxfoundation.org>
 <YxIAvHOK7uNum9VI@kroah.com>
 <5f29a2e1-4ecb-9f94-1e57-f7d8d3c7afb2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f29a2e1-4ecb-9f94-1e57-f7d8d3c7afb2@amd.com>
X-Mailman-Approved-At: Tue, 06 Sep 2022 16:06:56 +0000
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deuc her <alexander.deucher@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Yongzhi Liu <lyz_cs@pku.edu.cn>, Mikita Lipski <mikita.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thelford Williams <tdwilliamsiv@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 10:52:28AM -0400, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2022-09-02 09:10, Greg Kroah-Hartman wrote:
> > On Fri, Sep 02, 2022 at 03:01:05PM +0200, Greg Kroah-Hartman wrote:
> > > When calling debugfs_lookup() the result must have dput() called on it,
> > > otherwise the memory will leak over time.  Fix this up by properly
> > > calling dput().
> > > 
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Leo Li <sunpeng.li@amd.com>
> > > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: "Christian K�nig" <christian.koenig@amd.com>
> > > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > Cc: hersen wu <hersenxs.wu@amd.com>
> > > Cc: Wenjing Liu <wenjing.liu@amd.com>
> > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > Cc: Thelford Williams <tdwilliamsiv@gmail.com>
> > > Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > > Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>
> > > Cc: Mikita Lipski <mikita.lipski@amd.com>
> > > Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > > Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > Cc: Sean Paul <seanpaul@chromium.org>
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > 
> > Despite a zillion cc: items, I forgot to cc: stable on this.  Can the
> > maintainer add that here, or do you all want me to resend it with that
> > item added?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> Is 'Cc: stable@vger.kernel.org' enough here? I can make this change before I
> merge it into amd-staging-drm-next.

Yes, please add the cc: stable@ line to the body of the patch, sorry I
forgot that.

thanks,

greg k-h
