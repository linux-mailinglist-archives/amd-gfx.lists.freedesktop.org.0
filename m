Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E412CE88C
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 18:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1B76E151;
	Mon,  7 Oct 2019 16:03:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974F86E151
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 16:03:07 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u184so13093727qkd.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 07 Oct 2019 09:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QacsuuPQA7FEhuUswjypqAfB6V0DovY6lzvnojq2qCE=;
 b=otGuCfhhcYpi5afjFH3w4zVmvUlG2+F9jvnljly+BpIjP0ZaLAb8uA9wxB9FCdVnR6
 bE1iIeNe4t3tfXAIr1kPjl4syTdEjY/czhvTZr0Blgb5e3T882hf8EkKOkc3KnlO0x6f
 m50J5/GgpXa2gPkOGAMmXQfgLJqK1nWUza8OO7pn/yZGHMBT/BrvA9iY6ZOXx8qxcmZy
 GM2X9nJjQFZYGkrYU8Eqkln5FAT8qGLL7s+Q26ChUHcZzCf19A5q/0p4e9gdhl7A4k+F
 d5qxUA0O3Zo+s+ufFkPhJeXTqhJnx4L+ppKn0sdMfQKh5qYWWgLxgasgrwy/B1YDG9cS
 QhMw==
X-Gm-Message-State: APjAAAXdzY8UrMlfZLuLLqBwHQSZE0yiXODKCvPaja0wXgkjI0SAUhcO
 UE3Jyc5GSUp8HxO/cKa48yH7fdwD
X-Google-Smtp-Source: APXvYqxMs6ywo5u6N12JhO1BW+NDirVtmF6Lr2/D54IlpIRjb9Lhd/nU8XnEDNvHBDkcJj4Ox/Ev5w==
X-Received: by 2002:a05:620a:5ad:: with SMTP id
 q13mr24268225qkq.297.1570464186401; 
 Mon, 07 Oct 2019 09:03:06 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id 207sm8961568qkh.33.2019.10.07.09.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 09:03:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: move gpu reset out of amdgpu_device_suspend
Date: Mon,  7 Oct 2019 11:02:55 -0500
Message-Id: <20191007160255.24966-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007160255.24966-1-alexander.deucher@amd.com>
References: <20191007160255.24966-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QacsuuPQA7FEhuUswjypqAfB6V0DovY6lzvnojq2qCE=;
 b=uEcG62/0tvD85j6dvU0t2kryhE0E2mqMJrvt45FMRMEm9niGFNlhCBJT7XcwMhf4vV
 +0f/OdTML/pknQdjs14epyQA5sgE2k+ouMfx4qSZkYeCN26EMM+laq1D7OI1ee214acY
 N4nyhQYNKcUmaIJCy9t6OeOPirz5egk/JKebFhk6xOgLecITCENwGa7Lfmo//RqB0jFI
 TFIU+328o1KnVj1hGOungTTpFZRa6gJhC/qAdFmFJMp1zm3A5fJ+ag/4SfW+8w/PmcY4
 5J0Jj8q3YxOmhHlix3ak77P84Onaw9MWBLcgrV/Q32B+xXNV3fjVXNzlbh8uKOic/MFO
 N4cA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TW92ZSBpdCBpbnRvIHRoZSBjYWxsZXIuICBUaGVyZSBhcmUgY2FzZXMgd2VyZSB3ZSBkb24ndAp3
YW50IGl0LiAgV2UgbmVlZCBpdCBmb3IgaGliZXJuYXRpb24sIGJ1dCB3ZSBkb24ndCBuZWVkCml0
IGZvciBydW50aW1lIHBtLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYyB8IDQgLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
ICAgIHwgNyArKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5k
ZXggOWI5YjE1MzYwMTk0Li45MWJkYjI0NmU0MDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTMxNzMsMTAgKzMxNzMsNiBAQCBpbnQgYW1kZ3B1X2Rl
dmljZV9zdXNwZW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgc3VzcGVuZCwgYm9vbCBm
YmNvbikKIAkJLyogU2h1dCBkb3duIHRoZSBkZXZpY2UgKi8KIAkJcGNpX2Rpc2FibGVfZGV2aWNl
KGRldi0+cGRldik7CiAJCXBjaV9zZXRfcG93ZXJfc3RhdGUoZGV2LT5wZGV2LCBQQ0lfRDNob3Qp
OwotCX0gZWxzZSB7Ci0JCXIgPSBhbWRncHVfYXNpY19yZXNldChhZGV2KTsKLQkJaWYgKHIpCi0J
CQlEUk1fRVJST1IoImFtZGdwdSBhc2ljIHJlc2V0IGZhaWxlZFxuIik7CiAJfQogCiAJcmV0dXJu
IDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggZDQzYzQ2ZGU3
ODA3Li42NDE0MTM4NmU2MDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKQEAgLTExMTgsOCArMTExOCwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KQogc3RhdGljIGludCBhbWRncHVfcG1vcHNfZnJlZXplKHN0cnVj
dCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX2Rldi0+ZGV2
X3ByaXZhdGU7CisJaW50IHI7CiAKLQlyZXR1cm4gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9k
ZXYsIGZhbHNlLCB0cnVlKTsKKwlyID0gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9kZXYsIGZh
bHNlLCB0cnVlKTsKKwlpZiAocikKKwkJcmV0dXJuIHI7CisJcmV0dXJuIGFtZGdwdV9hc2ljX3Jl
c2V0KGFkZXYpOwogfQogCiBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc190aGF3KHN0cnVjdCBkZXZp
Y2UgKmRldikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
