Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4CE41BFD7
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Sep 2021 09:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C181F6E187;
	Wed, 29 Sep 2021 07:25:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 29 Sep 2021 04:56:40 UTC
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682F56E16F
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Sep 2021 04:56:40 +0000 (UTC)
X-UUID: 404ef72ab28a42a6abf3d071e04a742b-20210929
X-CPASD-INFO: 64f923d47a914467a0d10e2932a58498@f4SgWV9lkmRjgXt9g3eBcYFhlGFgkVK
 IdWyBZWZkZViVhH5xTWJsXVKBfG5QZWNdYVN_eGpQYl9gZFB5i3-XblBgXoZgUZB3hXagWWJhlA==
X-CPASD-FEATURE: 0.0
X-CLOUD-ID: 64f923d47a914467a0d10e2932a58498
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, EXT:0.0, OB:0.0,
 URL:-5, T
 VAL:222.0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:84.0, IP:-2.0, MAL:0.0,
 ATTNUM:0.
 0, PHF:-5.0, PHC:-5.0, SPF:4.0, EDMS:-3, IPLABEL:4480.0, FROMTO:0, AD:0,
 FFOB:0.0, CFO
 B:0.0, SPC:0.0, SIG:-5, AUF:7, DUF:15245, ACD:56, DCD:158, SL:0, AG:0,
 CFC:0.271, CFSR: 0.094,UAT:0,RAF:0,VERSION:2.3.4
X-CPASD-ID: 404ef72ab28a42a6abf3d071e04a742b-20210929
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1, 1
X-UUID: 404ef72ab28a42a6abf3d071e04a742b-20210929
X-User: lizhenneng@kylinos.cn
Received: from [172.20.108.41] [(116.128.244.169)] by nksmu.kylinos.cn
 (envelope-from <lizhenneng@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
 with ESMTP id 203180631; Wed, 29 Sep 2021 12:48:39 +0800
From: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
Subject: amdgpu driver halted on suspend of shutdown
Message-ID: <f5d30be9-7980-e44d-0eca-7cfe7c0c1d05@kylinos.cn>
Date: Wed, 29 Sep 2021 12:50:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 29 Sep 2021 07:25:35 +0000
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

Hello:

         When I do loop  auto test of reboot, I found  kernel may halt 
on memcpy_fromio of amdgpu's amdgpu_uvd_suspend, so I remove suspend 
process in amdgpu_pci_shutdown, and it will fix this bug.

I have 3 questions to ask:

1. In amdgpu_pci_shutdown, the comment explains why we must execute 
suspend,  so I know VM will call amdgpu driver in which situations, as I 
know, VM's graphics card is a virtual card;

2. I see a path that is commited by Alex Deucher, the commit message is 
as follows:

drm/amdgpu: just suspend the hw on pci shutdown

We can't just reuse pci_remove as there may be userspace still
     doing things.

My question is:In which situations, there may be  userspace till doing 
things.

3. Why amdgpu driver is halted on memcpy_fromio of amdgpu_uvd_suspend, I 
haven't launch any video app during reboot test, is it the bug of pci bus?

Test environment:

CPU: arm64

Graphics card: r7340(amdgpu), rx550

OS: ubuntu 2004

