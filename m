Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F826572
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 16:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5B889AA2;
	Wed, 22 May 2019 14:12:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-it1-f199.google.com (mail-it1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3D0896A3
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 03:16:01 +0000 (UTC)
Received: by mail-it1-f199.google.com with SMTP id n10so828034ita.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 20:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=3nIzlGw+4wszd7mCGI8udFQIKx5mXZuEZdlx7TUEr8s=;
 b=mj9aSlm2UASdm6l7py4ggWUhi6OYMRCnaJ5Kv5l0wI7QMNbKC04Qt5483pDt/Ktoex
 mgNW0M8Xgx8j+7iLrCbxHPdCPCmuRF8G22cC36VlXPuD7O8mE2bLATAQgNUVDwsUCsuR
 qj3LdOecSx3YVFLr5mnY7AFcul3gQ0YnMNhv7X4MQpITOjG+Ohm10l7lge1LoL96bUfk
 3Y35Q5CIIGqZVSDgVmaXLV/h8u1zbwi2M/kbcnZX8lzZ1PpHxXzw1sCyCbvfY1Xhg1Ud
 N9hYmwoDVb88hlorWuMD/OP4Nb7WDdfcbFUe88mtoMwcxwi1v76WI7xwEAszfwCad77E
 itHQ==
X-Gm-Message-State: APjAAAUUZNDKaLx2Sz0ALlYJ9MEwL6qhUYsH3owm9tpikgQI3X/jkwxB
 0/Pf2MRDUSg9ws6TRtZnEQr5gwM9N4Xuzxx+YTISJp7bAghI
X-Google-Smtp-Source: APXvYqxp+o+WQM7bTF4SCjOC36sALTlwx1QmJGZsN4sPxGpKCkBFjyv3EMuUBqqVKn8wzyZnUI3z37a7vKmMtQ7mfrLWFQqBAHmU
MIME-Version: 1.0
X-Received: by 2002:a5d:9d4f:: with SMTP id k15mr7079076iok.100.1558494961163; 
 Tue, 21 May 2019 20:16:01 -0700 (PDT)
Date: Tue, 21 May 2019 20:16:01 -0700
In-Reply-To: <00000000000033a0120588fac894@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008b645c058971629b@google.com>
Subject: Re: WARNING: locking bug in inet_autobind
From: syzbot <syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com>
To: Yong.Zhao@amd.com, airlied@linux.ie, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, ast@kernel.org, bpf@vger.kernel.org, 
 christian.koenig@amd.com, daniel@ffwll.ch, daniel@iogearbox.net, 
 davem@davemloft.net, david1.zhou@amd.com, dri-devel@lists.freedesktop.org, 
 evan.quan@amd.com, felix.kuehling@amd.com, harry.wentland@amd.com, 
 kafai@fb.com, kuznet@ms2.inr.ac.ru, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, ozeng@amd.com, ray.huang@amd.com, rex.zhu@amd.com, 
 songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com, 
 yong.zhao@amd.com, yoshfuji@linux-ipv6.org
X-Mailman-Approved-At: Wed, 22 May 2019 14:12:05 +0000
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

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKCmNvbW1pdCBjMGQ5MjcxZWNiZDg5MWNk
ZWIwZmFkMWVkY2RkOTllZTcxN2E2NTVmCkF1dGhvcjogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1k
LmNvbT4KRGF0ZTogICBGcmkgRmViIDEgMjM6MzY6MjEgMjAxOSArMDAwMAoKICAgICBkcm0vYW1k
Z3B1OiBEZWxldGUgdXNlciBxdWV1ZSBkb29yYmVsbCB2YXJpYWJsZXMKCmJpc2VjdGlvbiBsb2c6
ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2Jpc2VjdC50eHQ/eD0xNDMzZWNlNGEw
MDAwMApzdGFydCBjb21taXQ6ICAgZjQ5YWExZGUgTWVyZ2UgdGFnICdmb3ItNS4yLXJjMS10YWcn
IG9mIGdpdDovL2dpdC5rZXJuZWwuby4uCmdpdCB0cmVlOiAgICAgICBuZXQtbmV4dApmaW5hbCBj
cmFzaDogICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBvcnQudHh0P3g9MTYz
M2VjZTRhMDAwMDAKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvbG9nLnR4dD94PTEyMzNlY2U0YTAwMDAwCmtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD1mYzA0NTEzMTQ3Mjk0N2Q3CmRhc2hib2FyZCBs
aW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9OTRjYzJhNjZmYzIy
OGIyM2YzNjAKc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gv
cmVwcm8uc3l6P3g9MTYzNzMxZjhhMDAwMDAKClJlcG9ydGVkLWJ5OiBzeXpib3QrOTRjYzJhNjZm
YzIyOGIyM2YzNjBAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpGaXhlczogYzBkOTI3MWVjYmQ4
ICgiZHJtL2FtZGdwdTogRGVsZXRlIHVzZXIgcXVldWUgZG9vcmJlbGwgdmFyaWFibGVzIikKCkZv
ciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6IGh0dHBzOi8vZ29vLmds
L3Rwc21FSiNiaXNlY3Rpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
