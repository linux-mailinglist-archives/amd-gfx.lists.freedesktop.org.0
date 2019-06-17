Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09A848F84
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F11989CBE;
	Mon, 17 Jun 2019 19:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9698C89C99
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:20 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l128so6970943qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAeznsZOJSCWHBxFxjfShCaObAVvaE74qnhYrm4ZEn4=;
 b=LGF80QDbSlTbIX8o3XAUpp5oxhYLnSO1xSyAfTCNy7k2cIkAOh1QGg0H7DY5k1fEnp
 NpwErvxSLxrHItnl6p3Z0Mbl4fYGjwUhsdnxUFH8vs5mfO3biSPSwM+S48i66nOfFNOh
 B4YxhHBQcRtLIPJood1gZlzS9VLFzW8nUdq6fQLexZzgUMA8sXwRuYToQRYpqU/yfD3b
 eXTHuJx2LK85xpFr1YeDMJLcltnuXiKgA9xscnwP3UPGgkHnislyNaH9XEYalOsHwi4X
 xHdzU8/RJSWHSfVOoFCT30o7iyaDP1T6r3h+1d5BXNINDEmkmXLyM60OL+yUio28sBAK
 in4g==
X-Gm-Message-State: APjAAAUFq4SGceT090dAWb/bgpv1vhzbvhk45qixtgq5tHYdpLoUGhF+
 3kOaGByfOWDR843TPKPLL5eelj63hbI=
X-Google-Smtp-Source: APXvYqzdMyi/I/2q/YY6gJSJ/EeE4K5529Kt89w4j79l9gBnrwccKZlsyQ94sBqjtJVHLy/EewlFtw==
X-Received: by 2002:a37:4d16:: with SMTP id a22mr88855560qkb.103.1560799939365; 
 Mon, 17 Jun 2019 12:32:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 272/459] drm/amd/powerplay: fix no statements in fucntion
 returning non-void
Date: Mon, 17 Jun 2019 14:30:39 -0500
Message-Id: <20190617193106.18231-73-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAeznsZOJSCWHBxFxjfShCaObAVvaE74qnhYrm4ZEn4=;
 b=Ru/BUGnk6p/gOcKiV6bu1nxXALfBNbh5oQ8Qg6LOmdJlwSWVDcT5bTzVoGd4mEaSGq
 dXJxDstJQ3wvsb+XQ14Gosne5e80PHCYG5mvd4yaJ0cKf7HsO3Ak6E7sJsd2mvBGivd2
 KC7fu7FMy9D2JRUsAUVNVz1JBpiAcYgPBry+cUzGgGSiRIU2sMxtYcoNMM/OD38KYuN2
 5chkpZiXdqlY+1U2my8Bq82lyiYE0lhHbC3cPhNES55JXSbSXQ6oCLJwMIPNOqdNfp07
 kvPmo6cvD82ujc6LoynE95NqQvfwdKIttMuPL7Ow5eQOibW1fSt/4KKULATydglmzKON
 GLpw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YwppbmRleCAxMzA3MTk2NjM1NjYuLmY1ZmI2NzJiZGRjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtNDk0LDYgKzQ5NCw4IEBAIHN0YXRpYyBpbnQg
bmF2aTEwX3RhYmxlc19pbml0KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3Qgc211X3Rh
YmxlICp0YWJsZXMpCiAJU01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfQUNUSVZJVFlf
TU9OSVRPUl9DT0VGRiwKIAkJICAgICAgIHNpemVvZihEcG1BY3Rpdml0eU1vbml0b3JDb2VmZklu
dF90KSwgUEFHRV9TSVpFLAogCSAgICAgICAgICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0p
OworCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgbmF2aTEwX2FsbG9jYXRlX2RwbV9jb250
ZXh0KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
