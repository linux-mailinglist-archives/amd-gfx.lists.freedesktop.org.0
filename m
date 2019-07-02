Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F3D5D763
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448466E061;
	Tue,  2 Jul 2019 20:29:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968DF6E057
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:13 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so20109434qtk.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jCoSizdtdJVj5+LdD2s9uYL2pvu8ndCGDlmZgnvtzlM=;
 b=aSSA8HwfRFmrXpwVbaY2jWM1Dxok0DINrIwTjIAEPPplcnckSdSdtMSw1+f5HOkNmr
 ke8NxUUylLmIKSsRCX7CnwbS5IvsogObAisBmKnm+6W12g5BpQxGGT2Veb2PSiS8S9eu
 xl0YGpdCYirg9C1jlC2b3vQhV5VCmpLa0iToTlTiQbFwv1yaO+ChT/qQSE4FwyQNWGp/
 sFcm8Lp2/2P52QwN2514rtFp+rOc2imoKYBocGFHQmWwUZqPoZzCMSiWVWoL8dwlld61
 U0fUB0m69/7HXhm6GUimrhF8oh2c0mpJKKl6yEJy9cALAKkJ40EeTPsEmF0PHtW6chQ3
 tRWw==
X-Gm-Message-State: APjAAAVZyKRbyc5RSlZ62Qf0Mwv8695rOU14evya0wKpwBb7wAbM10S4
 DInuDRToI3jJeX7RUmKaE682k7W1Aq0=
X-Google-Smtp-Source: APXvYqytdrSlbg+HdnRC9Hxz0yCHsINnD1m6Mv4ubW25rvT/M8YPJczp6PXeRGlxgrt60/TpQk/Wcg==
X-Received: by 2002:a0c:81cd:: with SMTP id 13mr27334288qve.91.1562099352501; 
 Tue, 02 Jul 2019 13:29:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/53] drm/amdgpu: set rlc funcs for navi14
Date: Tue,  2 Jul 2019 15:28:10 -0500
Message-Id: <20190702202844.17001-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jCoSizdtdJVj5+LdD2s9uYL2pvu8ndCGDlmZgnvtzlM=;
 b=Qrl6mU1tAw2YS40TwOeMOqUbrDMeFpFIAe04VlcVD4KZZR7Bs6qB+R2KHgrDyCtsum
 QwcEX5GIU8NEPD6Ag+4DgS21iKENlh4t6okZ91/jfnGx1dVeTflYVsf8W7rfpJ9Y/JSb
 DXXcjQBvx1vU2sgKsTxFeBU6sezYAIPGje48FyvD7XjtzXUbi1rPW37pJqnQiyDlbP5s
 Pw8ugUT5Dth4ldFKRPJTpb6BNdckKfg9YalHSaHlgqvt5bsQY5rEYCWEKC00FbRq5F8V
 QU1gN5MhVCm5G3Btd8glZIo+o/5JD2JiGi2CXy0XHBCA6bLzCvO+hRnHRl9+cyaljsjO
 XcrA==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4
IGI4MzkwODNlNGI4Ni4uYjQzYzE2ZmM2YjEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYwpAQCAtNTEyNCw2ICs1MTI0LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3Nl
dF9ybGNfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJc3dpdGNoIChhZGV2
LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJ
CWFkZXYtPmdmeC5ybGMuZnVuY3MgPSAmZ2Z4X3YxMF8wX3JsY19mdW5jczsKIAkJYnJlYWs7CiAJ
ZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
