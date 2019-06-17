Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8948FC8
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9114089D77;
	Mon, 17 Jun 2019 19:45:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9A389D73
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id i125so6985471qkd.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7vn0qYp/7dSsL25TU3EleYdRLZ7Gri/YMbgkYgACPg8=;
 b=R+LnHTjOTY13Hx/gAiq/VIA55ROTnvUk6Z04cO+U6J2RieRO9s9DcWPj1XopAiR3jK
 AnVglad5uaRCvSjNWMEu7joBs1rvHQZ9XeZmTfgJiN8pOZbppSmnHjkCh/xF5vK6RlWX
 03IjKt8j4eQXJ8zjgeBZoHh0OAZUBv8JzF4naIqP1w48jso8r5NcHldcct1kzYDJG0AY
 Dy7ouufYfRbf7yV0BBklUM/LDdZPEGmSza3WiO4MBj3pNFYT3hjWhD3pmXubbu3qCtbH
 OpkNMAucjzyryZ47GAMAb+O0yPayOnRVe1mv/sKxmohv+CaazoiP7gzcf4AkMXmDz64t
 A5dg==
X-Gm-Message-State: APjAAAXvgLuibscTM+DbsRA6DmSDtBYV+BzzEi7ssQ3x4xT50lKzKNgP
 p/WEVTzvW6FBALkemmvqE2w2aqdP/pE=
X-Google-Smtp-Source: APXvYqzS6J39SYJYnFNlkDIe078nvxiLbbhhoI/n8S9Uj3vqWVMuT+UXiypOIsz/IFUp9NYK+O1UNg==
X-Received: by 2002:a05:620a:44:: with SMTP id
 t4mr1391366qkt.189.1560800728875; 
 Mon, 17 Jun 2019 12:45:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u63sm1490547qkh.85.2019.06.17.12.45.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 297/459] drm/amd/powerplay: update smu11_driver_if_navi10.h
Date: Mon, 17 Jun 2019 14:45:18 -0500
Message-Id: <20190617194520.18449-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194520.18449-1-alexander.deucher@amd.com>
References: <20190617194520.18449-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7vn0qYp/7dSsL25TU3EleYdRLZ7Gri/YMbgkYgACPg8=;
 b=cJj2o37d+n/DVXfPq8oz/V1f/Xl+dF96Yd3Cgqudz1SJLaafJSatIKAm7ydek6Zo7T
 lDptWYjsQbqDnfMNvTB7m+Mi0lki2NcjnFQXyk2zwYYO1nY8QyxgJAm/xUcamYrakM0a
 L5Nuq2bu/pEvx6ODCAGwGgWi3dgbqGAmQDSG+IAZzIPR2C17zIkTnj8VPXVVSz0je7sS
 74tBBhdoGK5POvGvnp8oL62NNALWJpfkUmthWkFDgxFwkz6oK7W10SppudLZBYGZ2BT1
 AimGbd5J0DpS+vWC70IJh1Sc4RMyURZuyOKHmU/RY3Mz3hfIrQfBF3RMl0BeGvXpsSnO
 zNTw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCnVwZGF0ZSB0aGUgc211MTFfZHJp
