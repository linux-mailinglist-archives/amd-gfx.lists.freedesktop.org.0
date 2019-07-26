Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FCF75D57
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971B6E86C;
	Fri, 26 Jul 2019 03:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86936E865
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:03 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r6so47034514qtt.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5p6eFDdoeItRbDsWIlXo2beIF+T7NZcMCpCDd9s65TE=;
 b=r1z2hYvJCQaz1Owjg6uFLDBm3tbwKhTRZALGNyM/XR41xhDh/idSiIFv5HPnyEvEqD
 maYgJ8EftUIK8DNsQIp9poWI8okustyMaML9Rwdj109IDrro4yoYNtve4DEhbLQDit4w
 o6ZBnSHljqctSU2yY2VdxYYf9hRsHOEc/VHYP+vu/CR9HB/EkUilN4MiW7ux1BGxtAoO
 dR492jHp6HYUBF4WXXIiLcI03kEVlfjVhWUHxunSa+tujynlX4izL35MixgwMUS76nEh
 5kK1OJEyi/fbxhC/6ivhcQagFF5S0dgc0maux5xwXPSbwdqSTX06AvvmvXLZJ+XAOfm3
 vefw==
X-Gm-Message-State: APjAAAXYA+6iDF7STyllWdovkk2fOKNv1CnO2BQalV2QsS2SQscgBs9p
 9NjXeT2lu+hMspC/DgV7G5pBnOAU
X-Google-Smtp-Source: APXvYqycStKl+wVgaOnYANJh+x3DoFYoWQdyH5OYvfms1TpzyoxVZrLXPQEmM/2BsPerV0z3+rBkKw==
X-Received: by 2002:a0c:b90a:: with SMTP id u10mr66361833qvf.201.1564111322750; 
 Thu, 25 Jul 2019 20:22:02 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/11] drm/amdgpu: add reset_method asic callback for soc15
Date: Thu, 25 Jul 2019 22:21:40 -0500
Message-Id: <20190726032146.3187-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5p6eFDdoeItRbDsWIlXo2beIF+T7NZcMCpCDd9s65TE=;
 b=MaksUeQ7yDUHdiUBU4JNRuKbqGPgkXRrqpvYQ6xRW5Jup4bVdcpbI8BaBgsOnuz9hJ
 AcGqdK/phkD6KLU+nOJt/3Mfr4AboQXPgjHgRh15P/WdWPJqe2931jZZ1WBK61GuWn7S
 U1FDv/UE+WxKmpZhb/IUFkJ9x36pfBNcrN8qpFbnMD75dw73vyLRBFDx3WHuurbICFC8
 DhlCC2l1PFARv8xY2BVAzmgv7egF+ji0HCUKEWrAdjrYepRPoZVyRoIWMDeHpoqFAgcS
 DiMAc0fIUQQSWe4/NctWbg366xw28Jba/SrfjySlxPVczvHxgYuUCtRLXAEaj5KKXzhc
 Tqfg==
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
