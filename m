Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108E25AC80
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Sep 2020 16:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA126E46D;
	Wed,  2 Sep 2020 14:05:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88A6E46D
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Sep 2020 14:05:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o21so4703543wmc.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Sep 2020 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMPFA7zTjLMOUfG/DZ6GEWNJGsQpCrAM6hbz1JOKLJY=;
 b=JNcJEzQM0xIDyAdumg02XYSU0KFJW2Qz2/aNmVKzmgC8DyJw3As8BAUhDbJI09rqV9
 g1A8CEq7ScUk9YpdnRRXZyX7F5fN4f3ExXJdOxGCKJR+iXdSja5wJzdXfdSUz4ow2tED
 Y51D5rGW27vlWzjtDEHyhv0cz8o0DJscZARyxeG9zQjZfTpYQgnjP02fghATmf95RmtY
 7aCMQX7dB5yPQ7b9uSpDKgdQGEKzxDblFCEtliUbVE+AFzi2zpite5YneyiTehAb4vIk
 ESEqSlF2gFk0R4E7kdbr9R08NCDPnNNEBtICRp/3XLE6dfUwxOc5MmyaSoM5ObOEXacN
 GokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMPFA7zTjLMOUfG/DZ6GEWNJGsQpCrAM6hbz1JOKLJY=;
 b=E99wb+hsJ+iEq/hy7VmtvyJlU9sPq2SEhPP1Cx5K1BxHlQ7SRNuByfaNaXHmuN+Cz2
 lmOwwWW/Wje/jGlpCkrH9BvsAw8aSlGoNO4ZQGb4UZGnyU20VnH6n7gxS78rIbgYkFzz
 Xak5tftNmBL4dqqt76EXEO9doZDVWweN5X8+2ik/oei4YE1LK6w6Mfy0/Zx+Xrpzecfz
 dy1HPJRqS8CA2XTW3WtM6HnUifksfh/A0+MEP/A8Uq8kS4iDtHB6xVEWE0m/nJ6MlIeM
 xcbMrP0CZ7tIwUZqSr5DqNoZxqpXAXVqypWU9V9dRmI9GIV4yEbBN5JA/MjPREmoeotT
 k88Q==
X-Gm-Message-State: AOAM530KBHDpj5KB6yTllIpg6Iak/5WBaQYopECuFgDsVSZC0/VE3R5G
 U2rquIp3imt53yASf2+rdYNMjifArEI=
X-Google-Smtp-Source: ABdhPJz1/vfkm8vKD7qAReqQrpYom0m61GivSy1Ibh6FD5XrbVAT6Kr3qS6827vBrghHQapN0u/2Ng==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr872344wmj.42.1599055515882;
 Wed, 02 Sep 2020 07:05:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1fa9:45f2:5fc7:4f71])
 by smtp.gmail.com with ESMTPSA id s17sm7687979wrr.40.2020.09.02.07.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 07:05:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Xinhui.Pan@amd.com,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix max_entries calculation v2
Date: Wed,  2 Sep 2020 16:05:12 +0200
Message-Id: <20200902140512.2343-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2FsY3VsYXRlIHRoZSBjb3JyZWN0IHZhbHVlIGZvciBtYXhfZW50cmllcyBvciB3ZSBtaWdodCBy
dW4gYWZ0ZXIgdGhlCnBhZ2VfYWRkcmVzcyBhcnJheS4KCnYyOiBYaW5odWkgcG9pbnRlZCBvdXQg
d2UgZG9uJ3QgbmVlZCB0aGUgc2hpZnQKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KRml4ZXM6IDFlNjkxZTI0NDQ4NyBkcm0vYW1kZ3B1
OiBzdG9wIGFsbG9jYXRpbmcgZHVtbXkgR1RUIG5vZGVzCi0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmlu
ZGV4IDhiYzIyNTM5MzliZS4uYmU4ODZiZGNhNWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYwpAQCAtMTY5Nyw3ICsxNjk3LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1f
Ym9fc3BsaXRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQlBTURHUFVf
R1BVX1BBR0VTX0lOX0NQVV9QQUdFOwogCQl9IGVsc2UgewogCQkJYWRkciA9IDA7Ci0JCQltYXhf
ZW50cmllcyA9IFM2NF9NQVg7CisJCQltYXhfZW50cmllcyA9IG1hcHBpbmctPmxhc3QgLSBtYXBw
aW5nLT5zdGFydCArIDE7CiAJCX0KIAogCQlpZiAocGFnZXNfYWRkcikgewotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