dmVyX2lmX25hdmkxMC5oIHNpbmNlIG5hdmkxMCBzbXUgZncKdXBkYXRlIHRvIDQyLjIzCgpTaWdu
ZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogS2Vu
bmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9wb3dlcnBsYXkvaW5jL3Nt
dTExX2RyaXZlcl9pZl9uYXZpMTAuaCAgICB8IDI0ICsrKysrKysrKysrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX25hdmkx
MC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9u
YXZpMTAuaAppbmRleCBiMzk5M2QzODJhZDUuLmE4YjMxYmM1MDA1NCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9uYXZpMTAuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX25h
dmkxMC5oCkBAIC0yNiw3ICsyNiw3IEBACiAvLyAqKiogSU1QT1JUQU5UICoqKgogLy8gU01VIFRF
QU06IEFsd2F5cyBpbmNyZW1lbnQgdGhlIGludGVyZmFjZSB2ZXJzaW9uIGlmIAogLy8gYW55IHN0
cnVjdHVyZSBpcyBjaGFuZ2VkIGluIHRoaXMgZmlsZQotI2RlZmluZSBTTVUxMV9EUklWRVJfSUZf
VkVSU0lPTiAweDJGCisjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OIDB4MzIKIAogI2Rl
ZmluZSBQUFRBQkxFX05WMTBfU01VX1ZFUlNJT04gOAogCkBAIC0xMTQsNyArMTE0LDcgQEAKIAog
I2RlZmluZSBGRUFUVVJFX01NSFVCX1BHX0JJVCAgICAgICAgICAgIDQwCiAjZGVmaW5lIEZFQVRV
UkVfQVRIVUJfUEdfQklUICAgICAgICAgICAgNDEKLSNkZWZpbmUgRkVBVFVSRV9TUEFSRV80Ml9C
SVQgICAgICAgICAgICA0MgorI2RlZmluZSBGRUFUVVJFX0FQQ0NfREZMTF9CSVQgICAgICAgICAg
IDQyCiAjZGVmaW5lIEZFQVRVUkVfU1BBUkVfNDNfQklUICAgICAgICAgICAgNDMKICNkZWZpbmUg
RkVBVFVSRV9TUEFSRV80NF9CSVQgICAgICAgICAgICA0NAogI2RlZmluZSBGRUFUVVJFX1NQQVJF
XzQ1X0JJVCAgICAgICAgICAgIDQ1CkBAIC00OTAsMjMgKzQ5MCwyNiBAQCB0eXBlZGVmIHN0cnVj
dCB7CiAgIHVpbnQxNl90IEZhblRhcmdldFRlbXBlcmF0dXJlOwogCiAgIHVpbnQxNl90IE1lbW9y
eVRlbXBlcmF0dXJlTGltaXQ7Ci0gIHVpbnQxNl90IFJlc2VydmVkMjsKKyAgdWludDE2X3QgTWVt
b3J5VGVtcGVyYXR1cmVMaW1pdDE7CiAKICAgdWludDE2X3QgVEdQOwotICB1aW50MTZfdCBSZXNl
cnZlZDM7CisgIHVpbnQxNl90IENhcmRQb3dlcjsKIAogICB1aW50MzJfdCBEaWVUZW1wZXJhdHVy
ZVJlZ2lzdGVyT2Zmc2V0OwogCi0gIHVpbnQzMl90IFJlc2VydmVkNDsKKyAgdWludDMyX3QgUmVz
ZXJ2ZWQyOwogICAKLSAgdWludDMyX3QgUmVzZXJ2ZWQ1OworICB1aW50MzJfdCBSZXNlcnZlZDM7
CiAKICAgdWludDMyX3QgU3RhdHVzOwogCiAgIHVpbnQxNl90IERpZVRlbXBlcmF0dXJlOwogICB1
aW50MTZfdCBNZW1vcnlUZW1wZXJhdHVyZTsKIAotICB1aW50MzJfdCAgICAgTW1IdWJQYWRkaW5n
WzhdOyAvLyBTTVUgaW50ZXJuYWwgdXNlICAKKyAgdWludDE2X3QgU2VsZWN0ZWRDYXJkUG93ZXI7
CisgIHVpbnQxNl90IFJlc2VydmVkNDsgCisKKyAgdWludDMyX3QgQm9hcmRMZXZlbEVuZXJneUFj
Y3VtdWxhdG9yOyAgCiB9IE91dE9mQmFuZE1vbml0b3JfdDsKIAogdHlwZWRlZiBzdHJ1Y3QgewpA
QCAtNzk0LDggKzc5Nyw4IEBAIHR5cGVkZWYgc3RydWN0IHsKICAgdWludDE2X3QgICAgIEJvYXJk
UGFkZGluZzsgCiAKICAgLy8gTXZkZCBTdmkyIERpdiBSYXRpbyBTZXR0aW5nCi0gIHVpbnQzMl90
IE12ZGRSYXRpbzsgLy8gVGhpcyBpcyB1c2VkIGZvciBNVkREIFZpZCB3b3JrYXJvdW5kLiBJdCBo
YXMgMTYgZnJhY3Rpb25hbCBiaXRzIChRMTYuMTYpCi0gIAorICB1aW50MzJfdCAgICAgTXZkZFJh
dGlvOyAvLyBUaGlzIGlzIHVzZWQgZm9yIE1WREQgVmlkIHdvcmthcm91bmQuIEl0IGhhcyAxNiBm
cmFjdGlvbmFsIGJpdHMgKFExNi4xNikKKwogICB1aW50MzJfdCAgICAgQm9hcmRSZXNlcnZlZFs5
XTsKIAogICAvLyBQYWRkaW5nIGZvciBNTUhVQiAtIGRvIG5vdCBtb2RpZnkgdGhpcwpAQCAtODY1
LDcgKzg2OCw4IEBAIHR5cGVkZWYgc3RydWN0IHsKICAgdWludDMyX3QgVGhyb3R0bGVyU3RhdHVz
ICAgICAgIDsgCiAgCiAgIHVpbnQ4X3QgIExpbmtEcG1MZXZlbDsKLSAgdWludDhfdCAgUGFkZGlu
Z1szXTsKKyAgdWludDhfdCAgUGFkZGluZzhfMjsKKyAgdWludDE2X3QgQ3VyckZhblNwZWVkOwog
CiAgIC8vIFBhZGRpbmcgLSBpZ25vcmUKICAgdWludDMyX3QgICAgIE1tSHViUGFkZGluZ1s4XTsg
Ly8gU01VIGludGVybmFsIHVzZQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
