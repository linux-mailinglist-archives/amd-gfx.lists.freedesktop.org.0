Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392594904B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE97A6E03E;
	Mon, 17 Jun 2019 19:49:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83236E03E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:49:58 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c70so6984016qkg.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2q0fGEEseo5+xxOKkdU6M0NcSKc/v87P/FZuCf2xSB4=;
 b=UEoJ6/qQ2NkaR9lmQK2yu/fxhEuvlytKjcV8Vg6qbz/3OxLe4PMhafgoRpLZWvilYg
 QvpMtETagJsnyOrejsDt8B6gQScVHXwDtNnVCvIrinT/OpRDKeZg/XETMssfHG1xX+6p
 mW+KjglGbL3I+8eePAAfXLXYK5r0mT9k9b44lJ1H1QiffUzP9oJqBfDZqizB+nTRrb1s
 5t6YH7vaA5mS34wiUVqND4BDRo/WMcSR9mM05QghaJW2iyNy7m30nSh9wexMb1UTnWdt
 lf9HUD/4WUo5WnQrceVq2f+eiDxXN2x+c4FW0vHXLHUYSbYtFhWdzO0dgzxpdC+hEdR0
 niqw==
X-Gm-Message-State: APjAAAUkr7h7yq3wkceULQKZUCDZUqJ+aef/4fZwIYJIWnmsduT5neOd
 z8ozgORZOw80YQ2tYzFRupbgZ7uXK2U5rw==
X-Google-Smtp-Source: APXvYqxQn6DT8K2CvFj4358eJLSPGCUMwEXohrvB02rZEN/xI7GiKrl3AtGtwogfju6UbgHAtlvSWw==
X-Received: by 2002:a05:620a:1256:: with SMTP id
 a22mr25775889qkl.96.1560800997935; 
 Mon, 17 Jun 2019 12:49:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.49.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:49:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 402/459] drm/amd/display: fix dcn2 mpc split decision
Date: Mon, 17 Jun 2019 14:48:51 -0500
Message-Id: <20190617194948.18667-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2q0fGEEseo5+xxOKkdU6M0NcSKc/v87P/FZuCf2xSB4=;
 b=bE1oD8Juhd+PjZZ/5Ucf7u0RJtiazBJnm/AQv819iMc6WyfvvTWIQ5aWArEjumEb3M
 SFIo8UJYlC5pd2dDD+pdMbaryEymukZWv9IZV4BLdE2d3u7YbuvK1WsAxGkZcejFIMn4
 xtTh8DL0aqlhCvjdgLXOyFNJlG8qJKvZa0l5UYd7/3clC5CiaDfFxCRBcCPX9eC1attZ
 COfYZvrTEmd0dLhM+7jvhCW/BJbqSDmo1ED7Am8QeLbTDFzv9enChGgYJdKfo/DVcFWi
 2ZZ1lVbwOGPAkyFtMRB7E48+eF+DJAgdrxraWFty6k3Gbec6xoooDRn2CUy33QiYk+Qi
 k4KA==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClRo
ZSBzcGxpdCBjb25kaXRpb24gaXMgYnJva2VuIGFuZCB3aWxsIGFsd2F5cyBhY3RpdmF0ZQphdCB0
aGUgbW9tZW50LgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFr
dHl1c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4K
QWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpBY2tlZC1ieTogSGF3a2luZyBa
aGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDBhMTFkMTA5OGE3ZS4u
Y2VlZTBkNmIzYzI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjEwMyw3ICsyMTAzLDcgQEAgYm9vbCBkY24y
MF92YWxpZGF0ZV9iYW5kd2lkdGgoc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpjb250
ZXh0LAogCQkJdmxldmVsID0gdmxldmVsX3Vuc3BsaXQ7CiAJCQljb250ZXh0LT5id19jdHguZG1s
LnZiYS5tYXhNcGNDb21iID0gMDsKIAkJfSBlbHNlCi0JCQluZWVkX3NwbGl0ID0gY29udGV4dC0+
YndfY3R4LmRtbC52YmEuTm9PZkRQUFt2bGV2ZWxdW2NvbnRleHQtPmJ3X2N0eC5kbWwudmJhLm1h
eE1wY0NvbWJdW3BpcGVfaWR4XTsKKwkJCW5lZWRfc3BsaXQgPSBjb250ZXh0LT5id19jdHguZG1s
LnZiYS5Ob09mRFBQW3ZsZXZlbF1bY29udGV4dC0+YndfY3R4LmRtbC52YmEubWF4TXBjQ29tYl1b
cGlwZV9pZHhdID09IDI7CiAKIAkJaWYgKG5lZWRfc3BsaXQzZCB8fCBuZWVkX3NwbGl0IHx8IGZv
cmNlX3NwbGl0KSB7CiAJCQlpZiAoIWhzcGxpdF9waXBlIHx8IGhzcGxpdF9waXBlLT5wbGFuZV9z
dGF0ZSAhPSBwaXBlLT5wbGFuZV9zdGF0ZSkgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
