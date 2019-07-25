Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC21754C8
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5673F6E7AA;
	Thu, 25 Jul 2019 16:58:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DD96E7A2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:09 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so49757040qtl.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5p6eFDdoeItRbDsWIlXo2beIF+T7NZcMCpCDd9s65TE=;
 b=QgPXiDk0V5udOXVJ7RoF4h1qXZMBuXfUZWHgsj/T1xS1A48PbphDf0qMKm2425UA2F
 Qi1uZ8qoPwLEUAHkAYaWlsugg23N/NEjE+U3CJSSRW23JRA4f8FvkPwcT7TmguEcILpE
 2wMTGolP7jjlZySDhRjPEUfYJNaeW/4onNhosiqEoLcdWm7jvUkcdidX7C0Gg7FaiIGW
 iQR6GKgZLWn91zhVNIOpupaelmDig1sqN1tGi/hWvYVFNLLMKzrRdF1XwEz4SNP0ZYCV
 AXtQ9GLycvRknLvkY8IYLkLKTrWQQ3lXBwm669GDERLRuWmqvDIeLWbyt+fbvoThQNc1
 nmsw==
X-Gm-Message-State: APjAAAVQseBCB+Q9Mr1YvlJ6jBLRtjpxswBYrMJYC3zEuTHC77j0xM34
 TWR+dqqA66H7HTzDjPF+IgaKHUKG
X-Google-Smtp-Source: APXvYqxVucWzDWrGVLQL3z0wf/6ommUMYcSUSKrKA7zsF6vOeZMWUtRdnOsc869KTkueNhwydbI59w==
X-Received: by 2002:ac8:2b62:: with SMTP id 31mr63600060qtv.140.1564073888637; 
 Thu, 25 Jul 2019 09:58:08 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/12] drm/amdgpu: add reset_method asic callback for soc15
Date: Thu, 25 Jul 2019 11:57:51 -0500
Message-Id: <20190725165758.16928-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5p6eFDdoeItRbDsWIlXo2beIF+T7NZcMCpCDd9s65TE=;
 b=KgkpX4K9NRETDVS8J9xdWqoKPQcb4apwczgkOmOKOLqC4deEDMZHsXQshgBm4OOxdx
 RmpZMCE0pOBXyi3vwsEdJZ5F1GaDtbwcq9//flG/K325a9j0GE08sVi/UQvUreqsfFOd
 R5gvgiAnFhSiWuiVjJk6PM8pNBvnn52fcTfIc+Fi/mjXn8nrZNPC1SFtwgGFF5u0wqWh
 8LwhvKVNoAEFaLDu+Z1FaCq+zaa1hWh59Aw37aS1ue39H4L3gZXss85t4Yrc/tkqXATV
 n9dBe7nHdFoBqyU6rCyjRldwQYEX1bCNfAOIuutqP5JVKDcHa99l8aK+DZHDDUttCiks
 nN1g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QVBVcyBvbmx5IHN1cHBvcnQgbW9kZTIgcmVzZXQuICBkR1BVcyB1c2UgZWl0aGVyIG1vZGUxIG9y
CmJhY28gZGVwZW5kaW5nIG9uIHZhcmlvdXMgY29uZGl0aW9ucy4KClJldmlld2VkLWJ5OiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYyB8IDE3ICsrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRl
eCBmNjdlY2Y4MTRjOGMuLjQ0MDViOTgzZGQwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jCkBAIC00NjQsMTIgKzQ2NCwxNCBAQCBzdGF0aWMgaW50IHNvYzE1X2FzaWNfYmFjb19yZXNl
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGlu
dCBzb2MxNV9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQorc3RhdGljIGVu
dW0gYW1kX3Jlc2V0X21ldGhvZAorc29jMTVfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiB7Ci0JaW50IHJldDsKIAlib29sIGJhY29fcmVzZXQ7CiAKIAlzd2l0
Y2ggKGFkZXYtPmFzaWNfdHlwZSkgeworCWNhc2UgQ0hJUF9SQVZFTjoKKwkJcmV0dXJuIEFNRF9S
RVNFVF9NRVRIT0RfTU9ERTI7CiAJY2FzZSBDSElQX1ZFR0ExMDoKIAljYXNlIENISVBfVkVHQTEy
OgogCQlzb2MxNV9hc2ljX2dldF9iYWNvX2NhcGFiaWxpdHkoYWRldiwgJmJhY29fcmVzZXQpOwpA
QCAtNDkzLDYgKzQ5NSwxNiBAQCBzdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJfQogCiAJaWYgKGJhY29fcmVzZXQpCisJCXJldHVybiBBTURf
UkVTRVRfTUVUSE9EX0JBQ087CisJZWxzZQorCQlyZXR1cm4gQU1EX1JFU0VUX01FVEhPRF9NT0RF
MTsKK30KKworc3RhdGljIGludCBzb2MxNV9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQoreworCWludCByZXQ7CisKKwlpZiAoc29jMTVfYXNpY19yZXNldF9tZXRob2QoYWRl
dikgPT0gQU1EX1JFU0VUX01FVEhPRF9CQUNPKQogCQlyZXQgPSBzb2MxNV9hc2ljX2JhY29fcmVz
ZXQoYWRldik7CiAJZWxzZQogCQlyZXQgPSBzb2MxNV9hc2ljX21vZGUxX3Jlc2V0KGFkZXYpOwpA
QCAtODA2LDYgKzgxOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVuY3Mg
c29jMTVfYXNpY19mdW5jcyA9CiAJLnJlYWRfYmlvc19mcm9tX3JvbSA9ICZzb2MxNV9yZWFkX2Jp
b3NfZnJvbV9yb20sCiAJLnJlYWRfcmVnaXN0ZXIgPSAmc29jMTVfcmVhZF9yZWdpc3RlciwKIAku
cmVzZXQgPSAmc29jMTVfYXNpY19yZXNldCwKKwkucmVzZXRfbWV0aG9kID0gJnNvYzE1X2FzaWNf
cmVzZXRfbWV0aG9kLAogCS5zZXRfdmdhX3N0YXRlID0gJnNvYzE1X3ZnYV9zZXRfc3RhdGUsCiAJ
LmdldF94Y2xrID0gJnNvYzE1X2dldF94Y2xrLAogCS5zZXRfdXZkX2Nsb2NrcyA9ICZzb2MxNV9z
ZXRfdXZkX2Nsb2NrcywKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
