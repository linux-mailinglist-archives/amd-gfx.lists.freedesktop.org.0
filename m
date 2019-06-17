Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8000948E0D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB048895C8;
	Mon, 17 Jun 2019 19:18:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78008951B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:17 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i34so6890601qta.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsPqS6T2/pvXuHcNi1zRglmw3I7O2LzP0eEWggwDgCw=;
 b=Qn4gPg7oY2CoHs7svQ3iX0dJWsLOlUJViTT3+++JnX31DeKFMl2XMIG6mjlnzSPesT
 39rdIjrdtxdF2PpNWgHOEW57QvD8TJVzYOAFlNCuJAR5ODyvouMPfP4+ec9IagZOvQ7y
 r4zhydER9XkeYchMD9XdOpO/wef3zl7rZORn7ZAzFwaGRvbK4PWn0M6k8hsdc118SUgG
 RrGTdkJksYBX+vRDe31DPWYcHabosUcQsupYSgM7C8x7derRbLOBvcDa0EMKGFvJHL1p
 BUfx/Ydrs8avaT/zQh7VGBjXe/M52kQDdCRtonCMEw5cm0Gph98kpd6Y3UW0K84aI8Hr
 ag5g==
X-Gm-Message-State: APjAAAWSTR0FEp2dMqa2rJyi+ewR7EQ6NOsUKWBt0oL8SvzLKUAGp2AP
 KK52/vB0mMBHw+F+RLVsJ31kLX4hH5M=
X-Google-Smtp-Source: APXvYqwVg0lh/+WnVi1BskZcerSLQ6VOzHqC5vo21dH0YEB51lnY/Bhe9wfb/0NiX4KW+XXK7xytig==
X-Received: by 2002:ac8:33f4:: with SMTP id d49mr81718653qtb.23.1560799096756; 
 Mon, 17 Jun 2019 12:18:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 077/459] drm/amdgpu/psp: perform tmr_init and asd_init after
 loading sysdrv/sos
Date: Mon, 17 Jun 2019 14:10:38 -0500
Message-Id: <20190617191700.17899-66-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsPqS6T2/pvXuHcNi1zRglmw3I7O2LzP0eEWggwDgCw=;
 b=o4OW0bF89VpOc4QkgK+8gl/25f+JxRzKWpeHyDxuAR2z3/f7exjo3bifCbFjIWopDO
 xn91JdQXBhAZ3SEL40lQOUq+vBCDXIWujJek8f9SvqEPLMhe3l4Q0+Y/T/nsoTtVHmEa
 TPe9lw+wkoEcQC3kSITefhUlO40qIaDcyJH5vVNxRhEcvvWWPJgmQJU1vZswiovWTyHb
 JbLYe/6oKSV5NhOE+FiYkaNk0rEmK/kOn2JTezvaJ8yRWuRgFtTEvxPl8C2i2R76pMdM
 XPBHPvc1OQpZcMOri/0o74e1GD3Acu6tRZkUQlLG0MP01l/jqm/cw0/rFVAmWVZ/h2mn
 7raw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2luY2UgZnJvbSBu
YXZpMTAsIHRoZSB0bXJfc2l6ZSBzaG91bGQgYmUgZGVjaWRlZCBieSBwc3Agc29zIGFjY29yZGlu
ZyB0bwp0b2MgaGVhZGVyLiBEcml2ZXIgc2hvdWxkIGlzc3VlIExPQURfVE9DIHRvIHBzcCBzb3Mg
dG8gZ2V0IHRoZSB0bXJfc2l6ZSBuZWVkZWQuClRoZSBhbGxvY2F0aW9uIG9mIHRtcl9zaXplIHRo
ZW4gc2hvdWxkIGJlIGRvbmUgb25seSB3aGVuIHNvcy9zeXNkcnYgbG9hZGluZwpjb21wbGV0ZWQK
CkFjY29yZGluZ2x5LCBhc2RfaW5pdCBhbHNvIG1vdmUgdG8gcHNwX2h3X3N0YXJ0IGFmdGVyIHNv
cyBmdyBsb2FkaW5nIHRvIG1ha2UKY2FsbGluZyBzZXF1ZW5jZSBjb25zaXN0ZW50LgoKU2lnbmVk
LW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpBY2tlZC1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IGI1ZGMxOTcyN2VkYi4uMjk3
YjFlMWUzZTQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC03
NzYsMTIgKzc3NiwyNCBAQCBzdGF0aWMgaW50IHBzcF9od19zdGFydChzdHJ1Y3QgcHNwX2NvbnRl
eHQgKnBzcCkKIAkJcmV0dXJuIHJldDsKIAl9CiAKKwlyZXQgPSBwc3BfdG1yX2luaXQocHNwKTsK
KwlpZiAocmV0KSB7CisJCURSTV9FUlJPUigiUFNQIHRtciBpbml0IGZhaWxlZCFcbiIpOworCQly
ZXR1cm4gcmV0OworCX0KKwogCXJldCA9IHBzcF90bXJfbG9hZChwc3ApOwogCWlmIChyZXQpIHsK
IAkJRFJNX0VSUk9SKCJQU1AgbG9hZCB0bXIgZmFpbGVkIVxuIik7CiAJCXJldHVybiByZXQ7CiAJ
fQogCisJcmV0ID0gcHNwX2FzZF9pbml0KHBzcCk7CisJaWYgKHJldCkgeworCQlEUk1fRVJST1Io
IlBTUCBhc2QgaW5pdCBmYWlsZWQhXG4iKTsKKwkJcmV0dXJuIHJldDsKKwl9CisKIAlyZXQgPSBw
c3BfYXNkX2xvYWQocHNwKTsKIAlpZiAocmV0KSB7CiAJCURSTV9FUlJPUigiUFNQIGxvYWQgYXNk
IGZhaWxlZCFcbiIpOwpAQCAtOTk3LDE4ICsxMDA5LDYgQEAgc3RhdGljIGludCBwc3BfbG9hZF9m
dyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJZ290byBmYWlsZWQ7CiAJfQogCi0JcmV0
ID0gcHNwX3Rtcl9pbml0KHBzcCk7Ci0JaWYgKHJldCkgewotCQlEUk1fRVJST1IoIlBTUCB0bXIg
aW5pdCBmYWlsZWQhXG4iKTsKLQkJZ290byBmYWlsZWQ7Ci0JfQotCi0JcmV0ID0gcHNwX2FzZF9p
bml0KHBzcCk7Ci0JaWYgKHJldCkgewotCQlEUk1fRVJST1IoIlBTUCBhc2QgaW5pdCBmYWlsZWQh
XG4iKTsKLQkJZ290byBmYWlsZWQ7Ci0JfQotCiBza2lwX21lbWFsbG9jOgogCXJldCA9IHBzcF9o
d19zdGFydChwc3ApOwogCWlmIChyZXQpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
