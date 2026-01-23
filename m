Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFQ2MKsKc2mWrwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Jan 2026 06:44:11 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756FD7086A
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Jan 2026 06:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E090410E11D;
	Fri, 23 Jan 2026 05:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=king.net.nz header.i=@king.net.nz header.b="gOatuKHE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 2456 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jan 2026 05:44:06 UTC
Received: from bob.king.net.nz (juliet.king.net.nz [202.49.187.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5750810E11D
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Jan 2026 05:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=king.net.nz
 ; s=s1;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version
 :Date:Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D6wBr+10N6to9ARjnjSuop1M5AfSsaVU8z0vaSewEKQ=; b=gOatuKHEfDpttKCf/QQfGsaAy3
 x+mJZYd2r98p2oG/C/ObFfKMV4MMgJd8kfcnrX+1xiRVzraJ7z8ZJTzOZ3cDfnzHLm7UUBtRSFgIr
 GHE1y8IE7E4BW/cl05yOkk9oI6NkGQCz/4EXqG/2pbAqC+81woIQmoqAXVPTdOhRgbJY=;
Received: from 122-63-133-99.mobile.spark.co.nz ([122.63.133.99]:15502
 helo=[192.168.240.207])
 by juliet.king.net.nz with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <alex@king.net.nz>) id 1vj9K8-002Dkf-3D
 for amd-gfx@lists.freedesktop.org; Fri, 23 Jan 2026 18:03:09 +1300
Message-ID: <04b9c31c-1f60-465d-9316-44997555af00@king.net.nz>
Date: Fri, 23 Jan 2026 18:03:07 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: amd-gfx@lists.freedesktop.org
Content-Language: en-US
From: Alex King <alex@king.net.nz>
Subject: Problem with Hardware cursor on AMD RV730
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[king.net.nz : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[king.net.nz:s=s1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[amd-gfx];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.743];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[alex@king.net.nz,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[king.net.nz:-]
X-Rspamd-Queue-Id: 756FD7086A
X-Rspamd-Action: no action

Hi,

I have a problem that the mouse cursor disappears after being logged in 
for some time (e.g. 15 - 30 minutes,) and while the mouse can still has 
en effect (e.g. I can see different elements on the screen getting focus 
as I move the mouse, the cursor no longer displays making it practically 
unusable.

A reboot is required to get the cursor back.


I see a few other reports of the same problem on the internet, e.g.

https://forums.linuxmint.com/viewtopic.php?t=439325
https://www.reddit.com/r/linuxmint/comments/1cqnome/mouse_cursor_disappears/
https://forums.linuxmint.com/viewtopic.php?t=357803

The common workaround is to set a software cursor in Xorg.conf. I'm 
using wayland and I don't see a way to do that with wayland. I'd switch 
back to Xorg with a software cursor if that would work and its the only 
workaround.

I didn't have this problem on the previous Debian version, so I'm 
considering reverting the kernel to an earlier one to see if that helps.

Does anyone have further tips on troubleshooting this?  E.g. should I 
diff the changes between driver versions and try to work out what's 
changed relating to the cursor?  I'm not familiar with display driver 
code but I'd kind of be interested to have a look if it was likely to be 
of use.

Some system details below.



I've got an older Mac (iMac11,2) and I'm running Debian Trixie on it.

It has RV730 inbuilt video:

$lspci

...

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
[AMD/ATI] RV730/M96-XT [Mobility Radeon HD 4670]
     Subsystem: Apple Inc. Device 00b6
     Kernel driver in use: radeon
     Kernel modules: radeon, amdgpu


I have this file:

/usr/lib/modules/6.12.63+deb13-amd64/kernel/drivers/gpu/drm/radeon/radeon.ko.xz

which I assume is the driver:

alex@amac:~$ lsmod|grep radeon
radeon               1929216  28
i2c_algo_bit           16384  2 amdgpu,radeon
drm_suballoc_helper    12288  2 amdgpu,radeon
drm_display_helper    274432  2 amdgpu,radeon
drm_ttm_helper         16384  2 amdgpu,radeon
ttm                   106496  3 amdgpu,radeon,drm_ttm_helper
drm_kms_helper        253952  4 
drm_display_helper,amdgpu,radeon,drm_ttm_helper
drm                   774144  22 
gpu_sched,drm_kms_helper,drm_exec,drm_suballoc_helper,drm_display_helper,drm_buddy,amdgpu,radeon,drm_ttm_helper,ttm,amdxcp
video                  81920  2 amdgpu,radeon



Thanks,
Alex

