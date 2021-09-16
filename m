Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A915A40D452
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Sep 2021 10:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE196EACD;
	Thu, 16 Sep 2021 08:12:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id D62FF6EACD
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Sep 2021 08:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7C90B20201B;
 Thu, 16 Sep 2021 10:12:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id jKxIEzRn8woN; Thu, 16 Sep 2021 10:12:18 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 3DC4C20201A;
 Thu, 16 Sep 2021 10:12:18 +0200 (CEST)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95-RC2)
 (envelope-from <michel@daenzer.net>) id 1mQmVF-000vJb-ED;
 Thu, 16 Sep 2021 10:12:17 +0200
Message-ID: <d8293063-6f0e-b808-2636-631fe2f08fcf@daenzer.net>
Date: Thu, 16 Sep 2021 10:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Quan, Evan" <Evan.Quan@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "'amd-gfx@lists.freedesktop.org'" <amd-gfx@lists.freedesktop.org>
References: <DM6PR12MB2619F306147E803C1C10FF8BE4DC9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <4ded93f1-e6b1-06c3-9f03-b6135911392c@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: DRM IOCTLS come regularly(every minute) still even after screen
 off
In-Reply-To: <4ded93f1-e6b1-06c3-9f03-b6135911392c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2021-09-16 08:27, Christian König wrote:
> Good morning,
> 
> for the background I advised to contact you Michel since we couldn't find an explanation.
> 
> Alex explanation might be correct, but the CS seems to come from the X server and is always roughly 60 seconds after going into power save.
> 
> Any idea what that could be?

For the DRM_IOCTL_MODE_* ioctls, attaching gdb to Xorg and setting a breakpoint on drmIoctl should show where they're coming from.

The AMDGPU_CS ioctls are probably from glamor calling OpenGL, most likely for X11 drawing protocol requests. Note that in this case drmIoctl/ioctl will likely be called from a separate thread. Pierre / Marek should be able to help you find out where the OpenGL calls are coming from.


In general, Xorg only ever does anything in response to:

* X11 protocol requests, i.e. on behalf of clients.
* Input events, i.e. on behalf of the user.
* Other kernel events, e.g. hotplug events.


FWIW, with only xfwm4 & xterm running on Xorg, I'm not seeing any drmIoctl calls during DPMS off. So the ioctls you're seeing are most likely triggered by clients.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
