Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F584905C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685EC6E055;
	Mon, 17 Jun 2019 19:50:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E8B6E053
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:15 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i34so7023393qta.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ujaZaWp0OIJ+UeTDut+YeROxnkHYcSzPFg7+r+kW7xw=;
 b=PJ90aOYALRd7PrSPEiq0N7orWTdWgDrjDbN0EM/F1NUHID2dYzNEe8KCxPXjr377kz
 saWb8Wo+o50lV1sQk89TPmoIQzrfyuDAOYphHdP2ERk2aNIPYQYUik0vDYkItX0AJbwC
 zdlBBh+OKrg/ZWGx4JCWptx/OP6DKwYg0D1nUdupDrg6FBc7RmhOQqkI9V8zSAjj3x14
 un7P5yOB28jU9ljYg3ZRL0Q/r5s9FAFUncVtT0qqInbqYNXJdxcwuvi2HS+CbV7BPEKq
 vT9cjf3cfLbats2F26t0Jzic0R+39JMzWmgZWGq7FxWr8bv2UJw1+ZC64ioaaxBSaf+n
 mQNA==
X-Gm-Message-State: APjAAAXMKmKUFghWzVvU7BV0LTeQHOIXxzPZ/X2uasCEeAF4OkvS+XB3
 26utkoavR0TbaQtAgDI2BDAaYbWVWSrqPg==
X-Google-Smtp-Source: APXvYqzW2YAijsjjsLOqwkP1I2FN3UixT63+AYKBrJUrZEzxZSEEElaZuj5r9XjL7DlY/za23ZOKsg==
X-Received: by 2002:ac8:ce:: with SMTP id d14mr53522817qtg.149.1560801014297; 
 Mon, 17 Jun 2019 12:50:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 417/459] drm/amd/display: Remove OPP clock programming on
 plane disable
Date: Mon, 17 Jun 2019 14:49:06 -0500
Message-Id: <20190617194948.18667-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujaZaWp0OIJ+UeTDut+YeROxnkHYcSzPFg7+r+kW7xw=;
 b=ktgbt6jx7zTf5pxHuryHux4iJuV+8wppaYjTOv6oWs3EyGvNVoI25HlXFrie8wAeYf
 NmxTCDnB1HaFg1ID8KRUnIgJDej6Zt4Ou3xFKI4/xRz+GwqzbqZ1QLgIAOjxGS4sOeM4
 P2lQ1PCdppNp4DrCE+Fmc6PerZ4yoN1YjhaDNYtAzSG7AXXH9C7HRL8giyDtBYSSaLMm
 /jxLxo9pxdN09Z8JMum6VoHaz4TqJCSGlfDgWqahKHmcsnYVOPSeeXqZ5+zGIHcxQYZ/
 iAJCQm1XXUBDX8TYRIPtEXb8McViLPNdT8O1rewml+3/LPAwON7UGFpJ9PSIwpMa0ciq
 MLnA==
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
 Joshua Aberback <joshua.aberback@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldClBs
YW5lIGRpc2FibGUgZ2V0cyBjYWxscyB3aGVuIHdlIGVuYWJsZSBibGFuay4gT24gRENOMiwgd2Ug
YmxhbmsgYnkgdXNpbmcKRFBHIHRvIGRpc3BsYXkgYSBibGFjayBjb2xvdXIgaW5zdGVhZCBvZiB1
c2luZyBPVEcgYmxhbmsuIERQRyBydW5zIG9mZiB0aGUKT1BQIGNsb2NrLCB0aGVyZWZvcmUgd2Ug
c2hvdWxkbid0IGRpc2FibGUgdGhlIE9QUCBjbG9jayB3aGVuIGRpc2FibGluZyB0aGUKcGxhbmUu
IFdlIGRvIG5lZWQgdG8gZGlzYWJsZSB0aGUgT1BQIGNsb2NrIHdoZW4gZGlzYWJsaW5nIHRoZSBl
bnRpcmUgcGlwZSwKdGhhdCB3aWxsIGJlIGFkZHJlc3NlZCBpbiBhIHNlcGFyYXRlIGNvbW1pdC4K
ClNpZ25lZC1vZmYtYnk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNrQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBC
aGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIHwgNiAtLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggYzdhZTUzODYxMWY3Li5lYTU2
ZjE1YTUxZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5jCkBAIC00NjMsNyArNDYzLDYgQEAgc3RhdGljIHZvaWQgZGNuMjBfcGxh
bmVfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRjICpkYywgc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0
eCkKIHsKIAlzdHJ1Y3QgaHVicCAqaHVicCA9IHBpcGVfY3R4LT5wbGFuZV9yZXMuaHVicDsKIAlz
dHJ1Y3QgZHBwICpkcHAgPSBwaXBlX2N0eC0+cGxhbmVfcmVzLmRwcDsKLQlpbnQgb3BwX2lkID0g
aHVicC0+b3BwX2lkOwogCiAJZGMtPmh3c3Mud2FpdF9mb3JfbXBjY19kaXNjb25uZWN0KGRjLCBk
Yy0+cmVzX3Bvb2wsIHBpcGVfY3R4KTsKIApAQCAtNDc5LDExICs0NzgsNiBAQCBzdGF0aWMgdm9p
ZCBkY24yMF9wbGFuZV9hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgcGlwZV9j
dHggKnBpcGVfY3R4KQogCiAJZHBwLT5mdW5jcy0+ZHBwX2RwcGNsa19jb250cm9sKGRwcCwgZmFs
c2UsIGZhbHNlKTsKIAotCWlmIChvcHBfaWQgIT0gMHhmICYmIHBpcGVfY3R4LT5zdHJlYW1fcmVz
Lm9wcC0+bXBjX3RyZWVfcGFyYW1zLm9wcF9saXN0ID09IE5VTEwpCi0JCXBpcGVfY3R4LT5zdHJl
YW1fcmVzLm9wcC0+ZnVuY3MtPm9wcF9waXBlX2Nsb2NrX2NvbnRyb2woCi0JCQkJcGlwZV9jdHgt
PnN0cmVhbV9yZXMub3BwLAotCQkJCWZhbHNlKTsKLQogCWh1YnAtPnBvd2VyX2dhdGVkID0gdHJ1
ZTsKIAlkYy0+b3B0aW1pemVkX3JlcXVpcmVkID0gZmFsc2U7IC8qIFdlJ3JlIHBvd2VyaW5nIG9m
Ziwgbm8gbmVlZCB0byBvcHRpbWl6ZSAqLwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
