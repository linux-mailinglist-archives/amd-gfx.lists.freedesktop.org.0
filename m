Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77EE48ED7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8C89A0F;
	Mon, 17 Jun 2019 19:28:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3943B899D5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:06 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so7261611qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJhrgDzqylcykCunHTH2yf8LmoNDkSnUneB3D8ydnr4=;
 b=hLHaIhPzXBX5zTAH0PeUfjptda6Pe5AauaFB6aK/Awq/MdyP5uEpZPYWCLZBFzWzAc
 /X3jGwo5fbUpObiYMLHAmXXaMU0GmmSH+0Igr1Astq2vngvWq1J3H2Mr96BYp9jaVk5K
 vpSeMZPsXPXVowUV9rKewwqf/gX18zYBFvDU4S7oax1nZQpXXGWAfHh4GoYCm3cgORiR
 8tV69W7mDaMeC8qpemV8wTCy5Kd1hFYIJLWASiczl3NvrYt5keV+Kdmj4OsnOGszdMnB
 vJWVRhGrD+haEMawOxGcUHDkDhKarCtzZmwc6EmKegg15rodFAADRj8gn5mGW2dSMV5o
 jHAw==
X-Gm-Message-State: APjAAAUVPf71Kwydeec/iuox2udrHM3czWGwljIpLTYa7cgGu1LH8FnB
 FnWJLbWPunZQ6FYy9FgIJAgaInMnfa4=
X-Google-Smtp-Source: APXvYqy3GZcRQDEMYEjbH5sfYmUsP8n1HF4bp1ZZcZc2TgaZLp1I+N54MYgyY/zW9DOSQmzubOdnJw==
X-Received: by 2002:ac8:38a8:: with SMTP id f37mr95646029qtc.150.1560799685142; 
 Mon, 17 Jun 2019 12:28:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 156/459] drm/amd/powerplay: enable power features
Date: Mon, 17 Jun 2019 14:26:21 -0500
Message-Id: <20190617192704.18038-57-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJhrgDzqylcykCunHTH2yf8LmoNDkSnUneB3D8ydnr4=;
 b=ZXpLHCszOd7/F9tsUuk8Pn7Vhs32p6XhoL/JkYLJe7onWdPR5UpZAGStyJC9vt95Vn
 nwkkDk3glcVa/aeyv+Wlb7f0hdrqwBnswatkuMHVI0h3t7FgPjUV9NxJ2p4BaVLQV41m
 JtR0k/0KvzC5hfN2KHgyeM8qN73NbiNmA/iFvmGfk73zzfW4xyLE2OkJg11UhSVnMeeB
 F739cTnzd3iAidunh4uoJ9n0dB6lM7AiYz53hDQ8mk6lxTwF8Kr3DUjIxi02eoskK+zp
 0QGdVRaRDOmLrNFS3vQpdE++i/fO2ECIpmmFRFi+7YBw+i3V/hpHnLLAQ+n3CUs0Dawb
 cQ1g==
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
 Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCnRoZSBiZWxvdyBzbXUg
cmVsYXRlZCBwb3dlciBmZWF0dXJlcyBjYW4gYmUgZW5hYmxlZCBub3cuCjEuUHJlZmV0Y2hlcgoy
LkdGWCBEUE0KMy5TT0NDTEsgRFBNCjQuTVAwQ0xLIERQTQo1LkxDTEsgRFBNCjYuR0ZYIFVMVgo3
LkNHCjguUFBUCjkuVERDCjEwLkdGWCBFREMKMTEuVlIwSE9UCjEyLkZhbiBDb250cm9sCjEzLlRo
ZXJtYWwgQ29udHJvbAoxNC5MRUQgRGlzcGxheQoxNS5NTUh1YiBQRwoxNi5BVEh1YiBQRwoKU2ln
bmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggMzMyN2FmMjM3NmQ3Li42NGZlY2JiMDg5OTUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTExOSw4ICsx
MTksOCBAQCBuYXZpMTBfZ2V0X3VuYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJaWYgKG51bSA+IDIpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JZmVhdHVyZV9t
YXNrWzBdID0gMHhmZmZmZmZlNDsKLQlmZWF0dXJlX21hc2tbMV0gPSAweGZmZmZmZmZmOwkvKiBi
aXQzMn5iaXQ2MyBpcyBVbnN1cHBvcnRlZCAqLworCWZlYXR1cmVfbWFza1swXSA9IDB4ZGMzZjdm
OGM7CisJZmVhdHVyZV9tYXNrWzFdID0gMHhmZmZmZmNlYzsJLyogYml0MzJ+Yml0NjMgaXMgVW5z
dXBwb3J0ZWQgKi8KIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
