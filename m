Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A3BBD41
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 22:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FBE88C49;
	Mon, 23 Sep 2019 20:45:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8EA89D64
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 20:35:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w67so11202225lff.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 13:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=QWJtYqntFBw0xMyVPOvjVwD764B7OiYsnP6PokDpdpM=;
 b=g2TjDEfE8/UTd1FxZFp7ZMxdKOpNthgJyTWHB9VkIR3OXTCck9+o3iyBC0L1+lkGYO
 dCm2bmlQbf1YxXNseyG8ZQtn3Ts2dS3NcXis+LM8p6u4AfgsGNNcAMa/OJYdf6osjzUJ
 YLwqkKS/NshWC5vDER1jXXuOGrAkMsNh8ycmV2pygEmX0YjVNdsRLeV9XIn2jYTtPbdX
 1QNtGJ/fgm4i+v7Rh5y6Gv2sKWVzu1Vb7cvwCCluDffzkL1cWjD9P5Gk5gtkBWV9EEdo
 JWm+K7COkA6+3KjFo5xckfRdxz/yN4f/PLTx9PZ4cRPQ4VrjVbEt9WFIMaXsyHrmdO7j
 GJYw==
X-Gm-Message-State: APjAAAV2nmz1ULWkIyjMsp3KXQylJ5YI20709fL9FoD9hMusSqW6jIlA
 Rho/GdiC1fUkUkfxfZc0eT8xfxX3hS0aaFExv76jxW4igw==
X-Google-Smtp-Source: APXvYqyqYnGgnW3+ZUYtKnhNCDg1f5e28pt6x3tHN7zkoeiGR3F2eMfRT063nzJdvQ5CqbJEE+WxCHy8IgBIPmt7YjE=
X-Received: by 2002:a19:2c1:: with SMTP id 184mr858442lfc.100.1569270916944;
 Mon, 23 Sep 2019 13:35:16 -0700 (PDT)
MIME-Version: 1.0
From: Gabriel C <nix.or.die@gmail.com>
Date: Mon, 23 Sep 2019 22:34:46 +0200
Message-ID: <CAEJqkggb9ozmLtqkdm40NTXw=YAo-VZwrxPk+43YC-zkV__=Vw@mail.gmail.com>
Subject: [amdgpu] backlight mismatch
To: amd-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 23 Sep 2019 20:45:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=QWJtYqntFBw0xMyVPOvjVwD764B7OiYsnP6PokDpdpM=;
 b=V3cLe2tNDpGkS9IpLEp9EE7cJS0+jF8E1gfu4RYHzDyom2kDmEc2VbKnz1fSRkwy5x
 wZSjB+VISMY51zwFOEtrtEBx4WF/WhjNx0syihVn4gR1DjmsncmNBeMbbQmigzmcgzX9
 Iq2RABnY0aUQjJBvZWXK1ua6Y0i4Qol/0MgdOlTfqo+LFI5meZin6ap2u3obUMs0kRU7
 S07ObwvQsIJG1ZtTycZBp0GomDHYrlAyCCRd9nboMs3lfBjK1ssNa8TZiWRkE3pTiflu
 1WVw8oPi58FGCJ1A1CKot+yaOjbAh2+oNxwrtuQH+MvEmLapO0iwiDmRbAgOWHUo/tAl
 wNlg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8sCgpvbiBteSBuZXcgQWNlciBOaXRybyA1IChBTjUxNS00My1SOEJGKSBiYWNrbGlnaHQg
YW5kIGFjdHVhbF9iYWNrbGlnaHQgdmFsdWUKaW4gc3lzZnMgbWlzbWF0Y2guIFdoZW4gYmFja2xp
Z2h0IGlzIDAgYWN0dWFsX2JhY2tsaWdodCBpcyBzdGlsbCA1MTQwLgoKcm9vdEBuaXRybzU6L3N5
cy9jbGFzcy9iYWNrbGlnaHQvYW1kZ3B1X2JsMSMgY2F0IGJyaWdodG5lc3MKMjU1CnJvb3RAbml0
cm81Oi9zeXMvY2xhc3MvYmFja2xpZ2h0L2FtZGdwdV9ibDEjIGNhdCBhY3R1YWxfYnJpZ2h0bmVz
cwo2NTUzNQpyb290QG5pdHJvNTovc3lzL2NsYXNzL2JhY2tsaWdodC9hbWRncHVfYmwxIyBlY2hv
IDAgPmJyaWdodG5lc3MKcm9vdEBuaXRybzU6L3N5cy9jbGFzcy9iYWNrbGlnaHQvYW1kZ3B1X2Js
MSMgY2F0IGFjdHVhbF9icmlnaHRuZXNzCjUxNDAKClRoZSBsYXB0b3AgaGFzIGEgaHlicmlkIHNl
dHVwIFBpY2Fzc28rUG9sYXJpczExLgoKMDE6MDAuMCBEaXNwbGF5IGNvbnRyb2xsZXIgWzAzODBd
OiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCltBTUQvQVRJXSBCYWZmaW4gW1JhZGVvbiBS
WCA0NjAvNTYwRCAvIFBybwo0NTAvNDU1LzQ2MC81NTUvNTU1WC81NjAvNTYwWF0gWzEwMDI6Njdl
Zl0gKHJldiBjMCkKMDU6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyIFswMzAwXTogQWR2
YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgpbQU1EL0FUSV0gUGljYXNzbyBbMTAwMjoxNWQ4XSAo
cmV2IGMxKQoKWyAgICA0LjU5NDY5NF0gW2RybV0gaW5pdGlhbGl6aW5nIGtlcm5lbCBtb2Rlc2V0
dGluZyAoUE9MQVJJUzExCjB4MTAwMjoweDY3RUYgMHgxMDI1OjB4MTM2NyAweEMwKS4KWyAgICA0
Ljg2NjY5Nl0gW2RybV0gaW5pdGlhbGl6aW5nIGtlcm5lbCBtb2Rlc2V0dGluZyAoUkFWRU4KMHgx
MDAyOjB4MTVEOCAweDEwMjU6MHgxMzY2IDB4QzEpLgoKUGxlYXNlIGxldCBtZSBrbm93IHdoYXQg
b3RoZXIgaW5mb3JtYXRpb25zIHlvdSBtYXkgbmVlZC4KCkJlc3QgUmVnYXJkcywKCkdhYnJpZWwg
Qy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
