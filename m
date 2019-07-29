Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40E7997F
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932B6E288;
	Mon, 29 Jul 2019 20:15:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618589DD8
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:31 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 34so24549883uar.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U+IX0xR4ChoJVUn/Q1WTb/AIWClN4EPsZgoFVZ+mJhs=;
 b=c5JlNT/Bs7IjHGPBRA4amfz+W82i8kZlfkXNGdC6x52l1p6Ul6EoXCDWnJbL2/TREJ
 sFzeV3ubXlDl33xQiCh68VQ1RSZEcx20XlVIwnbXa+5gRn4QfbI0XGmiObbN2qdFiknZ
 3NdYyqQ608G2rlefyzlz5fDho25ON5kHzduXqAsBu+ZyqC8EN+BgfxyvSndpnF6B9fkK
 II7Ak7ymfN+aE63FeZglGfhjNkeOwtXMTCd6b6mrsTaHa0QRFlrn4Zpctg6FjNZGz6Y/
 Qbs+bHs4goMji0WBKruOcr92aMvAwbfAd8NpP9hKi8b2Pj2M6VpNcMds5Fjc+Y7HzAja
 nfrA==
X-Gm-Message-State: APjAAAUbIZF9mo6ASEWR+nIgOxXFJzFFVn1BoInkFoB7ptI44oDsYagM
 47110Fa/Vbf4dGL/AKlow6KSy0ak
X-Google-Smtp-Source: APXvYqz6eLZdxis8VGCUB5oceaHljXEtIIwBEW6kqjml67zAhP71NyzWRsGJPte/b/ZbvWmEg68WAQ==
X-Received: by 2002:ab0:3391:: with SMTP id y17mr40702603uap.139.1564431329939; 
 Mon, 29 Jul 2019 13:15:29 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/30] drm/amd/include: adjust base offset of SMUIO and THM
 for Arcturus
Date: Mon, 29 Jul 2019 15:14:49 -0500
Message-Id: <20190729201508.16136-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+IX0xR4ChoJVUn/Q1WTb/AIWClN4EPsZgoFVZ+mJhs=;
 b=NSuCS7OFg8Y0MpiQV5OP4bfDbdPtgVgmcUNGcsQ8cujU5uDifFsI6P6KivLrvEfXJD
 Zrq+hLx5QD/Z2LI8TWvGpWbYzlwJmLcAE0IpAQ2cYLAUWkZgPMYsa4WHD3r87HNzakJR
 rEVgr5A3r82AnnCoM/8NtW8nKVIIIflzuL1cwLmjSXsk0DmihSeWz60514GvUoXJ7VsU
 Yl3YKqMHKi4TfJf45kKzDkidq/r09e6ygI9gyj3CtCK/Is6UZZdGlU0oZrUc4gnicWDX
 uiJ5HMREeWxgVGYVo+2GOrEjM4gekoCmIXwZqEu++k1nKCls/Frad6hv4C9yu99rIJjD
 pkag==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpBcmN0dXJ1cyBoYXMgZGlmZmVyZW50IF9CQVNF
X0lEWCB2YWx1ZSBpbiBzb21lIEhXSVBfb2Zmc2V0LmguIFRvIG1ha2Ugc291cmNlCmZpbGVzIGxp
a2Ugc211X3YxMV8wLmMgYW5kIHNvYzE1LmMgdGhhdCBpbmNsdWRlIEhXSVBfb2Zmc2V0Lmggb2Yg
VmVnYTIwCnJldXNhYmxlIGZvciBBcmN0dXJ1cywgYWxpZ24gdGhpcyBiYXNlIG9mZnNldCB3aXRo
IFZlZ2EyMC4KClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgpSZXZpZXdlZC1i
eTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9hcmN0X2lwX29mZnNldC5oIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvYXJjdF9pcF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9hcmN0X2lwX29mZnNldC5oCmluZGV4IDMyMTFiM2E5NmQ2OC4uYTc3OTFhOWUx
ZjkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXJjdF9pcF9vZmZz
ZXQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXJjdF9pcF9vZmZzZXQuaApA
QCAtMTk2LDE3ICsxOTYsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIFNETUE3X0JB
U0UgICAgICAgICAgICA9eyB7IHsgeyAweDAwMDEzODAwLCAweDAwMDFGNDAKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCwgMCB9IH0sCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAs
IDAgfSB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsgeyAwLCAw
LCAwLCAwLCAwLCAwIH0gfSB9IH07Ci1zdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgU01VSU9f
QkFTRSAgICAgICAgICAgID17IHsgeyB7IDB4MDAwMTIwODAsIDB4MDAwMTY4MDAsIDB4MDAwMTZB
MDAsIDB4MDA0MDEwMDAsIDB4MDA0NDAwMDAsIDAgfSB9LAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwLCAwIH0gfSwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCwgMCB9IH0sCitz
dGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgU01VSU9fQkFTRSAgICAgICAgICAgID17IHsgeyB7
IDB4MDAwMTY4MDAsIDB4MDAwMTZBMDAsIDAsIDAsIDAsIDAgfSB9LAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwLCAwIH0gfSwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCwgMCB9
IH0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAs
IDAsIDAsIDAgfSB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsg
eyAwLCAwLCAwLCAwLCAwLCAwIH0gfSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCwgMCB9IH0gfSB9Owotc3RhdGljIGNvbnN0IHN0cnVj
dCBJUF9CQVNFIFRITV9CQVNFICAgICAgICAgICAgPXsgeyB7IHsgMHgwMDAxMjA2MCwgMHgwMDAx
NjYwMCwgMHgwMDQwMEMwMCwgMCwgMCwgMCB9IH0sCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAsIDAgfSB9LAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwLCAwIH0gfSwKK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBUSE1fQkFTRSAgICAgICAgICAgID17IHsgeyB7IDB4MDAw
MTY2MDAsIDAsIDAsIDAsIDAsIDAgfSB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwLCAwIH0gfSwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCwgMCB9IH0sCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAsIDAgfSB9LAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
