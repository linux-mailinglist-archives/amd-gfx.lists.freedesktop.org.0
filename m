Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D092B56CF
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 22:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380E66ED45;
	Tue, 17 Sep 2019 20:20:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873B46ED45
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 20:20:55 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d2so6093124qtr.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 13:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTy6fX1xeeOYRC8Jne6gpAGN1Agviiu8w/fmK0t1+Dc=;
 b=euig4DUGx+j3QcGDRw7hnalnvhLxgiWr8l0E5zcuGuR4zFnp567xtr63EzkiiMjDUu
 b5SrR+RcQVVOUA24+hkudScSWvqlTuqG5sPgi6L/Op7a9Fm/EJNWrCRPPDk2ov5u0DMh
 pBU1P2L0LWIzHAoGlMjCbmHYyAR9IZjsB1sxduJR/1eggbYjiz1ChdcfcyYJtnxIGrPo
 Rv09FmSctRJWiMbbLH6pYkyVs7wuFgEnCNF5t+7YAQ/41s3vBxjHocdWhBd2fqiu76ZT
 Kb1RK1ZZFnLWLmw5+cJ/lNqn//My1owRJzA/+XWvr3iDxIYgD7OZ9tFF886AlNJrchXZ
 E/3w==
X-Gm-Message-State: APjAAAVebG4DbfMNR7kU1HdW6eaEJdP3pBTFpT7feAgL+YNMeTddiuYS
 0XjRQXji9mnlPL4XY92VU/ZSYvxb
X-Google-Smtp-Source: APXvYqy6eV5PMeKbUQjzOgixaWrSa/ER6iZ8aBrtY27D33Fo3CA5A5VUPPAZ8PaIIxEzD9Z01qRbNw==
X-Received: by 2002:ac8:3927:: with SMTP id s36mr688596qtb.215.1568751654355; 
 Tue, 17 Sep 2019 13:20:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id l23sm2755325qta.53.2019.09.17.13.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 13:20:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/psp: flush HDP write fifo after submitting
 cmds to the psp
Date: Tue, 17 Sep 2019 15:20:45 -0500
Message-Id: <20190917202046.26634-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTy6fX1xeeOYRC8Jne6gpAGN1Agviiu8w/fmK0t1+Dc=;
 b=EaFjgabISe59cgUuGZv5WAcVSuuiU1+nrAOzMhJ8tPqRa8cAbv3vJjkas3qlFobSrR
 3an9EoHmxy/LMwXhzXcJmJBeerWqVI8KrvJiwGw/lyq7FWwfJg9zVGDGTNHTiKTxjg5D
 qewl6QaHu653DXprkfat80gIFC2RuePmwLFuD3C3mT0EDu9DHS0hC5ExciFglI72I70S
 dGLXCzFYa+rkfXg9KRjp9oRYEN+89+HQWOJCm00OdSOiIXeL6oxSCnKD6rqK3ujB8oLA
 towAS77U2+yszs4YYtiM4yrWaF3o8kCapgWuQ1kGIVZeS3cHgI5cYYKOHdOFTXPM6DZq
 pZqw==
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

