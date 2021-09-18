Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2F410558
	for <lists+amd-gfx@lfdr.de>; Sat, 18 Sep 2021 11:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37436E079;
	Sat, 18 Sep 2021 09:16:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 377976E079
 for <amd-gfx@lists.freedesktop.org>; Sat, 18 Sep 2021 09:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0916F20201B;
 Sat, 18 Sep 2021 11:16:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ifF9tBdRRbvO; Sat, 18 Sep 2021 11:16:30 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id B527D20201A;
 Sat, 18 Sep 2021 11:16:30 +0200 (CEST)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95-RC2)
 (envelope-from <michel@daenzer.net>) id 1mRWST-000I1n-PV;
 Sat, 18 Sep 2021 11:16:29 +0200
Message-ID: <6c6768b6-1f48-c6b4-1bf7-9050eea1893b@daenzer.net>
Date: Sat, 18 Sep 2021 11:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-CA
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 "Quan, Evan" <Evan.Quan@amd.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <DM6PR12MB2619F306147E803C1C10FF8BE4DC9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <4ded93f1-e6b1-06c3-9f03-b6135911392c@gmail.com>
 <d8293063-6f0e-b808-2636-631fe2f08fcf@daenzer.net>
 <DM6PR12MB261970C1F0CDB0D1D91EE7C9E4DD9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <CAAxE2A7RL+LEgwtQwH2s9_Zm5FZFKvGYpRqTZzxiXAwXdaeR6w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: DRM IOCTLS come regularly(every minute) still even after screen
 off
In-Reply-To: <CAAxE2A7RL+LEgwtQwH2s9_Zm5FZFKvGYpRqTZzxiXAwXdaeR6w@mail.gmail.com>
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

On 2021-09-18 09:19, Marek Olšák wrote:
> Hi,
> 
> Printing the backtrace fromsi_flush_gfx_cs while /etc/environment contains GALLIUM_THREAD=0 at boot should show which GL call and X call caused the flush.

That will most likely be glFlush in (_)glamor_block_handler, or maybe in glamor_sync_fence_set_triggered. 

The former do not get called directly from the X11 request handler which triggers the drawing. I suggest e.g. st_draw_gallium instead.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
