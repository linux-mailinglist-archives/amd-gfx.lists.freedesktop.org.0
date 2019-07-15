Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7AA69E0E
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9989E32;
	Mon, 15 Jul 2019 21:25:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81089E1A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:09 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id d17so17231468qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGhtusTv4c+GzPVjan8KY0J2+08xO1ftGxv+LWVVsU8=;
 b=WYQ3/H3Bibq7WcO3WDXgJnN8+bPvb+TXrTWGHal6HWVFwdZGR4GqeDdyr0pP9SpGYv
 27lXUFZbruwWfMYdTabfWBkxPtfTfFkR776bC9PceRbe/HbgjE6yF0wmzR2TsaXutzVK
 4O17ywwYx4bTplpUpr0+ywP6XQB5wxCF2M172beLSCSxijfP8mREgwm5ikyo+0C+frJW
 Y52gYq7PC3wqaOGFh5N77mpvRhqA2VdNBSq+yX8VNrKxUOzN9cPOb3Va3gckh23dTQAg
 XvDDNBF8ybWcD73D+Bqv59xRtVAyF2IPnfCajZ4F2JSiIa2JE5XOl/FFVyYWS4ehjKZR
 Wjpw==
X-Gm-Message-State: APjAAAVcnvXUlA70Gmkb0B7HBfwCAejGIQTxaEUJr/QfD0zFeuZR1wW2
 FRDNAFRsjKZF1eYEQZPC1uRJffeI
X-Google-Smtp-Source: APXvYqztfVcs++0YJHQ2BsdccmBgowqdc3Tk8kV2PPMFIa77+j2LX2koE4QgwEPBu0d7A7QV66hljg==
X-Received: by 2002:ac8:428f:: with SMTP id o15mr19081124qtl.210.1563225908585; 
 Mon, 15 Jul 2019 14:25:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 027/102] drm/amdgpu: add number of mec for Arcturus
Date: Mon, 15 Jul 2019 16:23:22 -0500
Message-Id: <20190715212437.31793-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGhtusTv4c+GzPVjan8KY0J2+08xO1ftGxv+LWVVsU8=;
 b=KE3y/Cq8/BQqsUQYM0qlM7zWke0gCInzNE/NC7szy8CrzFI7WlBxNJEcIJxGAHekTW
 u4kvAOQ4amYk/xajJqYYi7xjHHV/ewLSBKb99fwUU20+zzXM/V4J4QlVrPPFqVZO9E0v
 JFp8OZ7y7FUH4UC/xUbW34Xue4DKLhZN90EeJRJXCKmQICegrTaVsG2nD/oeC/Lank+0
 ecdmKDVGyaBRLDYDUIZIDHcEKv6bzHEXtQ93Q24eNp3td7VkWAw1Qb/nFaeqa3t1Xl4c
 JR5Y9sUf0KaT08C9/KpixJjnZ8V1D+hvIQmJuNFaSiY1ABugiJu/EusYGeZFtzMYDakE
 Yi9Q==
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
djlfMC5jCmluZGV4IDlkNTdiNGFlNDljZi4uZTlkOTkyZGMwNGQ2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTE2NjksNiArMTY2OSw3IEBAIHN0YXRpYyBpbnQgZ2Z4
X3Y5XzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiAJY2FzZSBDSElQX1ZFR0ExMjoKIAljYXNlIENI
SVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9SQVZFTjoKKwljYXNlIENISVBfQVJDVFVSVVM6CiAJCWFk
ZXYtPmdmeC5tZWMubnVtX21lYyA9IDI7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
