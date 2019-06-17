Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308849083
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A946E088;
	Mon, 17 Jun 2019 19:50:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C7989FC8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t8so7014150qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PR+LBQOiGKVJ8LwiwzD4f5DZQ7RKBuKuXVsKQA9JtLM=;
 b=ChmNew7sip5rEgwCH4V0XhYsH6I5yoqdQyPycseYGrGRGBp+DXzXibQV6Y0hv18PcW
 c9/5+YjNWhkSHTkrxrrIDRWZMXIEEYvgt8yxdnVYhIWBHg256khjmXLlDtkRG1o6zIjb
 rTdSkfUnNzVsA/RMrzBWftPe2R3tL24aLx83gALZVJGXi8d5TD3wLx8/jXj89eUiaqnB
 +PW9u2eZVdPYBYH61kSvOV7nKIaWsJHkrLPB92ZPun0qcYsTqgv4oGHe+k4kpZiGfC2E
 CJD8/uuv2j5ZYHY+tthuULhEL+lUKPnvxJBc2c9YxTU3yMj6i4CwcBCioch+4EgFdAlr
 TgSg==
X-Gm-Message-State: APjAAAXQkW/+IkbdZ5KLZ12g+f+9wALC0Eijf5Z6mUUS4kvkNlX8DPSx
 hNjJOzmFpn6zblxmuG+ZblUyq5fboA2PmQ==
X-Google-Smtp-Source: APXvYqyVbOiAB1kzEl7aqqEnSsiQINKvXR+ZuPLL0rfBn8hc1FOI9V+72PGizZIsF9tfRZpojKynFA==
X-Received: by 2002:a05:620a:1335:: with SMTP id
 p21mr68491126qkj.280.1560801053777; 
 Mon, 17 Jun 2019 12:50:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 457/459] drm/amd/display: expose dentist_get_did_from_divider
Date: Mon, 17 Jun 2019 14:49:46 -0500
Message-Id: <20190617194948.18667-58-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PR+LBQOiGKVJ8LwiwzD4f5DZQ7RKBuKuXVsKQA9JtLM=;
 b=Q266i8K66dmGbSOnZDQRkvwO2BeeUkLQZs0JAnO8XkyfR5VZHED61n8QaRW4FjoCbW
 8BnqG0zmvHFkoiAefEJ5tV/4QeJJWndrpN2lOBYrf/jSfQZ8uf+/2wJop3odSmkj/9fh
 5viubjIVTEortcwVf3F6PvCGxZEQkjkxuIFK4HOK/uECeNAc3ts2N7uXDPADW3WT8Fzq
 YFNaNCoGha/P/KZohSDc+9oK3TaE5S19/s8mcda/1H5f0Ti0DdjrHbT99Az6yfcqSr29
 zBg1Nvfp+7Gq0iHtGWKMrI4WwHZS9ihVEvExc+D2IWmt4KAkWk8khCuPJXFgkfVFpt/L
 6fVQ==
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
 Charlene Liu <charlene.liu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCmZvciBmdXR1cmUgdXNl
CgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4K
QWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xr
X21nci5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNu
MjAvZGNuMjBfY2xrX21nci5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKaW5kZXggNDQ1YmJjM2Jl
YTBlLi5kZjU5Y2I3NTk3YTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKQEAgLTcwLDcgKzcw
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfbWdyX21hc2sgY2xrX21ncl9tYXNrID0gewog
CUNMS19NQVNLX1NIX0xJU1RfTlYxMChfTUFTSykKIH07CiAKLXN0YXRpYyB1aW50MzJfdCBkZW50
aXN0X2dldF9kaWRfZnJvbV9kaXZpZGVyKGludCBkaXZpZGVyKQordWludDMyX3QgZGVudGlzdF9n
ZXRfZGlkX2Zyb21fZGl2aWRlcihpbnQgZGl2aWRlcikKIHsKIAl1aW50MzJfdCBkaXZpZGVyX2lk
OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9k
Y24yMC9kY24yMF9jbGtfbWdyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xr
X21nci9kY24yMC9kY24yMF9jbGtfbWdyLmgKaW5kZXggYTQ0YWZjMDYyNWM1Li41NjYxYTVhODk4
NDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Rj
bjIwL2RjbjIwX2Nsa19tZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmgKQEAgLTQzLDQgKzQzLDYgQEAgdm9pZCBkY24y
MF9jbGtfbWdyX2NvbnN0cnVjdChzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LAogCQlzdHJ1Y3QgcHBf
c211X2Z1bmNzICpwcF9zbXUsCiAJCXN0cnVjdCBkY2NnICpkY2NnKTsKIAordWludDMyX3QgZGVu
dGlzdF9nZXRfZGlkX2Zyb21fZGl2aWRlcihpbnQgZGl2aWRlcik7CisKICNlbmRpZiAvL19fRENO
MjBfQ0xLX01HUl9IX18KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
