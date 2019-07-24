Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE47243C
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 04:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20D76E41D;
	Wed, 24 Jul 2019 02:07:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED166E41A
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 01:40:01 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id f22so49270286ioj.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 18:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=w92/D4APly1S0dijjuo/84NrUKS2JIroIh/+k83Y0Yg=;
 b=nOA4Sziz1JDwt7JqnFcuoXF8y+pkcW0YoJwBcFqN7z+6/YEnCCeor5uNi6eN0p5wvm
 j0u/Vu6s0tSt4KA7EE9FvXui+yl/bTOsXvjV9etpVpetZsA+BycaxIN7bLrtkTbNgpc+
 aIsDVgSE+L/4bm6f72Grtkd6Cc7Z88+YAiUdWMsMsxxhU8V7P/x/2LRD+qb0KyCqAMqG
 NrE6RB74PIrhwMLv9epzE67Q6OGyQ022o6TGQjiuVf11SDaXX9CAB0DBKmQMMJZqlxL/
 uPD4pXbOt+HV+WfhQXx5ZAz8Q9h0rmbtQUdZf4wGgA0kbSxf+S/sp8blahwbr1XR14yZ
 eHMQ==
X-Gm-Message-State: APjAAAW6WZ8XoGVrW8VpPc1ZGnGKkWYsQlI+mQPK0MeHAAdUcdQ9wxIE
 7xNSbHC/EoAYo5ZnP8ZZlNLI+wpR1nEIvGj5xeo4Ueb2bsQ5
X-Google-Smtp-Source: APXvYqxZV7f2M7mWAmPB7Zk6w2/BTeh9n6/BKLJgP5HdF+ftj8Txa1VpP1wlpVLNOViX/+n9pFrEH7CBKE5ifAlRW9n+RxMquc0l
MIME-Version: 1.0
X-Received: by 2002:a05:6638:691:: with SMTP id
 i17mr82704018jab.70.1563932401090; 
 Tue, 23 Jul 2019 18:40:01 -0700 (PDT)
Date: Tue, 23 Jul 2019 18:40:01 -0700
In-Reply-To: <5d3744ff777cc_436d2adb6bf105c41c@john-XPS-13-9370.notmuch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000384ae4058e636360@google.com>
Subject: Re: kernel panic: stack is corrupted in pointer
From: syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>
To: airlied@linux.ie, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 ast@kernel.org, bpf@vger.kernel.org, christian.koenig@amd.com, 
 daniel@iogearbox.net, david1.zhou@amd.com, dri-devel@lists.freedesktop.org, 
 dvyukov@google.com, john.fastabend@gmail.com, leo.liu@amd.com, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 24 Jul 2019 02:07:33 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8sCgpzeXpib3QgaGFzIHRlc3RlZCB0aGUgcHJvcG9zZWQgcGF0Y2ggYW5kIHRoZSByZXBy
b2R1Y2VyIGRpZCBub3QgdHJpZ2dlciAgCmNyYXNoOgoKUmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTog
IApzeXpib3QrNzlmNWYwMjgwMDVhNzdlY2I2YmJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQoK
VGVzdGVkIG9uOgoKY29tbWl0OiAgICAgICAgIGRlY2I3MDVlIGxpYmJwZjogZml4IHVzaW5nIHVu
aW5pdGlhbGl6ZWQgaW9jdGwgcmVzdWx0cwpnaXQgdHJlZTogICAgICAgYnBmCmtlcm5lbCBjb25m
aWc6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD04NzMwNWMzY2E5
YzI1YzcwCmNvbXBpbGVyOiAgICAgICBnY2MgKEdDQykgOS4wLjAgMjAxODEyMzEgKGV4cGVyaW1l
bnRhbCkKCk5vdGU6IHRlc3RpbmcgaXMgZG9uZSBieSBhIHJvYm90IGFuZCBpcyBiZXN0LWVmZm9y
dCBvbmx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
