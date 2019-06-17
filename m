Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30249019
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300289F35;
	Mon, 17 Jun 2019 19:47:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1602089F08
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:57 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c11so6977647qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fAevkftNTfeoJDCE58XrQlTNTkXKNMwZdWlaP7q50oE=;
 b=tj4gb/EmkO1Koa7fFprtpCegwA/4Mx3gZ3fg+SbYHQIOZ49qmgxO1JiMPVcHOJyDwl
 E0Sl5ojJjjXn4ckxhY7nVN5sQv+K657fr9g/QivpxFFbC/ARBFXtuwTBZBt2QUxdOPSR
 GuP5dyzFhfydBhrjw4lWmTm19dHSYMTNuuAKOV/s83+GkR7uST9Q1UR9ieh7SPoOgcd9
 /LPTU5diOsr9yvtgsvBz/j4ZyyDjpWQR1IaEHWIevaikf0LEA4iJOHt9gETQuAfNyKa7
 H3WplZ8G9aunApP3Pl6wqQ71rTTn6Ttr+xYpojrcsdEGbY6dY3tja9cIxRRX3PzO5oXm
 oN+g==
X-Gm-Message-State: APjAAAXhF+K/bo6e3096/+alU3a2WgG+NffbF4WuPcQdWGWml/ARO2ja
 Go3RJ8uqrruOYFQ8GOQNn+S0M2XnDeI0ig==
X-Google-Smtp-Source: APXvYqxvTxBpfuxbICTqPb5CPG064HVsSa6Fs4hMqjxAugB5EwRTScYygFN/8huu7SuVlauNyFKSww==
X-Received: by 2002:ae9:ea06:: with SMTP id f6mr16452172qkg.262.1560800816038; 
 Mon, 17 Jun 2019 12:46:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 359/459] drm/amd/display: navi10 bring up skip dsc encoder
 config
Date: Mon, 17 Jun 2019 14:45:00 -0500
Message-Id: <20190617194540.18497-60-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fAevkftNTfeoJDCE58XrQlTNTkXKNMwZdWlaP7q50oE=;
 b=iFiGC6BVRKex0Tt/4vGDDcndBtUZLVVlvkaCn4IVa9su5lAWMygRbEzp5a5g+yNRBb
 gQG3i4Uhka8dYXo3u3jV6Tz1543eFuXalqFGJLoFlHsP1cMJ1zKP+/Brr21dzhVpHzYW
 UpKhJfm1EPv421vMJl0kTlazn4nnymkXc6Eo1wLBwS0Wxgzp9kAGh6OMh14VCwSWG3v3
 EidfrdQHkTZqc7qU6PEwymvM9yJr+xWyYmGbvlu0kVUaY7IHb9lknOKrqZ2Zt9akQtIZ
 pFyyGiXAKvQICLmmuk5saT1KdtmmDZ2xT938AH2B3K+l4ZKtyTJ3o0yl8cd1Avkm8RoJ
 vpiw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKU2lnbmVkLW9mZi1ieTogaGVy
c2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfc3RyZWFtX2VuY29kZXIuYyAgIHwgOCArKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggYzNjMjE4
ODA1ZWIxLi4xMzBiMDE4MDFhMjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jCkBAIC0yODYsNiAr
Mjg2LDE0IEBAIHN0YXRpYyB2b2lkIGVuYzJfZHBfc2V0X2RzY19jb25maWcoc3RydWN0IHN0cmVh
bV9lbmNvZGVyICplbmMsCiAJCQkJCXVpbnQ4X3QgKmRzY19wYWNrZWRfcHBzKQogewogCXN0cnVj
dCBkY24xMF9zdHJlYW1fZW5jb2RlciAqZW5jMSA9IERDTjEwU1RSRU5DX0ZST01fU1RSRU5DKGVu
Yyk7CisJdWludDMyX3QgZHNjX3ZhbHVlID0gMDsKKworCWRzY192YWx1ZSA9IFJFR19SRUFEKERQ
X0RTQ19DTlRMKTsKKworCS8qIGRzYyBkaXNhYmxlIHNraXAgKi8KKwlpZiAoKGRzY192YWx1ZSAm
IDB4MykgPT0gMHgwKQorCQlyZXR1cm47CisKIAogCVJFR19VUERBVEVfMihEUF9EU0NfQ05UTCwK
IAkJCURQX0RTQ19NT0RFLCBkc2NfbW9kZSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
