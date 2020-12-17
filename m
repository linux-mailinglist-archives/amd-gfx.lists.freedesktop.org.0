Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C332DD3E2
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Dec 2020 16:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8876E40D;
	Thu, 17 Dec 2020 15:15:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1368 seconds by postgrey-1.36 at gabe;
 Thu, 17 Dec 2020 15:13:03 UTC
Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0371F6E40B
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Dec 2020 15:13:03 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www74.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <klaus.kusche@computerix.info>)
 id 1kpubb-0004AY-VD; Thu, 17 Dec 2020 15:50:11 +0100
Received: from [95.91.111.52] (helo=[192.168.178.21])
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <klaus.kusche@computerix.info>)
 id 1kpubb-000ElD-Rj; Thu, 17 Dec 2020 15:50:11 +0100
From: Klaus Kusche <klaus.kusche@computerix.info>
Subject: [bug report]: Black screen in 5.10
To: alexander.deucher@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>
References: <30c555d1-e019-3668-c35b-021003e2a6e2@computerix.info>
 <20191021114731.GZ2819@lahna.fi.intel.com>
 <f5d7c7da-c7f3-df87-75b9-48db12f640fb@computerix.info>
 <20191021130541.GG2819@lahna.fi.intel.com>
 <cebaf35c-a5f5-94b1-7ccc-0e9636c95bc3@computerix.info>
 <20191021162022.GV2819@lahna.fi.intel.com>
 <313ae966-aae5-92a9-4eeb-02fec9cc43d4@computerix.info>
Message-ID: <1bd561bb-593b-0576-93b8-eb70f37dcf79@computerix.info>
Date: Thu, 17 Dec 2020 15:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <313ae966-aae5-92a9-4eeb-02fec9cc43d4@computerix.info>
Content-Language: en-US
X-Authenticated-Sender: klaus.kusche@computerix.info
X-Virus-Scanned: Clear (ClamAV 0.102.4/26019/Wed Dec 16 15:36:02 2020)
X-Mailman-Approved-At: Thu, 17 Dec 2020 15:15:37 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


Hello,

I don't know where and how to report amdgpu bugs 
as the freedesktop.org bugzilla is closed...

My problem:

With kernel 5.10.x, both the internal notebook display and any external screen
become black (or go to the "off" state?) when the kernel boots
(one or two seconds after the VGA text console is shown), 
and the system no longer reacts.

5.9.x is fine.

This seems to happen as soon as the amdgpu kernel driver loads/initializes,
even in pure text mode (VGA console or framebuffer), without starting X.

Dell Precision notebook with 
AMD Radeon (TM) Pro WX 3200 Series (POLARIS12, DRM 3.39.0, 5.9.15-gentoo, LLVM 11.0.0) (0x6981)

Tried all combinations of DC/non-DC, FB/non-FB kernel configurations
(even happens when configuring Amdgpu without framebuffer!).

Many thanks for any help!

-- 
Prof. Dr. Klaus Kusche
Private address: Rosenberg 41, 07546 Gera, Germany
+49 365 20413058 klaus.kusche@computerix.info https://www.computerix.info
Office address: DHGE Gera, Weg der Freundschaft 4, 07546 Gera, Germany
+49 365 4341 306 klaus.kusche@dhge.de https://www.dhge.de
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
