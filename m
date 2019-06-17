Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C367A48F89
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8505789CF9;
	Mon, 17 Jun 2019 19:32:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072B689C99
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:22 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so12197138qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95VYVeJ2W3SrKgIdSDCUCsDe4nmbO0Mf2umlNL6uiyg=;
 b=taxF6x5B7X8Hfbinv+qFPH3h8Sqc1/UbuJS8URRq8Y+85elbinmpkcosqgR2CimEnp
 rOnOY0nxAETWmXH6xho5VdagNnPrCQ9X6o6Jgaj84aUajagyQuVYOh0GFAT8zPvNB1XN
 fW6vdaMsxYml0MdgOE6N0TKygb82Q6rnH4K57y0cx/pJLBFFr/gJeAfq5eqOXACh7jTP
 kp6UaFU3cf4QE1imBFmkdxxZVpG68XfiTzGdY/vqb+CsxYFzZJ3XMOg5JRrmyYBEwosB
 ZX+1caaySFuMo+SkABUS3Shrl4AaPJAINXKwIg59oumZoA2q0iPgRKGW3HA2Up56wgM5
 IYmA==
X-Gm-Message-State: APjAAAU5gW9b/v+rUVKaStULepqjO/w59iYb/RS51hHa2/UAZAlu9YDP
 bPbR1di12vcQ6LX9qZCjOA9zBhHNNRo=
X-Google-Smtp-Source: APXvYqz1N6G2HFw/BvCEapKdd4BPyOjwf87d8wlBV4zKXV54F8DhnAjGQOF80TnL387Fwx4kPnxn0A==
X-Received: by 2002:ac8:1010:: with SMTP id z16mr85001591qti.367.1560799941026; 
 Mon, 17 Jun 2019 12:32:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 274/459] drm/amd/powerplay: remove smu mutex lock in
 smu_hw_init
Date: Mon, 17 Jun 2019 14:30:41 -0500
Message-Id: <20190617193106.18231-75-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95VYVeJ2W3SrKgIdSDCUCsDe4nmbO0Mf2umlNL6uiyg=;
 b=giiwAJh+jOuU5LzfsJ+gGAAMUJEGr3Y8gKKITMaBx7n1DZOueaoCu9alRsLS8hDF4q
 ErL1CjSKCWXe+4uV6DfjYYm01mHr3+e17yJllF4esyhbEjCVdnpzd+HMF6wQwUoiRI8B
 L5HAEMDcfLYl53YBYLpgGwQFQZraAmrJ19w+e7l/rJSp4T+34XsntewOAfZ7CzSPhLsd
 mB+RG1xEdDJFqFqT9HP5a0dOTrPLPE0aPRTJDbEIaYvPNCaeWjlkmD28wqe59xGUl+Dv
 VenZwSju7rnQXwofOrvMVt9JPJZhzzdTL0OMsfwFd5qWqIY44YbGFCpuqmHk1P4Hj0tV
 OJjg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSBzbXUgbXV0ZXggbG9j
ayBpcyB1bm5lY2Vzc2FyeSBpbiBzbXUgaHcgaW5pdC4KClNpZ25lZC1vZmYtYnk6IEtldmluIFdh
bmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
IHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggNDIxZTFkZjc5YWU1Li5hZDhmNmRk
NzcxM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAg
LTk4MSw4ICs5ODEsNiBAQCBzdGF0aWMgaW50IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkKIAkJ
fQogCX0KIAotCW11dGV4X2xvY2soJnNtdS0+bXV0ZXgpOwotCiAJcmV0ID0gc211X2ZlYXR1cmVf
aW5pdF9kcG0oc211KTsKIAlpZiAocmV0KQogCQlnb3RvIGZhaWxlZDsKQEAgLTEwMTEsOCArMTAw
OSw2IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCWlmIChyZXQpCiAJ
CWdvdG8gZmFpbGVkOwogCi0JbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsKLQogCWlmICghc211
LT5wbV9lbmFibGVkKQogCQlhZGV2LT5wbS5kcG1fZW5hYmxlZCA9IGZhbHNlOwogCWVsc2UKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
