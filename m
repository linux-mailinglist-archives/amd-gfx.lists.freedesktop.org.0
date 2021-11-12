Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DB44E8ED
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Nov 2021 15:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF03A6EB78;
	Fri, 12 Nov 2021 14:31:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E8F46EB78;
 Fri, 12 Nov 2021 14:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8F82420203D;
 Fri, 12 Nov 2021 15:30:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id dEb34xO2otMD; Fri, 12 Nov 2021 15:30:58 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 54C66202034;
 Fri, 12 Nov 2021 15:30:58 +0100 (CET)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mlXZy-00083a-1Y;
 Fri, 12 Nov 2021 15:30:58 +0100
Message-ID: <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
Date: Fri, 12 Nov 2021 15:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Questions about KMS flip
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Yu, Lang" <Lang.Yu@amd.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
 <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
In-Reply-To: <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2021-11-12 15:29, Michel Dänzer wrote:
> On 2021-11-12 13:47, Christian König wrote:
>>
>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://bugzilla.kernel.org/show_bug.cgi?id=214621
>>
>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
>>
>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
> 
> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in 
> dm_plane_helper_cleanup_fb.
> 
> 
> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb

This should say amdgpu_display_unpin_work_func.


> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
> 
> 


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
