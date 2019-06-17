Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1B4900D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A0D89EAE;
	Mon, 17 Jun 2019 19:46:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA3C89EA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:49 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so12248501qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PFypJY3qd51ELUILz6pqdAeXOCzvpW9PcA9lL1VC51g=;
 b=QQAKl43Mf8Efs/Ugt4l2Jqama577I5YxkvvBCMVqtvi1EYOEOhwzFZg9MJepj4Sicx
 kXfxsp45+2Qk4O9ETtfjwxwjzJww9ZroeySm3M1JFME47u3Tb+Y0jjDSzCAGqYd9NVhE
 2vEeEj0plEOxOq/GaaokLGQ3BODFvNH4uM0s5s7OueeAonjqtqYL/dDDQzJvTAhoEP/u
 guaTiwkCty3nDf69BQ0Xbky/VEictYdfLI061fHGqoTQYYX905GUoHPhLpxLhc/QBH3o
 jWGvI+cLigcIDMZnZ74oMI6MjYa9Dy2sXmJEWUzX18Jbr77xb/SrrS7keGEJSAS+O26c
 q2jQ==
X-Gm-Message-State: APjAAAVtCne6RhnWrFDQ3nYSS3Sg2Zk0HVHgO4hOi43C6oip4uYfMl28
 R4oBUXO1kLCwKrTqp/4uL7OwFEzIza2lhg==
X-Google-Smtp-Source: APXvYqzUsTrEEaxxcM1Gs50pwDlSJZXi1Ii10LLCJvcgOFJKYaSqdOb70tWKEmBCWDlDHUsU59ZA1Q==
X-Received: by 2002:ac8:42d4:: with SMTP id g20mr96144391qtm.78.1560800808878; 
 Mon, 17 Jun 2019 12:46:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 351/459] drm/amd/display: dcn2 dmcu wait_for_loop update with
 dispclk.
Date: Mon, 17 Jun 2019 14:44:52 -0500
Message-Id: <20190617194540.18497-52-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PFypJY3qd51ELUILz6pqdAeXOCzvpW9PcA9lL1VC51g=;
 b=tfMQ8vsL0Q0uYxEOdaiJ/n5+q8ciIK7tOwOFv/ZCGREYYLEp2o7ZaJjCETSatQ3rEA
 PrEgwBcAIVrDEFT9l6eiR4T0zZ5+v0gEvn+ZKV+YExALEcX+dt3NDFv8nZU81J2JvJaO
 a2sae7UH8CMDnA5O5FhjABkgVdx6hdQ1dvaPVQeqWcV4ltYlZqypRx+wOKIvfRbJJWVr
 XGvgUquKMpwDON2qmlCRT8kgJZJkjrpXQ7NDR4b/KoKe3DcElbNUnpMyCgREN5GGpQsj
 DMVgpUetMW2fXlqIPssh5ThhG9l/WDsSnWeo7YXvmZH0TsyZomS8H4MucOm9/tMk5sM5
 hEGA==
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
RE1VQiBpcyB1c2luZyBEUFJFRiBDTEssIGJ1dCBETUNVIHN0aWxsIHVzZSBkaXNwbGF5Y2xrLgpU
aGlzIGlzIGZvciB1cGRhdGluZyBETUNVIHdhaXRfZm9yX2xvb3AgYWZ0ZXIgZGlzcGxheSBjbG9j
ayBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNv
bT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYwpp
bmRleCA5ZDAzMzZhNWY4M2YuLmNhM2U0MDA1Mzk3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3Iu
YwpAQCAtMTc1LDYgKzE3NSw3IEBAIHZvaWQgZGNuMl91cGRhdGVfY2xvY2tzKHN0cnVjdCBjbGtf
bWdyICpjbGtfbWdyX2Jhc2UsCiAJYm9vbCB1cGRhdGVfZGlzcGNsayA9IGZhbHNlOwogCWJvb2wg
ZW50ZXJfZGlzcGxheV9vZmYgPSBmYWxzZTsKIAlib29sIGRwcF9jbG9ja19sb3dlcmVkID0gZmFs
c2U7CisJc3RydWN0IGRtY3UgKmRtY3UgPSBjbGtfbWdyX2Jhc2UtPmN0eC0+ZGMtPnJlc19wb29s
LT5kbWN1OwogCiAJZGlzcGxheV9jb3VudCA9IGdldF9hY3RpdmVfZGlzcGxheV9jbnQoZGMsIGNv
bnRleHQpOwogCWlmIChkYy0+cmVzX3Bvb2wtPnBwX3NtdSkKQEAgLTM1Nyw2ICszNTgsNyBAQCB2
b2lkIGRjbjIwX2Nsa19tZ3JfY29uc3RydWN0KAogCQkgKiB0aGlzIHdvcmtzIGJlY2F1c2UgdGhl
IGludCBwYXJ0IGlzIG9uIHRoZSByaWdodCBlZGdlIG9mIHRoZSByZWdpc3RlcgogCQkgKiBhbmQg
dGhlIGZyYWMgcGFydCBpcyBvbiB0aGUgbGVmdCBlZGdlCiAJCSAqLworCiAJCXBsbF9yZXEgPSBk
Y19maXhwdF9mcm9tX2ludChwbGxfcmVxX3JlZyAmIGNsa19tZ3ItPmNsa19tZ3JfbWFzay0+RmJN
dWx0X2ludCk7CiAJCXBsbF9yZXEudmFsdWUgfD0gcGxsX3JlcV9yZWcgJiBjbGtfbWdyLT5jbGtf
bWdyX21hc2stPkZiTXVsdF9mcmFjOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
