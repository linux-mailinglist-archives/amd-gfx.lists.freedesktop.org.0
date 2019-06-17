Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF3648F47
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF8B89BDB;
	Mon, 17 Jun 2019 19:31:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C66489BC2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12223476qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbi6VBLhp0gKWRc4lIXRPHfnmNAuwlJGnz/9dlTojKk=;
 b=nzUobXmtclVQFWRf6ReYPiug2OpxqO6m63nJ4wOMvapgclTdVntuW7O/sFbUqhagx2
 4HlkvGFhKsEXhyq3Rh92Lnx/DZJs/h6hWjDawB6eOYf5g8sXbTjj4rtJ7dqbsv8Ckzue
 JJIpG2//+Xf0wHcVkpFO4OhaeIUMmp4NTW3vaOklh294j3/MX5ztei83s00Dp2ODt8JU
 n4DW613OSIuOnl+ldhE4qBaZS5f7xFKje9SHeaHTirImt+VCvp+P3qB1pXZ/7KgnkG48
 vT/Wp07CfZsXq0gbxaf5feKVT3TIXNdXD1MPJxdoeJuCjROqCl0koLOxdTZB8SpDUpSt
 D6TA==
X-Gm-Message-State: APjAAAXJRWs3g0ndjsQ1EcEXxzDn6P53IOBowto06zGek89+sXz6J08+
 v1+WKLueKZ62wX2Jh/BhfZw3LSCDZ2I=
X-Google-Smtp-Source: APXvYqw+1VGwC2femFgqDMXTA5VTw9Y5b3VhKpm3xCPJ0LiQX0anpnV+P05e4rJSB63h5SnxlutsZA==
X-Received: by 2002:ac8:2f90:: with SMTP id l16mr80758204qta.12.1560799889888; 
 Mon, 17 Jun 2019 12:31:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 218/459] drm/amdgpu/gfx10: fix unbalanced MAP/UNMAP_QUEUES
 when async_gfx_ring is disabled
Date: Mon, 17 Jun 2019 14:29:45 -0500
Message-Id: <20190617193106.18231-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbi6VBLhp0gKWRc4lIXRPHfnmNAuwlJGnz/9dlTojKk=;
 b=Qd7iVd7SZt3e39RFWXzCsnwCKRBktQDAaHxN9EptPVPwB1OwjYGAiugfJhy1S/auLh
 iQT9Ye9e2XOxWHMyVUKv/UKxX3CkGumPJuQGdvoGY6EjyO80hnZZxFr6ivNSCehHZlmk
 VD/agBBC7POjwThr4qxHV1v4gXQK+lQqAvhc/racyVzjEoh3eouC/cX4BiSWzvsslwAe
 X/LRXwH8OGnLz9c/ZN1Ce2lK8klKAfU0IdJEMP8BIzisJ2W+Zzj0qW0j3OmYDeiSr5cm
 5V4ftZyQ2J8HTt0zOSU4ekwWm2yRpUtZxhDyZwYS2n7fCJowp2hd3a9LbYlJoDspSRNe
 65OQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCmdmeF92MTBfMF9raXFf
ZW5hYmxlX2tncSgpIGlzIGNhbGxlZCBvbmx5IHdoZW4gYXN5bmNfZ2Z4X3JpbmcgaXMKZW5hYmxl
ZCwgc28gc2hvdWxkIGdmeF92MTBfMF9raXFfZGlzYWJsZV9rZ3EoKS4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CkFja2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEph
Y2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMgfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggNjI4
OWQ3OWU4YjY1Li43MTY0NjczODhjMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTBfMC5jCkBAIC0zNTYzLDcgKzM1NjMsNyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9od19pbml0
KHZvaWQgKmhhbmRsZSkKIH0KIAogI2lmbmRlZiBCUklOR19VUF9ERUJVRwotc3RhdGljIGludCBn
ZngxMF8wX2Rpc2FibGVfa2dxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQorc3RhdGljIGlu
dCBnZnhfdjEwXzBfa2lxX2Rpc2FibGVfa2dxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
ewogCXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsKIAlzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsICpraXFfcmluZyA9ICZraXEtPnJpbmc7CkBAIC0zNjEyLDEyICszNjEy
LDE2IEBAIHN0YXRpYyBpbnQgZ2Z4MTBfMF9kaXNhYmxlX2tncShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQogewog
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFu
ZGxlOworCWludCByOwogCiAJYW1kZ3B1X2lycV9wdXQoYWRldiwgJmFkZXYtPmdmeC5wcml2X3Jl
Z19pcnEsIDApOwogCWFtZGdwdV9pcnFfcHV0KGFkZXYsICZhZGV2LT5nZngucHJpdl9pbnN0X2ly
cSwgMCk7CiAjaWZuZGVmIEJSSU5HX1VQX0RFQlVHCi0JaWYgKGdmeDEwXzBfZGlzYWJsZV9rZ3Eo
YWRldikpCi0JCURSTV9FUlJPUigiS0dRIGRpc2FibGUgZmFpbGVkXG4iKTsKKwlpZiAoYW1kZ3B1
X2FzeW5jX2dmeF9yaW5nKSB7CisJCXIgPSBnZnhfdjEwXzBfa2lxX2Rpc2FibGVfa2dxKGFkZXYp
OworCQlpZiAocikKKwkJCURSTV9FUlJPUigiS0dRIGRpc2FibGUgZmFpbGVkXG4iKTsKKwl9CiAj
ZW5kaWYKIAlpZiAoYW1kZ3B1X2dmeF9kaXNhYmxlX2tjcShhZGV2KSkKIAkJRFJNX0VSUk9SKCJL
Q1EgZGlzYWJsZSBmYWlsZWRcbiIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
