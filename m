Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0037998D
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC066E293;
	Mon, 29 Jul 2019 20:15:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667076E293
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:41 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id 190so41864037vsf.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jSDvke9U0A/ZnpdowqgRnu4pVJCFREftEFem8MdhzuQ=;
 b=ISFB3oIsfiJl+dukyVjX52LMgIXwiCFbNBc9IXBR6ExbmxJ9l+8I3qvb8jWEua39t5
 7X3/g/TpBkyLTJOZN66EtymdbHw1Bh/1u5sQlTqbIhbhTuVjJFoCdJPSyaZwzX74qGDq
 aegZ54LMbOl9XKzpbzXMBCiBR7TegG3qw+vxBUvfimMve4UqV24LE112vGa1AxOB6lV5
 JXyId/fwwyn1jcPnKkkdZRCOSaC1bfNB6691BF0Pc7y/nvKf2xNhnae4Hnvj27QUlJjb
 dRcCc+GgNtovhR8m+T7zYs2X+HuZ3D2VaO3UsB8Zuf9N/eZk5gzAn1SJpdNBSCFhEmgq
 XmiQ==
X-Gm-Message-State: APjAAAXz3Vq+AwlprmmyDuys/a9jiZ5AxxtmZU+7D/qKxlYvfT6AKwpX
 nhW3nRX39FD+A8H/0aNm6RoQHB72
X-Google-Smtp-Source: APXvYqzacjLoVWCH3hf5z63c3O0WpI33yY9Cr88Sy48oSaS5GVU/VluHY2Ck+KlJHAUxrMpo6dSBaw==
X-Received: by 2002:a67:2704:: with SMTP id n4mr7490529vsn.202.1564431340326; 
 Mon, 29 Jul 2019 13:15:40 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/30] drm/amd/powerplay: add missing arcturus feature maps
Date: Mon, 29 Jul 2019 15:15:00 -0500
Message-Id: <20190729201508.16136-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jSDvke9U0A/ZnpdowqgRnu4pVJCFREftEFem8MdhzuQ=;
 b=c4ZIghKG5rirNOObVbb8oTGQL4vWZjfYtApbihIJobS1+c5/brQUfJsurJ+opq0K24
 HwGX3dLY5k6fUL/yYtIMNW5/ACpCuG7R0Q5EjtwAOrO9WWGIBr04cTrvifRYX6l0H9sh
 CtL2SQdm47KL0TIKBmL01EVtR0tGro3OmMt3KtaTnkbH8FSNu2SR+Vqo/uHzuH0wHwJ/
 5KF8coqOTEc5jTg6HRiJV5p2w383LrcW36i3BzqQ5TzFlxMLg77ngTfHoDWVL7PgSS56
 p5vKxcoBj3VQGfK3sj8weQ+L53MJS+34sPztqhIBE7hxRvI6kcZL/yNyDL6Pe+2cEFey
 ZkQQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkFkZCBtaXNzaW5nIGZlYXR1cmUg
bWFwcyBmb3IgYXJjdHVydXMuCgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBh
bWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgNSArKysrKwogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMKaW5kZXggMmI2ZGZjN2NmZTFhLi4yMDNmY2I3Y2Q3MjQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCkBAIC00Myw2
ICs0Myw4IEBACiAKICNkZWZpbmUgTVNHX01BUChtc2csIGluZGV4KSBcCiAJW1NNVV9NU0dfIyNt
c2ddID0gezEsIChpbmRleCl9CisjZGVmaW5lIEFSQ1RVUlVTX0ZFQV9NQVAoc211X2ZlYXR1cmUs
IGFyY3R1cnVzX2ZlYXR1cmUpIFwKKwlbc211X2ZlYXR1cmVdID0gezEsIChhcmN0dXJ1c19mZWF0
dXJlKX0KIAogI2RlZmluZSBTTVVfRkVBVFVSRVNfTE9XX01BU0sgICAgICAgIDB4MDAwMDAwMDBG
RkZGRkZGRgogI2RlZmluZSBTTVVfRkVBVFVSRVNfTE9XX1NISUZUICAgICAgIDAKQEAgLTEyNSwx
MiArMTI3LDE1IEBAIHN0YXRpYyBzdHJ1Y3Qgc211XzExXzBfY21uMmFpc2NfbWFwcGluZyBhcmN0
dXJ1c19mZWF0dXJlX21hc2tfbWFwW1NNVV9GRUFUVVJFX0NPCiAJRkVBX01BUChEUE1fR0ZYQ0xL
KSwKIAlGRUFfTUFQKERQTV9VQ0xLKSwKIAlGRUFfTUFQKERQTV9TT0NDTEspLAorCUZFQV9NQVAo
RFBNX0ZDTEspLAogCUZFQV9NQVAoRFBNX01QMENMSyksCiAJRkVBX01BUChEU19HRlhDTEspLAog
CUZFQV9NQVAoRFNfU09DQ0xLKSwKIAlGRUFfTUFQKERTX0xDTEspLAorCUZFQV9NQVAoRFNfRkNM
SyksCiAJRkVBX01BUChEU19VQ0xLKSwKIAlGRUFfTUFQKEdGWF9VTFYpLAorCUFSQ1RVUlVTX0ZF
QV9NQVAoU01VX0ZFQVRVUkVfVkNOX1BHX0JJVCwgRkVBVFVSRV9EUE1fVkNOX0JJVCksCiAJRkVB
X01BUChSU01VX1NNTl9DRyksCiAJRkVBX01BUChQUFQpLAogCUZFQV9NQVAoVERDKSwKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
