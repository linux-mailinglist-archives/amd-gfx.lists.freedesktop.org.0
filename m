Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016477996B
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545BC89C85;
	Mon, 29 Jul 2019 20:15:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B489889C05
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:22 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id u3so41838464vsh.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OnSIjW0EKfZ+N45yz9OyTvLoBNuiJ1l6ExlOiL5PRA=;
 b=kOJzEliMAfZC9kxp0AbbBmRIIdgXLQHFdp3X6nZE5PqA5jyQNGN/YM0yqWwNR+SF7e
 X8JMobm/A6WXqtVmLXyZ6a4Km992zmM39dpProYJu57tj7GemhOyolvToOF7QM+AuAV1
 Uu3PD67Zv+XKwKMxPLt+a0BsHdlcdnBdHBgg8LqmeM07fm6zzHiDgPtiHKBIrRnKZZFW
 YzCEsn/9Fx8dta3nDuiCsgdm8ctp1fYLmPlhyBdbZXZJDgKpblcIO/5utrVc9QkgcT35
 /g7g0acEPWrZg0wo0FltZO2HEgvjiT8c2dEZTMAG5rEzxlfdZBmjiQtO0feCKG0wKvYA
 FfSg==
X-Gm-Message-State: APjAAAVDJmVhjAEogVNWn/h4EZFDvipvXMWgtw7lxThmCYOOhK9thNIr
 JOr2zJXsyj/XlZrzUQ3PAq+ayCKJ
X-Google-Smtp-Source: APXvYqwgYCJEVYYic+VWIZb5L9zecAKCowFv3W6tRPdM5+68/f/YyVuYz7q6M/9ro29gwzRQR61DJA==
X-Received: by 2002:a67:69d6:: with SMTP id e205mr68296346vsc.98.1564431321419; 
 Mon, 29 Jul 2019 13:15:21 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/30] drm/amd/powerplay: add SW SMU interface for dumping
 pptable out (v2)
Date: Mon, 29 Jul 2019 15:14:40 -0500
Message-Id: <20190729201508.16136-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OnSIjW0EKfZ+N45yz9OyTvLoBNuiJ1l6ExlOiL5PRA=;
 b=Le2orCKdV1ZMCYKdfD36gAay5rT0X8I1ch5ZL1ZNnEm9WuluNXOrUalA8EHVoYoKnk
 YNJkhNcCDt8bUgUJmf8+ZTboTRpuExMCMe1YVAA3I6IHbJzuIUFFqKZBoM4keHrIILY5
 IhlGDkE//EpetDZLJjpgy3DKVrmSsb9sdAWaLlFZ+M2xA+jDwSVuY045Wv4hIPvG4l8n
 MYYxZpM+MxQpvTOP+WE0RYjaHufUxPfO3gK+x5yqRBPNMSKkpL0Qs1HQFy4XOld0tDvs
 qZISsv4VWICIH2RQO18SiDRmjYEuq7UegO357suoRwaniaXdMpKGRojSux4XPLsumQih
 Y2Zw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClRoaXMgaXMgZXNwZWNpYWxseSB1
c2VmdWwgaW4gZWFybHkgYnJpbmcgdXAgcGhhc2UuCgp2MjogZGlzYWJsZWQgYnkgZGVmYXVsdCAo
QWxleCkKClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBMZSBNYSA8TGUuTWFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwppbmRleCA5NzQ0NzIwMTU0ODcuLmM0NWZhMmZiNGRhOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMTA2NCw2ICsxMDY0LDggQEAg
c3RhdGljIGludCBzbXVfc21jX3RhYmxlX2h3X2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
CiAJCQlyZXR1cm4gcmV0OwogCX0KIAorCS8qIHNtdV9kdW1wX3BwdGFibGUoc211KTsgKi8KKwog
CS8qCiAJICogQ29weSBwcHRhYmxlIGJvIGluIHRoZSB2cmFtIHRvIHNtYyB3aXRoIFNNVSBNU0dz
IHN1Y2ggYXMKIAkgKiBTZXREcml2ZXJEcmFtQWRkciBhbmQgVHJhbnNmZXJUYWJsZURyYW0yU211
LgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5k
ZXggYWM5ZTlkNWQ4YTVjLi41MTlhZWFjNzA2YTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtNDQ2LDYgKzQ0Niw3IEBAIHN0cnVjdCBw
cHRhYmxlX2Z1bmNzIHsKIAlpbnQgKCpnZXRfdWNsa19kcG1fc3RhdGVzKShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwgdWludDMyX3QgKmNsb2Nrc19pbl9raHosIHVpbnQzMl90ICpudW1fc3RhdGVz
KTsKIAlpbnQgKCpzZXRfZGVmYXVsdF9vZF9zZXR0aW5ncykoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIGJvb2wgaW5pdGlhbGl6ZSk7CiAJaW50ICgqc2V0X3BlcmZvcm1hbmNlX2xldmVsKShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCk7CisJ
dm9pZCAoKmR1bXBfcHB0YWJsZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogfTsKIAogc3Ry
dWN0IHNtdV9mdW5jcwpAQCAtNzM3LDcgKzczOCw4IEBAIHN0cnVjdCBzbXVfZnVuY3MKIAkoKHNt
dSktPmZ1bmNzLT5iYWNvX3Jlc2V0PyAoc211KS0+ZnVuY3MtPmJhY29fcmVzZXQoKHNtdSkpIDog
MCkKICNkZWZpbmUgc211X2FzaWNfc2V0X3BlcmZvcm1hbmNlX2xldmVsKHNtdSwgbGV2ZWwpIFwK
IAkoKHNtdSktPnBwdF9mdW5jcy0+c2V0X3BlcmZvcm1hbmNlX2xldmVsPyAoc211KS0+cHB0X2Z1
bmNzLT5zZXRfcGVyZm9ybWFuY2VfbGV2ZWwoKHNtdSksIChsZXZlbCkpIDogLUVJTlZBTCk7Ci0K
KyNkZWZpbmUgc211X2R1bXBfcHB0YWJsZShzbXUpIFwKKwkoKHNtdSktPnBwdF9mdW5jcy0+ZHVt
cF9wcHRhYmxlID8gKHNtdSktPnBwdF9mdW5jcy0+ZHVtcF9wcHRhYmxlKChzbXUpKSA6IDApCiAK
IGV4dGVybiBpbnQgc211X2dldF9hdG9tX2RhdGFfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIHVpbnQzMl90IHRhYmxlLAogCQkJCSAgIHVpbnQxNl90ICpzaXplLCB1aW50OF90ICpmcmV2
LCB1aW50OF90ICpjcmV2LAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
