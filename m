Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2201B7F0
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 16:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5FA89E03;
	Mon, 13 May 2019 14:17:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BF589E03
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 14:17:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f8so5844331wrt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 07:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmMEKXkG5WoHh5btlSHCiYAgci8Da9GGt86cf0WuOHs=;
 b=YXPNBQanc3jEVKyHQRARMJPg484XRt/ver7UDWIhiyt4JWYaD2qSlN9f/SOYfRbG0D
 5U+aN7mqYVB3XHRX1WYKRiz8OAbROoIThWWU6XgVMXqDJLa3cPc/0n2n/d882yYKX/ob
 nsTFvdHS62eOHxHK4J4jkc7RBI9dmr1HLXBy2fBDEK1lFWhb7hfqPf59siD/KiPfYnYk
 r1eybkcwT/n1FHqFcKnhzs9k4uUeg/8UYR5pINzi7l3YAh7R8TUKYj8rUtNYF6LSjWDY
 sY+Wnyy8yN3SjPglkZT58H7ktuRQjOaso9H/br01n5kgJDocevxWxn33rRWaN4/f74/r
 VsPQ==
X-Gm-Message-State: APjAAAWULLF0t41b8QcQ1RSd6qJtpzGSTUWJa6x8zOUyDY/oOD9VgmCC
 kRI4Gl/0M1guZ6NvGv/MwPaEzSEa2hV7FuCLtcM=
X-Google-Smtp-Source: APXvYqypT5oUZB2F5CzCiSq3fDQTJsM5b6/+0pYBBSTEN9qvbM+BpCfwF9AtPNPBwWkHULMdUylieX45gmgDFsz8ubw=
X-Received: by 2002:adf:f44b:: with SMTP id f11mr1187592wrp.128.1557757067599; 
 Mon, 13 May 2019 07:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190513130203.7918-1-kent.russell@amd.com>
In-Reply-To: <20190513130203.7918-1-kent.russell@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 May 2019 10:17:35 -0400
Message-ID: <CADnq5_OzzE6aL2d0p22KGWVP-H1ncmrVXnR-kZvVodCou7JWew@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Add missing Polaris10 ID
To: "Russell, Kent" <Kent.Russell@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UmMEKXkG5WoHh5btlSHCiYAgci8Da9GGt86cf0WuOHs=;
 b=TqHSED2kKaHhs4OmnRLQcieXdZsk4mkt3xWlRmk+aoPNNixNcqfJdlQDflkJweNpzx
 GXzCuhj7QlDbuAwH0tI/qomFbIfQ+rH+S7+JVKO3a7JPbw1LNNsVZXKK6oBMYKWr8cUg
 KGsFxcKl4ZvP/laz3V/v8CNJ8NtU5RTMB5ep8T+EnzkHbvksLvZ4ifp0abbeqkst2w9q
 20pX/KUcx3r1keKCnz+XONtJFp9ZtaX6+LE/hwTsoG3Hzka73TvSuodDtXW8s4ezoh++
 F7nDwQUYS1XQkiPx5xyze2GRbGo808V+qQOytjhPGajHtkJqSoJSPYeMFZd0xXIc0YNx
 WbvQ==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgOTowMiBBTSBSdXNzZWxsLCBLZW50IDxLZW50LlJ1c3Nl
bGxAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHdhcyBhZGRlZCB0byBhbWRncHUgYnV0IHdhcyBt
aXNzZWQgaW4gYW1ka2ZkCj4gQ2hhbmdlLUlkOiBJYWI1OWNjZmQ1YTQyZWZhZTE4ODQ2NzQ5ZGVl
YjdjOTY0OTA4MTJkNAo+Cj4gU2lnbmVkLW9mZi1ieTogS2VudCBSdXNzZWxsIDxrZW50LnJ1c3Nl
bGxAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gaW5kZXggYTUzZGRhOTA3MWIxLi43YjRlYTI0
Yzg3ZjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gQEAg
LTM4Nyw2ICszODcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBwb3J0
ZWRfZGV2aWNlc1tdID0gewo+ICAgICAgICAgeyAweDY3Q0YsICZwb2xhcmlzMTBfZGV2aWNlX2lu
Zm8gfSwgICAgIC8qIFBvbGFyaXMxMCAqLwo+ICAgICAgICAgeyAweDY3RDAsICZwb2xhcmlzMTBf
dmZfZGV2aWNlX2luZm8gfSwgIC8qIFBvbGFyaXMxMCB2ZiovCj4gICAgICAgICB7IDB4NjdERiwg
JnBvbGFyaXMxMF9kZXZpY2VfaW5mbyB9LCAgICAgLyogUG9sYXJpczEwICovCj4gKyAgICAgICB7
IDB4NkZERiwgJnBvbGFyaXMxMF9kZXZpY2VfaW5mbyB9LCAgICAgLyogUG9sYXJpczEwICovCj4g
ICAgICAgICB7IDB4NjdFMCwgJnBvbGFyaXMxMV9kZXZpY2VfaW5mbyB9LCAgICAgLyogUG9sYXJp
czExICovCj4gICAgICAgICB7IDB4NjdFMSwgJnBvbGFyaXMxMV9kZXZpY2VfaW5mbyB9LCAgICAg
LyogUG9sYXJpczExICovCj4gICAgICAgICB7IDB4NjdFMywgJnBvbGFyaXMxMV9kZXZpY2VfaW5m
byB9LCAgICAgLyogUG9sYXJpczExICovCj4gLS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QK
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
