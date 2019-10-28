Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDF5E7B8E
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Oct 2019 22:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2DB6EAA3;
	Mon, 28 Oct 2019 21:43:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADC16EAA3
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Oct 2019 21:43:10 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id b2so54964ybr.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Oct 2019 14:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qucmBK8296Afdjp1xdtDTe1Y7Yf+ZSue6Gan8Ja2z+8=;
 b=BAR0r1LHk8RY4RdxW3OzD9z1RJ04CBhTMfLulv5Eua+XkT48YHQF/CRp45kzZD+jJu
 +lZGQLpaAfgXz29I6bpOL1MvnjHUxVJfN5GcAyClwGZzS8b77B2LVT0rJcSc61Fq3IOL
 CmD6KvFDRv/Bdf1CT/yw1Ii4R2Z6G2sStAlXz/AA/DYp8m0wROD07rhMtiBL+iEHBXIe
 gsIG8vSiGZA/ZPmgDt9NAIT3aPr7LyhChtXbbUY2P5vgAbSmKpQJC1AK04H+z8ZtPxGk
 goFzaTFkLW6+vZpyWJh6wSnIf25mX/AfGGM5nH8w/yPqt3i3tcEmLdfrCvvaLvgvkoyt
 rbWQ==
X-Gm-Message-State: APjAAAW0epSjHLdqPkyjAmIsYgaCL8FVFllEBXu7c4mEvqWV1fRx9ykC
 r4KTBHJo79LItYCSWc6V/xgswsZ4RoE=
X-Google-Smtp-Source: APXvYqwXA1cwOWR46RFBa9t7RraBeNXdAhOh/cb2amOGjqWzhsI86cX2qFq8MQwbb/KaG2ppnIGN4A==
X-Received: by 2002:a25:80c1:: with SMTP id c1mr16075831ybm.195.1572298989667; 
 Mon, 28 Oct 2019 14:43:09 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Subject: [PATCH 06/21] drm/amdgpu: add supports_baco callback for VI asics.
Date: Mon, 28 Oct 2019 17:42:01 -0400
Message-Id: <20191028214216.1508370-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qucmBK8296Afdjp1xdtDTe1Y7Yf+ZSue6Gan8Ja2z+8=;
 b=AqHCmSMnEk7GaUGG8kP+OTr5LZdzBxqYZ5pj0zJd51A+VNv7Q22zwBThgHPpzxIKH2
 HoUjmwSFAnL3buNogPZjwnttstf7c9PpMEGLiUDVVfphS3uilS1QzeLWwuhhM/JS7VQZ
 vMDT/hD5vPwpmYTzr1ynIqG7Tck7OYLKZGqUznTdNIKR4+JQVbF58f9pc+dT26lExvQO
 cvR54gU6MvpU3kEOGhZZY9A3AM8Y9nJlYgyBnQct/yEMzNjgySiRQfptLDevYXtB9uOO
 wzxRwlejDlDvTufgYfcl8jmuRA7cXFkwUjthIZrCAP3KMlr2m7i8ngZeK1kLpe729ZDK
 KO0w==
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

QkFDTyAtIEJ1cyBBY3RpdmUsIENoaXAgT2ZmCgpDaGVjayB0aGUgQkFDTyBjYXBhYmlsaXRpZXMg
ZnJvbSB0aGUgcG93ZXJwbGF5IHRhYmxlLgoKUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jIHwgMjIgKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmkuYwppbmRleCA3OGU1Y2RjMGMwNTguLjg3MWMwYjhjNmIwYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92aS5jCkBAIC03NDUsNiArNzQ1LDI3IEBAIHN0YXRpYyBpbnQgdmlf
YXNpY19wY2lfY29uZmlnX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVy
biByOwogfQogCitzdGF0aWMgYm9vbCB2aV9hc2ljX3N1cHBvcnRzX2JhY28oc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCit7CisJYm9vbCBiYWNvX3N1cHBvcnQ7CisKKwlzd2l0Y2ggKGFkZXYt
PmFzaWNfdHlwZSkgeworCWNhc2UgQ0hJUF9GSUpJOgorCWNhc2UgQ0hJUF9UT05HQToKKwljYXNl
IENISVBfUE9MQVJJUzEwOgorCWNhc2UgQ0hJUF9QT0xBUklTMTE6CisJY2FzZSBDSElQX1BPTEFS
SVMxMjoKKwljYXNlIENISVBfVE9QQVo6CisJCXNtdTdfYXNpY19nZXRfYmFjb19jYXBhYmlsaXR5
KGFkZXYsICZiYWNvX3N1cHBvcnQpOworCQlicmVhazsKKwlkZWZhdWx0OgorCQliYWNvX3N1cHBv
cnQgPSBmYWxzZTsKKwkJYnJlYWs7CisJfQorCisJcmV0dXJuIGJhY29fc3VwcG9ydDsKK30KKwog
c3RhdGljIGVudW0gYW1kX3Jlc2V0X21ldGhvZAogdmlfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CkBAIC0xMTE2LDYgKzExMzcsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGFtZGdwdV9hc2ljX2Z1bmNzIHZpX2FzaWNfZnVuY3MgPQogCS5nZXRfcGNpZV91
c2FnZSA9ICZ2aV9nZXRfcGNpZV91c2FnZSwKIAkubmVlZF9yZXNldF9vbl9pbml0ID0gJnZpX25l
ZWRfcmVzZXRfb25faW5pdCwKIAkuZ2V0X3BjaWVfcmVwbGF5X2NvdW50ID0gJnZpX2dldF9wY2ll
X3JlcGxheV9jb3VudCwKKwkuc3VwcG9ydHNfYmFjbyA9ICZ2aV9hc2ljX3N1cHBvcnRzX2JhY28s
CiB9OwogCiAjZGVmaW5lIENaX1JFVl9CUklTVE9MKHJldikJIFwKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
