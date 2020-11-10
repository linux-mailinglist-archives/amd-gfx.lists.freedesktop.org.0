Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9656E2ADE23
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Nov 2020 19:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF5E89240;
	Tue, 10 Nov 2020 18:21:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190F289B99;
 Tue, 10 Nov 2020 17:58:04 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EB5620781;
 Tue, 10 Nov 2020 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605031083;
 bh=L+AxM4e5R7BdLTbIrzGDcOoSbbHxKCgl0056g2Xh/+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RrurbUdtnB/7B535vPgpaf5RX1rExhnZtSxXlB442k2WfAf5vOU+SxZLkeLDTqQ3M
 fNLAObF3MaSSR9cDmY5hpZLr/P0iVX9H9niPePVjLJmsZ1rmnNygDfQu6sh4HVqayD
 voqEyB7kb/yBFx6TUsTcC5QMQgB4qzvLcIFTgmMc=
Date: Tue, 10 Nov 2020 18:59:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
Message-ID: <X6rU6lKDCyl6RN+V@kroah.com>
References: <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
 <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com>
X-Mailman-Approved-At: Tue, 10 Nov 2020 18:21:57 +0000
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, ckoenig.leichtzumerken@gmail.com,
 alexdeucher@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 12:54:21PM -0500, Andrey Grodzovsky wrote:
> Hi, back to this after a long context switch for some higher priority stuff.
> 
> So here I was able eventually to drop all this code and this change here https://cgit.freedesktop.org/~agrodzov/linux/commit/?h=amd-staging-drm-next-device-unplug&id=61852c8a59b4dd89d637693552c73175b9f2ccd6
> was enough for me. Seems like while device_remove_file can handle the use
> case where the file and the parent directory already gone,
> sysfs_remove_group goes down in flames in that case
> due to kobj->sd being unset on device removal.

A driver shouldn't ever have to remove individual sysfs groups, the
driver core/bus logic should do it for them automatically.

And whenever a driver calls a sysfs_* call, that's a hint that something
is not working properly.

Also, run your patch above through checkpatch.pl before submitting it :)

thanks,

greg k-h
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
