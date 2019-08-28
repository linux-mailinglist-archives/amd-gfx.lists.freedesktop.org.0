Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA2A0AE4
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B9489ECD;
	Wed, 28 Aug 2019 19:57:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DD889EFF
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:56 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 4so873658qki.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Br/4c8rN7Q2KAswSOAQ+3IJp+vggNasCFSa9GETNbY=;
 b=TuRj3jqaVtTRDs2Jq4xZfRK3aOb/jjd1XU8fvugY+TMRl4ZBzVegyGKCSNUnyJB+Hn
 n/9NBpnopFGkx7wVe+RrdBOXCYJHoRok+vHT9+gDKEYGhks/vt0Z+T62976Tf0jidc9q
 iPGuJlNSPFN6NiV658z2lZRa5rCy5dl/BnQYshyu7Qh2NwLHvSo/El1JqOKMV+3EX6Pq
 l06n1ix74/wAMTR0gpB73SKkIuDpss/wRBD4cNxFs0it+UTVG7Usra31c+63kI473Ftu
 j9CKp3ZU1w4CEH/OAHTi0yQnQPE6Wk6O06BPG7fhefi/UK2AIeNyvFFP7gUqmKPhJmPH
 hczQ==
X-Gm-Message-State: APjAAAVxKIDPv4YSI83O8LqaRdqEbZ0ysGkZKv5zeRWtoHY+6HRxiTHm
 suJBCc6YShqu2dvQcuxDRdFQlr23
X-Google-Smtp-Source: APXvYqxBHFNtwPv3H7I2+BDqn5UukJGREdSLltjZ+zSXnlv+Wc4d6bf8Iw5BZTfvAYdMkRSURfo/KQ==
X-Received: by 2002:a37:98f:: with SMTP id 137mr5906601qkj.188.1567022215320; 
 Wed, 28 Aug 2019 12:56:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 23/23] drm/amdgpu: Enable DC on Renoir
Date: Wed, 28 Aug 2019 14:56:22 -0500
Message-Id: <20190828195622.28941-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Br/4c8rN7Q2KAswSOAQ+3IJp+vggNasCFSa9GETNbY=;
 b=che5mJr9GCEfaS5hRrhLKLUqp+JDUIImufM3GGuQlLUNjs3z1xiRJLp+IxlldyEF8b
 RGbZxWFMjV+zWjoZiDFp+LWokg+KldWRZsqMH3yJJUbf9+V7ZE4DweF6XYi6DKbRvIZZ
 GcCj27AG7ufssTTV+IdRw5u77Pcp1JuB5JtE54OF4B9f8WLQHqSKl+rNaV1UxX231Y1w
 cVeTQLIOvIFg3vc28+8SZ38ktYJXMbW4W+do/4qynXRTGEIjyuo/V07L7vrbc8fDR2vs
 xdL6cFwKxPUBeFd+Wtkideuq4aNXupju0YXf7PiaA06VqLJs7HCSGXHUs/x+N3vnubAj
 vi/Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpFbmFibGUgREMgc3VwcG9ydCBmb3Ig
cmVub2lyLgoKU2lnbmVkLW9mZi1ieTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAzICsrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAgIHwgNiArKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCmluZGV4IDMxNjkwZTkxODVhMC4uOGNkNTY3MTQwZmZmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0yNTE3LDYgKzI1MTcsOSBA
QCBib29sIGFtZGdwdV9kZXZpY2VfYXNpY19oYXNfZGNfc3VwcG9ydChlbnVtIGFtZF9hc2ljX3R5
cGUgYXNpY190eXBlKQogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQX05BVkkxNDoKIAlj
YXNlIENISVBfTkFWSTEyOgorI2VuZGlmCisjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19E
Q04yXzEpCisJY2FzZSBDSElQX1JFTk9JUjoKICNlbmRpZgogCQlyZXR1cm4gYW1kZ3B1X2RjICE9
IDA7CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDhhZjc1MDFiZGVk
MS4uOThjZGYzZWNjYWVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTc2Nyw2
ICs3NjcsMTIgQEAgaW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzZG1hX3Y0XzBfaXBf
YmxvY2spOwogCQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jp
b3ZfdmYoYWRldikpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZGNlX3Zp
cnR1YWxfaXBfYmxvY2spOworI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfREMpCisgICAgICAg
ICAgICAgICAgZWxzZSBpZiAoYW1kZ3B1X2RldmljZV9oYXNfZGNfc3VwcG9ydChhZGV2KSkKKyAg
ICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZk
bV9pcF9ibG9jayk7CisjZWxzZQorIyAgICAgICB3YXJuaW5nICJFbmFibGUgQ09ORklHX0RSTV9B
TURfREMgZm9yIGRpc3BsYXkgc3VwcG9ydCBvbiBTT0MxNS4iCisjZW5kaWYKIAkJYW1kZ3B1X2Rl
dmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZjbl92Ml8wX2lwX2Jsb2NrKTsKIAkJYnJlYWs7CiAJ
ZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
