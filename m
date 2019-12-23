Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB24129818
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Dec 2019 16:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A5E6E2D6;
	Mon, 23 Dec 2019 15:26:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8596E252
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Dec 2019 10:31:02 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id x10so6811608iob.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Dec 2019 02:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=dqTElktPjJ2Vq8ttJgKuJA9Bl554Cdxgp9MbKD3t3zo=;
 b=c4kwYmTMRdJ2ZOjM1G6fA1jradRh3BOO0bmFSlmoU2TkFIGP2WzpOhqB/dwRqRYyYD
 n3FyKNEdk6e82s52p4PbVPP6z+bJ2UUXZtnVKPEWKFmHyBINhzBTYNAoown/bo91KsEG
 1BzFGan1W9j8nEWc0GeZX27o7s8zCtAfrRB1slySj6/6zuGdAPo8AMxLSm0B+hEJePMi
 zNWQTQ02WKot9//3pNSmSfxW/uj0OLdGPHb1vhN6DAPY0I3WtC8ilJBGuuoLkHbnJQf+
 CCCvlVj+npdnlNzozedPh9kXATWn1TQ+CsPPDUzx18Jot0khL1J6sJKF2cKscYxTccOI
 jlhQ==
X-Gm-Message-State: APjAAAX86OQLZD1Bt1vpbxHNZw/y5/wB6h1x/jzYohsqCng4gyFqD57x
 pvn8FCnQgf1DcDQBIgIdPtxgYcfcHj4jkVw40VyQxcsks1V0
X-Google-Smtp-Source: APXvYqxEBMubw04vHq957mYKngz32+OjAQ3cw+9AYwNkakf/69ewcoi2c7rjqs7UBeIlpsKYjtAm+5xfxmOXI3E52HSsX0TrkLqS
MIME-Version: 1.0
X-Received: by 2002:a02:7086:: with SMTP id f128mr22175027jac.12.1577097061494; 
 Mon, 23 Dec 2019 02:31:01 -0800 (PST)
Date: Mon, 23 Dec 2019 02:31:01 -0800
In-Reply-To: <00000000000082b80f059a56da1f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002074ef059a5c86e2@google.com>
Subject: Re: INFO: task hung in fb_release
From: syzbot <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>
To: Rex.Zhu@amd.com, airlied@linux.ie, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, b.zolnierkie@samsung.com, 
 christian.koenig@amd.com, daniel.vetter@ffwll.ch, david1.zhou@amd.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 rex.zhu@amd.com, sam@ravnborg.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 23 Dec 2019 15:26:04 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

syzbot has bisected this bug to:

commit e3933f26b657c341055443103bad331f4537b113
Author: Rex Zhu <Rex.Zhu@amd.com>
Date:   Tue Jan 16 10:35:15 2018 +0000

     drm/amd/pp: Add edit/commit/show OD clock/voltage support in sysfs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b5a799e00000
start commit:   c6017471 Merge tag 'xfs-5.5-fixes-2' of git://git.kernel.o..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11b5a799e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16b5a799e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f6119e2e3675a73
dashboard link: https://syzkaller.appspot.com/bug?extid=d130c4a0890561cfac5b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b1925e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b9623ee00000

Reported-by: syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com
Fixes: e3933f26b657 ("drm/amd/pp: Add edit/commit/show OD clock/voltage  
support in sysfs")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