V2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIGZpZm8gaXMgZmx1c2hlZCBiZWZvcmUgd2UgYXNrIHRo
ZSBwc3AgdG8KcHJvY2VzcyB0aGUgY29tbWFuZHMuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvcHNwX3YxMF8wLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92
MTFfMC5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEyXzAuYyB8IDEg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyAgfCAxICsKIDQgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvcHNwX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEw
XzAuYwppbmRleCA2ZWUzM2YzNjhlMjEuLmI5NjQ4NGE3MjUzNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvcHNwX3YxMF8wLmMKQEAgLTI2Niw2ICsyNjYsNyBAQCBzdGF0aWMgaW50IHBzcF92
MTBfMF9jbWRfc3VibWl0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCXdyaXRlX2ZyYW1lLT5m
ZW5jZV9hZGRyX2hpID0gdXBwZXJfMzJfYml0cyhmZW5jZV9tY19hZGRyKTsKIAl3cml0ZV9mcmFt
ZS0+ZmVuY2VfYWRkcl9sbyA9IGxvd2VyXzMyX2JpdHMoZmVuY2VfbWNfYWRkcik7CiAJd3JpdGVf
ZnJhbWUtPmZlbmNlX3ZhbHVlID0gaW5kZXg7CisJYW1kZ3B1X2FzaWNfZmx1c2hfaGRwKGFkZXYs
IE5VTEwpOwogCiAJLyogVXBkYXRlIHRoZSB3cml0ZSBQb2ludGVyIGluIERXT1JEcyAqLwogCXBz
cF93cml0ZV9wdHJfcmVnID0gKHBzcF93cml0ZV9wdHJfcmVnICsgcmJfZnJhbWVfc2l6ZV9kdykg
JSByaW5nX3NpemVfZHc7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9w
c3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCmluZGV4
IDY0ODAyZTg4YTlhMi4uMDQzMThjZmQ1MGE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9w
c3BfdjExXzAuYwpAQCAtNTQ5LDYgKzU0OSw3IEBAIHN0YXRpYyBpbnQgcHNwX3YxMV8wX2NtZF9z
dWJtaXQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsCiAJd3JpdGVfZnJhbWUtPmZlbmNlX2FkZHJf
aGkgPSB1cHBlcl8zMl9iaXRzKGZlbmNlX21jX2FkZHIpOwogCXdyaXRlX2ZyYW1lLT5mZW5jZV9h
ZGRyX2xvID0gbG93ZXJfMzJfYml0cyhmZW5jZV9tY19hZGRyKTsKIAl3cml0ZV9mcmFtZS0+ZmVu
Y2VfdmFsdWUgPSBpbmRleDsKKwlhbWRncHVfYXNpY19mbHVzaF9oZHAoYWRldiwgTlVMTCk7CiAK
IAkvKiBVcGRhdGUgdGhlIHdyaXRlIFBvaW50ZXIgaW4gRFdPUkRzICovCiAJcHNwX3dyaXRlX3B0
cl9yZWcgPSAocHNwX3dyaXRlX3B0cl9yZWcgKyByYl9mcmFtZV9zaXplX2R3KSAlIHJpbmdfc2l6
ZV9kdzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTJfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMl8wLmMKaW5kZXggYzcyZTQzZjhl
MGJlLi44ZjU1M2Y2ZjkyZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3BzcF92MTJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTJfMC5j
CkBAIC0zNzgsNiArMzc4LDcgQEAgc3RhdGljIGludCBwc3BfdjEyXzBfY21kX3N1Ym1pdChzdHJ1
Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAl3cml0ZV9mcmFtZS0+ZmVuY2VfYWRkcl9oaSA9IHVwcGVy
XzMyX2JpdHMoZmVuY2VfbWNfYWRkcik7CiAJd3JpdGVfZnJhbWUtPmZlbmNlX2FkZHJfbG8gPSBs
b3dlcl8zMl9iaXRzKGZlbmNlX21jX2FkZHIpOwogCXdyaXRlX2ZyYW1lLT5mZW5jZV92YWx1ZSA9
IGluZGV4OworCWFtZGdwdV9hc2ljX2ZsdXNoX2hkcChhZGV2LCBOVUxMKTsKIAogCS8qIFVwZGF0
ZSB0aGUgd3JpdGUgUG9pbnRlciBpbiBEV09SRHMgKi8KIAlwc3Bfd3JpdGVfcHRyX3JlZyA9IChw
c3Bfd3JpdGVfcHRyX3JlZyArIHJiX2ZyYW1lX3NpemVfZHcpICUgcmluZ19zaXplX2R3OwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMKaW5kZXggZDJjNzI3ZjZhOGJkLi5mZGMwMDkz
ODMyN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYwpAQCAtNDU0LDYgKzQ1
NCw3IEBAIHN0YXRpYyBpbnQgcHNwX3YzXzFfY21kX3N1Ym1pdChzdHJ1Y3QgcHNwX2NvbnRleHQg
KnBzcCwKIAl3cml0ZV9mcmFtZS0+ZmVuY2VfYWRkcl9oaSA9IHVwcGVyXzMyX2JpdHMoZmVuY2Vf
bWNfYWRkcik7CiAJd3JpdGVfZnJhbWUtPmZlbmNlX2FkZHJfbG8gPSBsb3dlcl8zMl9iaXRzKGZl
bmNlX21jX2FkZHIpOwogCXdyaXRlX2ZyYW1lLT5mZW5jZV92YWx1ZSA9IGluZGV4OworCWFtZGdw
dV9hc2ljX2ZsdXNoX2hkcChhZGV2LCBOVUxMKTsKIAogCS8qIFVwZGF0ZSB0aGUgd3JpdGUgUG9p
bnRlciBpbiBEV09SRHMgKi8KIAlwc3Bfd3JpdGVfcHRyX3JlZyA9IChwc3Bfd3JpdGVfcHRyX3Jl
ZyArIHJiX2ZyYW1lX3NpemVfZHcpICUgcmluZ19zaXplX2R3OwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
