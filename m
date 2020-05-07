Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BB1C9B37
	for <lists+amd-gfx@lfdr.de>; Thu,  7 May 2020 21:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620546E1AA;
	Thu,  7 May 2020 19:36:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 932 seconds by postgrey-1.36 at gabe;
 Thu, 07 May 2020 19:35:11 UTC
Received: from smtpq3.tb.mail.iss.as9143.net (smtpq3.tb.mail.iss.as9143.net
 [212.54.42.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1261989C93
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 May 2020 19:35:10 +0000 (UTC)
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
 by smtpq3.tb.mail.iss.as9143.net with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dmarinus@mrns.nl>) id 1jWm3V-0001G2-Ak
 for amd-gfx@lists.freedesktop.org; Thu, 07 May 2020 21:19:37 +0200
Received: from ip-213-127-66-85.ip.prioritytelecom.net ([213.127.66.85]
 helo=routi.mrns.nl) by smtp7.tb.mail.iss.as9143.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <dmarinus@mrns.nl>) id 1jWm3U-0003je-7Z
 for amd-gfx@lists.freedesktop.org; Thu, 07 May 2020 21:19:37 +0200
Received: by routi.mrns.nl (sSMTP sendmail emulation);
 Thu, 07 May 2020 21:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mrns.nl;
 i=@mrns.nl; q=dns/txt; s=mail; t=1588879175; h=date : from : to :
 subject : message-id : mime-version : content-type : from;
 bh=UZmoGkw+HU2ldfgaUO+Vyb+OJJjJkdiVNrSi7jIizKY=;
 b=RcxboRx+fOshD8zAw7Ahq2aN7CZWMJH8MwmwEhUCruudHHny1U/jIXHNio5hBjy49ODJx
 HLEG2/aONOQ5ZklTEVkB9Xyhh4p08cHAb5eU9gR6QqhkP7EE4sN+bOMuYE3B20YKMSptpoU
 FYn2CrZXucRW5M0UDA+SDhlu2FBvNtI=
Date: Thu, 7 May 2020 21:19:35 +0200
From: D Marinus <dmarinus@mrns.nl>
To: amd-gfx@lists.freedesktop.org
Subject: builtin display using amdgpu gives a black screen on macbook pro 13, 3
Message-ID: <20200507191935.GD1799@routi.mrns.nl>
MIME-Version: 1.0
Content-Disposition: inline
X-SourceIP: 213.127.66.85
X-Authenticated-Sender: boeierlaan60@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=Ne99K1L4 c=1 sm=1 tr=0
 a=QzIsuD3EoHw0lHU0NZQLAw==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
 a=kj9zAlcOel0A:10 a=sTwFKg_x9MkA:10 a=dnA_Z5UOAAAA:20 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=pz_Te4hhSMQWMs0xVaoA:9 a=CjuIK1q_8ugA:10 a=VlZU0XKO32wA:10
 a=AjGcO6oz07-iQ99wixmX:22
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
X-Mailman-Approved-At: Thu, 07 May 2020 19:36:31 +0000
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

Hi!

Since I've updated the linux kernel to 5.6 my builtin display of my
Apple Macbook Pro 13,3 is blank. The following bug reports have been
opened:

https://github.com/Dunedan/mbp-2016-linux/issues/142
https://bugzilla.kernel.org/show_bug.cgi?id=207589
https://bugzilla.redhat.com/show_bug.cgi?id=1829174


xrandr gives the following message
xrandr: Output eDP is not disconnected but has no modes

the /sys/kernel/debug/vgaswitcheroo/switch entry is missing

lspci gives:
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Baffin [Radeon RX 460/560D / Pro
450/455/460/555/555X/560/560X] (rev ef)

Any thoughts on the cause or fix? What would be helpful information?

Thanks a lot!
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
