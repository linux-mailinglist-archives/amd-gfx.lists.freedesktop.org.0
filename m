Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F706BF1E
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB7E6E207;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3347893E8
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 08:58:07 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id e20so26221424ioe.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 01:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=xGhpke50w1HUdO4d+bMv4tRJs7OApHioe/mQSw+3RDI=;
 b=h90jtO9V/Rn19s0rk1DCqgH2b2skRNBMIOH0zjEX4xRPy0qdiWGstuRAQXWjIaPa4U
 6fsp3sMnb4UogeAklDakHKLNaL+sKHzeJN8WZfD9ao1PTfycDjgwThN09EGAWByu8wjr
 YxbwAw6JNKPsVj3k/w2ir98PgTjW4BvI+Fo27YFAdMBk465fmKW3y1zgFMYuVaaixg18
 2Vg/GMr+a9/XDFKSSZGl1Jprf19ZRwxRpT70agSg8bAUGt/12GZ/81ppDw7vADbnJig2
 FEgMINKtgjfcUYVv2ZeqaxaIgBDVAFgCsqiVlTE7V6Myp2yamcm2ucJEX8MN4uXOg4sP
 3s0g==
X-Gm-Message-State: APjAAAW6opE3NhI4Atap7c1aJBkYrMnKLMP8+YKQxFWhrDgJGaSxqj2c
 hCmBc4CuR70ISp0HEZj7VK6vnKC3SMfEQsRhmIJLczCiXPxR
X-Google-Smtp-Source: APXvYqw7It60pOBuNYJfJLi1piGKUvvfXpqDCoRvvkiel4I1k+kLvg6kN7FksQE73xl+q4o2wU76sxcen7uKp5mgmj9gq5yWQ7Dj
MIME-Version: 1.0
X-Received: by 2002:a5d:9e48:: with SMTP id i8mr34368541ioi.51.1563353887164; 
 Wed, 17 Jul 2019 01:58:07 -0700 (PDT)
Date: Wed, 17 Jul 2019 01:58:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001a51c4058ddcb1b6@google.com>
Subject: kernel panic: stack is corrupted in pointer
From: syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>
To: airlied@linux.ie, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 ast@kernel.org, christian.koenig@amd.com, daniel@iogearbox.net, 
 david1.zhou@amd.com, dri-devel@lists.freedesktop.org, leo.liu@amd.com, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
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

SGVsbG8sCgpzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBjcmFzaCBvbjoKCkhFQUQgY29tbWl0
OiAgICAxNDM4Y2RlNyBBZGQgbGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAxOTA3MTYK
Z2l0IHRyZWU6ICAgICAgIGxpbnV4LW5leHQKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEzOTg4MDU4NjAwMDAwCmtlcm5lbCBjb25maWc6
ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD0zNDMwYTE1MWUxNDUy
MzMxCmRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0
aWQ9NzlmNWYwMjgwMDVhNzdlY2I2YmIKY29tcGlsZXI6ICAgICAgIGdjYyAoR0NDKSA5LjAuMCAy
MDE4MTIzMSAoZXhwZXJpbWVudGFsKQpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0xMTFmYzhhZmEwMDAwMAoKVGhlIGJ1ZyB3YXMgYmlz
ZWN0ZWQgdG86Cgpjb21taXQgOTZhNWQ4ZDQ5MTVmM2UyNDFlYmI0OGQ1ZGVjZGQxMTBhYjljN2Rj
ZgpBdXRob3I6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KRGF0ZTogICBGcmkgSnVsIDEzIDE1
OjI2OjI4IDIwMTggKzAwMDAKCiAgICAgZHJtL2FtZGdwdTogTWFrZSBzdXJlIElCIHRlc3RzIGZs
dXNoZWQgYWZ0ZXIgSVAgcmVzdW1lCgpiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTRhNDYyMDA2MDAwMDAKZmluYWwgY3Jhc2g6ICAg
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTE2YTQ2MjAwNjAw
MDAwCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50
eHQ/eD0xMmE0NjIwMDYwMDAwMAoKSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBidWcsIHBsZWFz
ZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcgdG8gdGhlIGNvbW1pdDoKUmVwb3J0ZWQtYnk6IHN5emJv
dCs3OWY1ZjAyODAwNWE3N2VjYjZiYkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCkZpeGVzOiA5
NmE1ZDhkNDkxNWYgKCJkcm0vYW1kZ3B1OiBNYWtlIHN1cmUgSUIgdGVzdHMgZmx1c2hlZCBhZnRl
ciBJUCAgCnJlc3VtZSIpCgpLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc3RhY2stcHJvdGVj
dG9yOiBLZXJuZWwgc3RhY2sgaXMgY29ycnVwdGVkIGluOiAgCnBvaW50ZXIrMHg3MDIvMHg3NTAg
bGliL3ZzcHJpbnRmLmM6MjE4NwpTaHV0dGluZyBkb3duIGNwdXMgd2l0aCBOTUkKS2VybmVsIE9m
ZnNldDogZGlzYWJsZWQKCgotLS0KVGhpcyBidWcgaXMgZ2VuZXJhdGVkIGJ5IGEgYm90LiBJdCBt
YXkgY29udGFpbiBlcnJvcnMuClNlZSBodHRwczovL2dvby5nbC90cHNtRUogZm9yIG1vcmUgaW5m
b3JtYXRpb24gYWJvdXQgc3l6Ym90LgpzeXpib3QgZW5naW5lZXJzIGNhbiBiZSByZWFjaGVkIGF0
IHN5emthbGxlckBnb29nbGVncm91cHMuY29tLgoKc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0
aGlzIGJ1ZyByZXBvcnQuIFNlZToKaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3N0YXR1cyBmb3IgaG93
IHRvIGNvbW11bmljYXRlIHdpdGggc3l6Ym90LgpGb3IgaW5mb3JtYXRpb24gYWJvdXQgYmlzZWN0
aW9uIHByb2Nlc3Mgc2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9uCnN5emJvdCBj
YW4gdGVzdCBwYXRjaGVzIGZvciB0aGlzIGJ1ZywgZm9yIGRldGFpbHMgc2VlOgpodHRwczovL2dv
by5nbC90cHNtRUojdGVzdGluZy1wYXRjaGVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
