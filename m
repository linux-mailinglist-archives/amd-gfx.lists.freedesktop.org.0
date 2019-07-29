Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980EA7998C
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC196E296;
	Mon, 29 Jul 2019 20:15:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0CA6E237
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:33 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id m23so41887060vso.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uC0NisGryTfwvLXJ5mHkI03jaTWEVMwmlmklTvhY3Wc=;
 b=PgGByWQyeXM+0a7leKTZxlPC9y6OThytULghppcbkc4zVEx/IfBHHoTl11+XIqBCZY
 V76cN7GGTJrdBWte3dgGCifsSAbIpaLQsln62ZmhAgJcjhqU9S7NGHdYNXXf+ei0V97m
 J4nVdSO/fEO1aeCLV59yekJrIiMkPWoAY7ycVwsPlulZrIER0Vu3iyQ9kpiovTi6o1TA
 6FNjA7fPz95A0iU3zvtsg404XfMIZSw/wKSSwLQvc4kv+NKFQa1oBCNNecqnJ9pqSa4m
 CO2L96gRUi8px4zzgHmaFNX811xHkeaXUnuW/0klEXi628sD32vQpQhLCt4aipjn/pcY
 R9uA==
X-Gm-Message-State: APjAAAWxdZQWfh49OgPCCGJ31QvEiB3oUOCal4CLV+uZSEjyS0WjlqVB
 s454/hUGopLf/4orkY4FDV9VwOiJ
X-Google-Smtp-Source: APXvYqwaKtFZLB5jF2WLI0aV2S1nZXIOPSr9bYMOD3qGVFI7HsDblg/5iXE2qSjNCd+rhmJX19MKIg==
X-Received: by 2002:a67:2704:: with SMTP id n4mr7489537vsn.202.1564431331790; 
 Mon, 29 Jul 2019 13:15:31 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/30] drm/amd/powerplay: add new sensor type for VCN
 powergate status
Date: Mon, 29 Jul 2019 15:14:51 -0500
Message-Id: <20190729201508.16136-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uC0NisGryTfwvLXJ5mHkI03jaTWEVMwmlmklTvhY3Wc=;
 b=I8A00HypL3iavQO5nIjltJcGNyWlezzpYxM0jDn0HNrAxO2QarODOPsIb/EeAHzXAj
 j/+0n1VVcKyMZPDncVPow8LW+nBUmppvdPFtdKAqm6J+Vu9tDOM9fehqzmRPuw7NDuiN
 SP/ROPqSB3qzzmJWhUbR0wQC1XpmTZFPi2mPoAEtW9DDp8B0jMUxmgZDt9eYIb1NbJPN
 XOfseuQFg+aL0xPtopaVxQGQT5Ljh5KOeGBu1kNNe/EIkDPmIixiD/mbAGLSq0HPM2jd
 pI+esZf18Gyb9wWJr9/awT0sGatfz8S2AvJ/NUo9jUfWhAZnZXDaj56YQUD6VcKTiwLr
 PBgA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClZDTiBpcyB3aWRlbHkgdXNlZCBp
biBuZXcgQVNJQ3MgYW5kIGRpZmZlcmVudCBmcm9tIHRyYW5kaXRpb25hbApVVkQgYW5kIFZDRS4K
ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tn
ZF9wcF9pbnRlcmZhY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50
ZXJmYWNlLmgKaW5kZXggOTVlZGMzZDNhOWM0Li5iYmExMjkxYWU0MDUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaApAQCAtMTIzLDYgKzEyMyw3
IEBAIGVudW0gYW1kX3BwX3NlbnNvcnMgewogCUFNREdQVV9QUF9TRU5TT1JfRU5BQkxFRF9TTUNf
RkVBVFVSRVNfTUFTSywKIAlBTURHUFVfUFBfU0VOU09SX01JTl9GQU5fUlBNLAogCUFNREdQVV9Q
UF9TRU5TT1JfTUFYX0ZBTl9SUE0sCisJQU1ER1BVX1BQX1NFTlNPUl9WQ05fUE9XRVJfU1RBVEUs
CiB9OwogCiBlbnVtIGFtZF9wcF90YXNrIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
