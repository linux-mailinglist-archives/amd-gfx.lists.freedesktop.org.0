Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1101533E
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 20:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06BD89B60;
	Mon,  6 May 2019 18:01:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A20489B60
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 18:01:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h11so16263674wmb.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 11:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nP2WZIk7dJ1b+Dgv204iBfo0z84iCVQywLmtz7YOiWw=;
 b=kYsx5+U3AKnC/cgMKLVxsQ/A6pkVKgSc0JsIN9YnI5HRcAiDN1kL/ZwIdwYb0iJtgU
 z02J0rIn2w24VKYLFra78Flg2Ht25SabNZW7NPMqdzBK8Ww8m0ME3E3csRLn8v2juX0D
 kH62oRizMS+s6BsG7b5EmoOSMJJlCqc+Bb607YpvwnZgiCYP5NBRKYGoLKnqQAPTJhAv
 lT1KP8nMmztLz8KuTSkQdbfyBQXLOkmI9nbXVnGZ/LQ5nDGMN4LOXU280DDzGlse/mJL
 qbCelbniL/I3Dalt1uOwZl0oBu/gilrNO/O/g4KDXOOVZv7AeDo1mBM+YnLLMt+pLQTq
 b/ng==
X-Gm-Message-State: APjAAAUnTAHnTV/byJdaoTxq2AECKBGoB7NXhnkb2SzCYmtYcgUmUgsS
 zd8wpZPq68Kgns+mfbfZjWSMcGvp
X-Google-Smtp-Source: APXvYqx4Hcl4dlxxJ7rjdMDomInNMlCQjaUQ9KFk2JOFfGol4dHxnN38bkBjNea/zd7pVy0bRAglgQ==
X-Received: by 2002:a7b:cc9a:: with SMTP id p26mr7490625wma.80.1557165710426; 
 Mon, 06 May 2019 11:01:50 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f879:ea9e:6d97:2d15])
 by smtp.gmail.com with ESMTPSA id i9sm8125926wmb.4.2019.05.06.11.01.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 11:01:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org, dufresnep@gmail.com,
 werner.lueckel@googlemail.com
Subject: [PATCH] drm/radeon: prefer lower reference dividers
Date: Mon,  6 May 2019 20:01:40 +0200
Message-Id: <20190506180140.2733-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nP2WZIk7dJ1b+Dgv204iBfo0z84iCVQywLmtz7YOiWw=;
 b=E22SB3jpIotDh1+1TOzXdoma/tnmBIg0GLXjC6S80ORM6Tc91Eu16Q3O+GuBm/C3+B
 7upU53K32GHy/IBw/3dJ/4sPrTMyFcDH0eEEXl2IHSLa9bj3CIqxSabn7o3yxJWTSinJ
 3IZDfLneFB8Cp89VrPtlFlSkA2GCWJr3t1yR9wgCfXLB36kaphHpln/og4RuTvJV/lgT
 5ksZ5aLMh+ZMr143JoMZwqg5Jst0wNoouhdUZHONCA+30cTtRf0QPYRUr2z9NR/hD3Mn
 IBeyVTAhBkVmGpWiyf6rmq0QScbSrnqQf58fkE/XcW+RivG6maUeW4wutTOxyOomeTf4
 mfuw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB0aGUgY2xvc2VzdCByZWZlcmVuY2UgZGl2aWRlciBwcmVmZXIgdGhlIGxvd2Vz
dCwKdGhpcyBmaXhlcyBmbGlja2VyaW5nIGlzc3VlcyBvbiBIUCBDb21wYXEgbng5NDIwLgoKQnVn
czogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4NTE0ClN1
Z2dlc3RlZC1ieTogIFBhdWwgRHVmcmVzbmUgPGR1ZnJlc25lcEBnbWFpbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fZGlzcGxheS5jCmluZGV4IDlkM2FjOGI5ODFkYS4uZDhlMmQ3YjNiODM2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jCkBAIC05MjEsMTIgKzkyMSwx
MiBAQCBzdGF0aWMgdm9pZCBhdml2b19nZXRfZmJfcmVmX2Rpdih1bnNpZ25lZCBub20sIHVuc2ln
bmVkIGRlbiwgdW5zaWduZWQgcG9zdF9kaXYsCiAJcmVmX2Rpdl9tYXggPSBtYXgobWluKDEwMCAv
IHBvc3RfZGl2LCByZWZfZGl2X21heCksIDF1KTsKIAogCS8qIGdldCBtYXRjaGluZyByZWZlcmVu
Y2UgYW5kIGZlZWRiYWNrIGRpdmlkZXIgKi8KLQkqcmVmX2RpdiA9IG1pbihtYXgoRElWX1JPVU5E
X0NMT1NFU1QoZGVuLCBwb3N0X2RpdiksIDF1KSwgcmVmX2Rpdl9tYXgpOworCSpyZWZfZGl2ID0g
bWluKG1heChkZW4vcG9zdF9kaXYsIDF1KSwgcmVmX2Rpdl9tYXgpOwogCSpmYl9kaXYgPSBESVZf
Uk9VTkRfQ0xPU0VTVChub20gKiAqcmVmX2RpdiAqIHBvc3RfZGl2LCBkZW4pOwogCiAJLyogbGlt
aXQgZmIgZGl2aWRlciB0byBpdHMgbWF4aW11bSAqLwogCWlmICgqZmJfZGl2ID4gZmJfZGl2X21h
eCkgewotCQkqcmVmX2RpdiA9IERJVl9ST1VORF9DTE9TRVNUKCpyZWZfZGl2ICogZmJfZGl2X21h
eCwgKmZiX2Rpdik7CisJCSpyZWZfZGl2ID0gKCpyZWZfZGl2ICogZmJfZGl2X21heCkvKCpmYl9k
aXYpOwogCQkqZmJfZGl2ID0gZmJfZGl2X21heDsKIAl9CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
