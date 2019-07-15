Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12EF69E0F
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9A89E39;
	Mon, 15 Jul 2019 21:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6976889E1A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:10 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y26so17272967qto.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9c7luv5upJbqMMX5IF+GlQvUbL2DCm5/Sk+h++6M9zw=;
 b=SklSvRITuHfOhruauJ6KBp7ET5ZKpQMqAU3WZDiaXuwA4HYnm82NkiG1QJqlBXAjbC
 ZrPekmPhTeRNqXpDL9sto6KTjhY3xYWsp0IWEmswobp3YnR6hC0lIwXK42zAJtsqwOgh
 O6vlfNRQ/y/+pMdebBs9+QN8kTnSEBxx94/mJu6m3P5I76Kj/oBgezL94FTtAdgUyudT
 srd1Cs/pzQcImYH8YBrECYDKdAE8X9Fq1QuaHW50NjS/QyAcG1NLloC1lEYmSsbi3jkn
 okHev9L12BW9Jy9fpSWRfFzxUpr+A2MI+pDPrVqTMlWL2zItUmdiaDsA82pyrhEkRlfV
 dbdw==
X-Gm-Message-State: APjAAAUd0lWB7IiyDHUTwf100pOgysx0GhEn+RXmAnp1ed2Ub46oV03q
 NLZvBptnO+3KQvT/209wk+tsyMNL
X-Google-Smtp-Source: APXvYqxdQ6eKVDfWrcKeocPeYjEqbQ8GProqnD3cIsmIUWshBiO6FJHJgsgT94apQmCxEXK9WHEHiw==
X-Received: by 2002:ac8:21f2:: with SMTP id 47mr19881902qtz.38.1563225909390; 
 Mon, 15 Jul 2019 14:25:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 028/102] drm/amdgpu: add to set rlc funcs for Arcturus
Date: Mon, 15 Jul 2019 16:23:23 -0500
Message-Id: <20190715212437.31793-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9c7luv5upJbqMMX5IF+GlQvUbL2DCm5/Sk+h++6M9zw=;
 b=fpTnXZYEH+n/t5YV00PsefOGzhDP5+drKjnsMZbPbMVyHoImS3kgk0Ijxrt8cov59W
 gxJsIuLg6crhC4aBAHAHazmSx83FabbpvjU//11TZl1Wnomlhz7yBk7krILdqUFXQLaQ
 Mbv69dZdsjL7uJsnhWhvZ+4ppyZHGeBKhG3vGiI0hO1vE6VdPHPBB0YQ6YVZZWIsyKF3
 cw7MF78IgacB1Iy34aCJt97x9cKeee1vWxUIIfLRPk5+2KPiPlhnx2kq8Mf58Q744hkR
 mJKbyD9dYgiTVQ7W5q/xpKyXlhRQsIO4ELX+STHqLcpvLVQIGlEh29gp9lppNXr/0jeg
 GgxA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jCmluZGV4IGU5ZDk5MmRjMDRkNi4uYzg0NDE5ZjczNTM2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTUzNTcsNiArNTM1Nyw3IEBAIHN0YXRpYyB2b2lkIGdm
eF92OV8wX3NldF9ybGNfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJY2FzZSBD
SElQX1ZFR0ExMjoKIAljYXNlIENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9SQVZFTjoKKwljYXNl
IENISVBfQVJDVFVSVVM6CiAJCWFkZXYtPmdmeC5ybGMuZnVuY3MgPSAmZ2Z4X3Y5XzBfcmxjX2Z1
bmNzOwogCQlicmVhazsKIAlkZWZhdWx0OgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
