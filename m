Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8439A98752
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB806EA31;
	Wed, 21 Aug 2019 22:24:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2034F6EA2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:38 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id p13so3323081qkg.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yqf9ZkjsgaYXPWKTz7p9TtEqRTIWMJcCq5rCrPu/lkI=;
 b=fj2na+BwlGkLEwPadJrKz5fa1pa/mjTvoAEGSJkK4cL6WBjUu5S62cVKOn9nQlYBad
 z7Gjyu7IjlGiXuyGp5WYm2z+UI2ANOLXLFLXuI96An77bBZZwRqY13cOs7b4KaykUNQq
 UKuKCHAxmHL5G+qBxqGEuCP2tjC/93v+GeZbtiBMeoZZpNe/sFsdJsMUtr6r5DVh+4B9
 nWS1b8wRPOxFUVFJQpdDFBKsfcvZHe4IWEnS4uHOnx/2r2QmAe8tjsSOSCYI8VhC6lUm
 7NtTAhd7mWoOlm5ph2r97lPkq6cXytb1dtlFnXenrYHL9+Hhd8lfKIuLgAnTDlemJuyt
 RYhQ==
X-Gm-Message-State: APjAAAV+Q1FBH/dYzZPJXNsr+Rnla4XnnXac21K2O5PYe9r3BonBoQki
 E+004YleuLGugPVftPmfeJ8hkHEj
X-Google-Smtp-Source: APXvYqycdpMTUE/ID78AfpJunFFvkJygG0zvd7WevNo3AoH44HPn9loMj0FjnqahN3nVhyPLR2tJQA==
X-Received: by 2002:a37:88e:: with SMTP id 136mr34147622qki.473.1566426276814; 
 Wed, 21 Aug 2019 15:24:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 29/37] drm/amdgpu/mmhub1: set mmhub clock gating for rn
Date: Wed, 21 Aug 2019 17:23:51 -0500
Message-Id: <20190821222359.13578-30-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yqf9ZkjsgaYXPWKTz7p9TtEqRTIWMJcCq5rCrPu/lkI=;
 b=jYimTk9UFnoVLGePMlxq3Gi4TxLSOXod3boG4lWzl0rkEfhL7THKYT1qjj6fHOODUt
 fVcKiOsBnvqDeCkuyjVgbf+jkXHB036Cifn69rDSWV7MNrC86gVBEOlsk0G75RpVrU6f
 5gEnQEJOYniuaTeK6JErAvxJE7wPk79Md5tsRZFQYnm/jylTDLW20vX2dRjtPpWt9LYy
 gmqc5J8/bE4FwbFtRGLAw2goCy8/VoD/tOavK/0W2T7cVoqN3ZWnJhqEukN9vWfL6h26
 +Awa1yIN9YecR+mZqARF795yeJJsrcrx9NcizrTvn3ElW5x+Pb4Zvq+ijC4uLeLdVAJJ
 jP7A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBQ
cmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L21taHViX3YxXzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCmluZGV4IDJiZDdhZGE4MDA4OC4u
MDRjZDRiNmY5NWQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1
Yl92MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCkBA
IC01MjEsNiArNTIxLDcgQEAgaW50IG1taHViX3YxXzBfc2V0X2Nsb2NrZ2F0aW5nKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogCWNhc2UgQ0hJUF9WRUdBMTI6CiAJY2FzZSBDSElQX1ZFR0Ey
MDoKIAljYXNlIENISVBfUkFWRU46CisJY2FzZSBDSElQX1JFTk9JUjoKIAkJbW1odWJfdjFfMF91
cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2NrX2dhdGluZyhhZGV2LAogCQkJCXN0YXRlID09IEFNRF9D
R19TVEFURV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKIAkJbW1odWJfdjFfMF91cGRhdGVfbWVkaXVt
X2dyYWluX2xpZ2h0X3NsZWVwKGFkZXYsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
