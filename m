Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F0649078
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97B16E077;
	Mon, 17 Jun 2019 19:50:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0941B6E062
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:44 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id t8so7013728qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gUayp/SguaU+i2m9weBtn8lZ4xgO7ezNL2k4D38uYTE=;
 b=sYyCUqb/qaAm1FoGbq1dBuqcsBLKNXuFMA/MZJb9AtdNDCtK4jev1CT1fj6qIMxkJ1
 rxBNoeyw3WRQ2p9rOY6FX8UsTm6vuOMC4yh/q67iw4vbRfRIOccnH+AK+eZmRz3FF8mJ
 0G2ndNNoZdEe9AkhOkkfTUZowt9psgktTQv+WADODLjoed4QBrJrjpQVhEE3zdLrDES6
 pQPgnj+VdOravKGP95qpW9xPhvPz4r63NhEacnt0iwkbiP5KXk8oKMIMY2np1noGu03u
 mxVXumXlEcP0v+UqfnKFLFpVWiZHUM5lXP+0k2bQQb65JoTXAxUOtn5OV+6/lGTa1rIp
 7P7g==
X-Gm-Message-State: APjAAAVxZgGQe1a9BftDHjyqowwHfR2OYcQtR2RrfwziEtmGmSRqeRQy
 qeQtuvqSSkdJX/+hme4UceNoCINLw3zIdg==
X-Google-Smtp-Source: APXvYqwpSsyv2Bb2xYBPInL06fQFqrpK6CV0Ev2Bvsss/DWIDNvUfz85Uq7t8wnZ1T8weVUkQpnoyw==
X-Received: by 2002:ae9:c106:: with SMTP id z6mr70155531qki.285.1560801043068; 
 Mon, 17 Jun 2019 12:50:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 447/459] drm/amd/display: add dwb stere caps and version
Date: Mon, 17 Jun 2019 14:49:36 -0500
Message-Id: <20190617194948.18667-48-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gUayp/SguaU+i2m9weBtn8lZ4xgO7ezNL2k4D38uYTE=;
 b=m8s//k+Np/u7Nl7R0oo09Ic3yi60wnRhou9rIGs3kMu7XV9ial2jA5+Jl9/TKaPU6s
 u+IM0l5aMelI+Yptt8f4CktAdTizkvuO3J/C6o7op5YN5MU5YA7hkBVL9qZFELD7Kipj
 SGJM87I7P2yzCFF8nraagONp+xOVBXjDVn8aSDXZLO7DvdmAs1F5pW7ysxd7RZ9HmLPt
 ZFZ12PkZIVwhTEvIeRlv7UZ5N0cwq6PH0KNZ5fMprrBXPi+qH90DWuL9Wv8lWh4+8zNJ
 cNhseZTHopuERn+ehjmIABGuPa6Mh58YY1Uc8X/7LCRu8e1RwWWxIvFSYJLX3VvQUh+6
 W3/g==
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
 Charlene Liu <Charlene.Liu@amd.com>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCmFkZCBkd2Igc3RlcmVv
IGNhcHMgYW5kIHZlciBmb3IgZnV0dXJlIHVzZQoKU2lnbmVkLW9mZi1ieTogQ2hhcmxlbmUgTGl1
IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxl
bmUuTGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBLcnVub3NsYXYgS292YWMgPEtydW5vc2xhdi5L
b3ZhY0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxh
a2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfdHlwZXMu
aCAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2R3Yi5oIHwg
NCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmgKaW5kZXggYTA2NDI5Y2Ew
MDE5Li42ZWFiYjY0OTFhM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY190eXBlcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY190
eXBlcy5oCkBAIC01ODIsNiArNTgyLDcgQEAgc3RydWN0IGRjX2luZm9fcGFja2V0XzEyOCB7CiAJ
dWludDhfdCBoYjM7CiAJdWludDhfdCBzYlsxMjhdOwogfTsKKwogI2RlZmluZSBEQ19QTEFORV9V
UERBVEVfVElNRVNfTUFYIDEwCiAKIHN0cnVjdCBkY19wbGFuZV9mbGlwX3RpbWUgewpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kd2IuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZHdiLmgKaW5kZXggMGFjMjFmYTIzMWM3
Li5hMzQwOTI5NGFlMGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHcvZHdiLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9o
dy9kd2IuaApAQCAtMzgsNiArMzgsNyBAQCBlbnVtIGRjZV92ZXJzaW9uOwogCiBlbnVtIGR3Yl9z
d192ZXJzaW9uIHsKIAlkd2JfdmVyXzFfMCA9IDEsCisJZHdiX3Zlcl8yXzAgPSAyLAogfTsKIAog
ZW51bSBkd2Jfc291cmNlIHsKQEAgLTExMiw4ICsxMTMsOSBAQCBzdHJ1Y3QgZHdiX2NhcHMgewog
CQl1bnNpZ25lZCBpbnQgc3VwcG9ydF9vZ2FtCToxOwogCQl1bnNpZ25lZCBpbnQgc3VwcG9ydF93
YnNjbAk6MTsKIAkJdW5zaWduZWQgaW50IHN1cHBvcnRfb2NzYwk6MTsKKwkJdW5zaWduZWQgaW50
IHN1cHBvcnRfc3RlcmVvIDoxOwogCX0gY2FwczsKLQl1bnNpZ25lZCBpbnQJIHJlc2VydmVkMlsx
MF07CS8qIFJlc2VydmVkIGZvciBmdXR1cmUgdXNlLCBNVVNUIEJFIDAuICovCisJdW5zaWduZWQg
aW50CSByZXNlcnZlZDJbOV07CS8qIFJlc2VydmVkIGZvciBmdXR1cmUgdXNlLCBNVVNUIEJFIDAu
ICovCiB9OwogCiBzdHJ1Y3QgZHdiYyB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
