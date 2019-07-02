Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC895D778
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3D16E06B;
	Tue,  2 Jul 2019 20:29:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0BB6E06B
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:32 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so27886qtk.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMNqwz2Rjjs7BVqTQkXbCERGR8+hjUdm41vnfgFB4NE=;
 b=hNcYNS5uQJyHV+ZDh0jhxXzVxi1Pyf0eMebBE3GQ9y/tajKSIIvgdaHpLabxGKb/XQ
 InxG34HiNoiyj5ssmbz4Ea6vBOM7y4ogyPeZqUp1o878HfGvbqnAZM3MyGUBaupZH1Eh
 VVLD3OGyZN9NzQ7lR8bVhsVcKydJf9c2MY8S+EZqQzAdNYfWpnIJFTU4KuQnsoRNZxKw
 zRPwkPUfzd7XQWr2/OFHMqLTlnl5TecRvFaGkoOk2qt1s0wDiGraCpfxfQrvOtjUEwSi
 STjYnNej1VbGqCC8PLGA8OG773ofu9SnCmZUt6TPNbx4IjeKy5ktGIEKgZj8r/eQ7v4Y
 y8bA==
X-Gm-Message-State: APjAAAUKgwrTQibd96hOPOJ99YaGy46iq/eBHo1eNF8VTjcpCagbgGw6
 JITSKTtgYZ60C2SBpNUu6x0r4KAq8mU=
X-Google-Smtp-Source: APXvYqymDE4WAlZiOBwDXqPuTrvHEqUuAxL2XCfr2EHRsxVvkiebxn3O2yEZIWQbI88VYegG3x+MZw==
X-Received: by 2002:ac8:2b62:: with SMTP id 31mr27414753qtv.140.1562099371164; 
 Tue, 02 Jul 2019 13:29:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 40/53] drm/amd/display: skip to load dmcu firmware for navi14
Date: Tue,  2 Jul 2019 15:28:31 -0500
Message-Id: <20190702202844.17001-41-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMNqwz2Rjjs7BVqTQkXbCERGR8+hjUdm41vnfgFB4NE=;
 b=WB8QkfUiug43+FzJk43sDGnC8aWHlm82+RDS6CTTVtC2tS77lIHHVW2b7Tw0X7SrBG
 T6VPI3RiANFmpHtIzzMHETtqA58ifvchg9OpsP42O/WSdLT1YzqprD1WlQ3RT9GPwXiK
 KPppnU963s2oD2oTOcJDdu1ZSWh3KBhW0632fBJDlaxc73CdaOhXPt3tHNgpbhfIsnxJ
 R2TzuIivlAMNKxb+QriuVtFZmYM3YNPgf8ZfaOKpUBtRcrmGuAi6Y3cf+lVJyOM3UxW3
 2gzN5dEfoG6uzjIhAtt09TG5InsgLLzjgWIM89o1XysOhP7KE/TrcEqWkKK5FZ8Xu3Aa
 RfnQ==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCm5vdCBuZWVkZWQgZm9y
IG5hdmkxNCBhdCB0aGUgbW9tZW50LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFv
amllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDgz
N2RkZGJkYjk2Ny4uZjI2YzdiMzQ4YWE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTY2OCw2ICs2NjgsNyBAQCBzdGF0aWMg
aW50IGxvYWRfZG1jdV9mdyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBf
VkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENI
SVBfTkFWSTE0OgogCQlyZXR1cm4gMDsKIAljYXNlIENISVBfUkFWRU46CiAJCWlmIChBU0lDUkVW
X0lTX1BJQ0FTU08oYWRldi0+ZXh0ZXJuYWxfcmV2X2lkKSkKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
